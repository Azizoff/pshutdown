unit ULogger;

interface
uses SysUtils;
type
  TWritingMode = (wmWithFullDate, wmWithTime, wmTextOnly);

type
  TLogType = record
    fDateTime: TDateTime;
    fMessage: string;
  end;
type
  TMyLogger = class
  private
    const
    BUFER_SIZE = 255;
    var
    fFileName: string;
    fWritingMode: TWritingMode;
    fLogFile: TextFile;
    fBuffer: Array [0..BUFER_SIZE-1] of TLogType;
    fBufferLength: Byte;
    fActive: Boolean;
    procedure SetFileName(const lFileName: string);
    procedure SetWritingMode(const lWritingMode: TWritingMode);
    property  WritingMode:TWritingMode read fWritingMode write SetWritingMode;
    property FileName: string read fFileName write SetFileName;
  public
    constructor Create(const lFileName: string; const lWritingMode: TWritingMode = wmWithTime);
    function Write(const lLogMessage: string):Cardinal;
    destructor Destroy; override;
  end;
implementation

{ Logger }

constructor TMyLogger.Create(const lFileName: string;
  const lWritingMode: TWritingMode);
begin
  fFileName := lFileName;
  fWritingMode := lWritingMode;
  fBufferLength := 0;
  fActive := True;
  try
    Assign(fLogFile, fFileName);
  Except
   fActive := False;
  end;

  //if FileExists(fFileName) then
  //Append(fLogFile)
  //else
  try
  Rewrite(fLogFile);
  except
   fActive := False;
   end;
   if fActive then
   begin
    Writeln(fLogFile, 'Начало ведения лога');
   end;
end;



destructor TMyLogger.Destroy;
var I:Integer;
begin
if fActive then
begin
  if (fBufferLength>0) then
  begin
  for I := 0 to fBufferLength - 1 do
   with fBuffer[I] do
  begin
    Writeln(fLogFile, FormatDateTime('[dd.mm.yy] [hh:nn:ss] ', fDateTime) + fMessage);
  end;
  end;
  Writeln(fLogFile, 'Успешно завершено ведение Лога');
end;
  CloseFile(fLogFile);
  inherited;
end;

procedure TMyLogger.SetFileName(const lFileName: string);
begin
  fFileName := lFileName;
end;

procedure TMyLogger.SetWritingMode(const lWritingMode: TWritingMode);
begin
  fWritingMode:=lWritingMode;
end;

function TMyLogger.Write(const lLogMessage: string): Cardinal;
var I:Integer;
begin
Result := 0;
if fActive then
begin
if fBufferLength < BUFER_SIZE then
begin
  fBuffer[fBufferLength].fMessage := lLogMessage;
  fBuffer[fBufferLength].fDateTime := Now;
  Inc(fBufferLength);
end
else
begin
  for I := 0 to BUFER_SIZE - 1 do
  begin
    with fBuffer[I] do
    begin
      Writeln(fLogFile, FormatDateTime('[dd.mm.yy - hh:nn:ss] ', fDateTime) + fMessage);
    end;
  end;
    Writeln(fLogFile, '--------------------------------------------------------');
    fBufferLength := 0;
end;
end;
end;

end.

