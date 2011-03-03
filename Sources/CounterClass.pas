unit CounterClass;

interface

uses GCAV, SysUtils;

type
  TCounter = class
  private
    cTotalSeconds: Int64;
    cDays: Integer;
    cHours: Integer;
    cMinutes: Integer;
    cSeconds: Integer;
    function DaysAsString: string;
    function HoursAsString: string;
    function MinutesAsString: string;
    function SecondsAsString: string;
    function TotalSecondsAsString: string;
  public
    constructor Create(const lDays, lHours, lMinutes, lSeconds: Integer);
      overload;
    constructor Create(const lTotalSeconds: Int64 = 0); overload;
    function Decrement(): Int64;
    procedure SetFields(const lTotalSeconds: Int64); overload;
    procedure SetFields(const lDays, lHours, lMinutes, lSeconds: Integer);
      overload;
    function AsString(): string;
    property sDays: string read DaysAsString;
    property sHours: string read HoursAsString;
    property sMinutes: string read MinutesAsString;
    property sSeconds: string read SecondsAsString;
    property sTotalSeconds: string read TotalSecondsAsString;
    property TotalSeconds: Int64 read cTotalSeconds;
  end;

implementation

{ TCounter }

constructor TCounter.Create(const lDays, lHours, lMinutes, lSeconds: Integer);
begin
  SetFields(lDays, lHours, lMinutes, lSeconds);
end;

function TCounter.AsString: string;
begin
  Result := Format(
    'Total: %2.2d Days: %2.2d Hours: %2.2d Minutes: %2.2d Seconds: %2.2d',
    [cTotalSeconds, cDays, cHours, cMinutes, cSeconds]);
end;

constructor TCounter.Create(const lTotalSeconds: Int64);
begin
  SetFields(lTotalSeconds);
end;

function TCounter.DaysAsString: string;
begin
  Result := Format('%2.2d', [cDays]);
end;

function TCounter.Decrement: Int64;
begin
  Result := 0;
  if (cTotalSeconds > 0) then
  begin
    Dec(cTotalSeconds);
    SetFields(cTotalSeconds);
    Result := cTotalSeconds;
  end;
end;

function TCounter.HoursAsString: string;
begin
  Result := Format('%2.2d', [cHours]);
end;

function TCounter.MinutesAsString: string;
begin
  Result := Format('%2.2d', [cMinutes]);
end;

function TCounter.SecondsAsString: string;
begin
  Result := Format('%2.2d', [cSeconds]);
end;

procedure TCounter.SetFields(const lDays, lHours, lMinutes, lSeconds: Integer);
begin
  cTotalSeconds := lDays * SECONDS_IN_DAY + lHours * SECONDS_IN_HOUR +
    lMinutes * SECONDS_IN_MINUTE + lSeconds;
  SetFields(cTotalSeconds);
end;

function TCounter.TotalSecondsAsString: string;
begin
  Result := IntToStr(cTotalSeconds);
end;

procedure TCounter.SetFields(const lTotalSeconds: Int64);
var
  Temp: Int64;
begin
  cTotalSeconds := lTotalSeconds;
  Temp := cTotalSeconds;

  cDays := Temp div SECONDS_IN_DAY;
  Temp := Temp - cDays * SECONDS_IN_DAY;

  cHours := Temp div SECONDS_IN_HOUR;
  Temp := Temp - cHours * SECONDS_IN_HOUR;

  cMinutes := Temp div SECONDS_IN_MINUTE;
  Temp := Temp - cMinutes * SECONDS_IN_MINUTE;

  cSeconds := Temp;
end;

end.
