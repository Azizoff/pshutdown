unit CmnFunct;

interface
uses
  Windows, SysUtils;
type
  TCMDParams = record
    enabled: Boolean;
    mode: Byte;
    time: Int64;
    started: Boolean;
    minimized: Boolean;
    extparam: string;
  end;


  function GetParamStr(const P: PChar; var Param: String): PChar;
  function ProcessCommandLine():TCMDParams;
  procedure SplitNewParamStr(const Index: Integer; var AName, AValue: String);
  function PathPos(Ch: Char; const S: String): Integer;
  function PathCharLength(const S: String; const Index: Integer): Integer;
  function NewParamStr(Index: Integer): string;
  function NewParamCount: Integer;


implementation

function GetParamStr(const P: PChar; var Param: String): PChar;

  function Extract(P: PChar; const Buffer: PChar; var Len: Integer): PChar;
  var
    InQuote: Boolean;
  begin
    Len := 0;
    InQuote := False;
    while (P^ <> #0) and ((P^ > ' ') or InQuote) do begin
      if P^ = '"' then
        InQuote := not InQuote
      else begin
        if Assigned(Buffer) then
          Buffer[Len] := P^;
        Inc(Len);
      end;
      Inc(P);
    end;
    Result := P;
  end;

var
  Len: Integer;
  Buffer: String;
begin
  Extract(P, nil, Len);
  SetString(Buffer, nil, Len);
  Result := Extract(P, @Buffer[1], Len);
  Param := Buffer;
  while (Result^ <> #0) and (Result^ <= ' ') do
    Inc(Result);
end;

function NewParamCount: Integer;
var
  P: PChar;
  S: String;
begin
  P := GetParamStr(GetCommandLine, S);
  Result := 0;
  while P^ <> #0 do begin
    Inc(Result);
    P := GetParamStr(P, S);
  end;
end;

function NewParamStr(Index: Integer): string;
{ Returns the Indexth command line parameter, or an empty string if Index is
  out of range.
  Differences from Delphi's ParamStr:
  - No limits on parameter length
  - Doesn't ignore empty parameters ("")
  - Handles the empty argv[0] case like MSVC: if GetCommandLine() returns
    " a b" then NewParamStr(1) should return "a", not "b" }
var
  Buffer: array[0..MAX_PATH-1] of Char;
  S: String;
  P: PChar;
begin
  if Index = 0 then begin
    SetString(Result, Buffer, GetModuleFileName(0, Buffer, SizeOf(Buffer) div SizeOf(Buffer[0])));
  end
  else begin
    P := GetCommandLine;
    while True do begin
      if P^ = #0 then begin
        S := '';
        Break;
      end;
      P := GetParamStr(P, S);
      if Index = 0 then Break;
      Dec(Index);
    end;
    Result := S;
  end;
end;

function PathCharLength(const S: String; const Index: Integer): Integer;
{ Returns the length in bytes of the character at Index in S.
  Notes:
  1. If Index specifies the last character in S, 1 will always be returned,
     even if the last character is a lead byte.
  2. If a lead byte is followed by a null character (e.g. #131#0), 2 will be
     returned. This mimics the behavior of MultiByteToWideChar and CharPrev,
     but not CharNext(P)-P, which would stop on the null. }
begin
  {$IFNDEF UNICODE}
  if IsDBCSLeadByte(Ord(S[Index])) and (Index < Length(S)) then
    Result := 2
  else
  {$ENDIF}
    Result := 1;
end;

function PathPos(Ch: Char; const S: String): Integer;
{ This is an MBCS-aware Pos function. }
var
  Len, I: Integer;
begin
  Len := Length(S);
  I := 1;
  while I <= Len do begin
    if S[I] = Ch then begin
      Result := I;
      Exit;
    end;
    Inc(I, PathCharLength(S, I));
  end;
  Result := 0;
end;

procedure SplitNewParamStr(const Index: Integer; var AName, AValue: String);
{ Reads a command line parameter. If it is in the form "/PARAM=VALUE" then
  AName is set to "/PARAM=" and AValue is set to "VALUE". Otherwise, the full
  parameter is stored in AName, and AValue is set to an empty string. }
var
  S: String;
  P: Integer;
begin
  S := NewParamStr(Index);
  if (S <> '') and (S[1] = '/') then begin
    P := PathPos('=', S);
    if P <> 0 then begin
      AName := Copy(S, 1, P);
      AValue := Copy(S, P+1, Maxint);
      Exit;
    end;
  end;
  AName := S;
  AValue := '';
end;

function ProcessCommandLine():TCMDParams;
var
  WantToSuppressMsgBoxes: Boolean;
  I: Integer;
  ParamName, ParamValue: String;
begin
  Result.enabled := False;
  Result.mode := 254;
  Result.time := 0;
  Result.started := True;
  Result.minimized := False;
  for I := 1 to NewParamCount do
  begin
    SplitNewParamStr(I, ParamName, ParamValue);
    if CompareText(ParamName, '/s') = 0 then
    begin
      Result.mode := 0;
    end
    else
    if CompareText(ParamName, '/r') = 0 then
    begin
      Result.mode := 1;
    end
    else
    if CompareText(ParamName, '/l') = 0 then
    begin
      Result.mode := 2;
    end
    else
    if CompareText(ParamName, '/sm') = 0 then
    begin
      Result.mode := 3;
    end
    else
    if CompareText(ParamName, '/som') = 0 then
    begin
      Result.mode := 4;
    end
    else
    if CompareText(ParamName, '/rp=') = 0 then
    begin
      Result.mode := 5;
      Result.extparam := ParamValue;
    end
    else
    if CompareText(ParamName, '/rp') = 0 then
    begin
      Result.mode := 5;
    end
    else
    if CompareText(ParamName, '/ra=') = 0 then
    begin
      Result.mode := 6;
      Result.extparam := ParamValue;
    end
    else
    if CompareText(ParamName, '/ra') = 0 then
    begin
      Result.mode := 6;
    end
    else
    if CompareText(ParamName, '/m=') = 0 then
    begin
      Result.mode := 7;
      Result.extparam := ParamValue;
    end
    else
    if CompareText(ParamName, '/m') = 0 then
    begin
      Result.mode := 7;
    end
    else
    if CompareText(ParamName, '/w') = 0 then
    begin
      Result.started := False;
    end
    else
    if CompareText(ParamName, '/min') = 0 then
    begin
      Result.minimized := True;
    end
    else
    if CompareText(ParamName, '/t=') = 0 then
    begin
      if not TryStrToInt64(ParamValue, Result.time) then
      begin
        Result.time := 0;
      end;
    end;
  end;
  Result.enabled := Result.mode < 254;
end;
end.
