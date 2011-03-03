unit SharedTypes;

interface

type
  TVersion = packed record
    Magor: Integer;
    Minor: Integer;
    Release: Integer;
    Build: Integer;
  end;

  TPluginInfo = packed record
    Name: PWideChar;
    Author: PWideChar;
    Description: PWideChar;
    HasSettings: Boolean;
    Version: TVersion;
  end;

  TDoAction = function: Cardinal; stdcall;
  TGetPluginInfo = function: TPluginInfo; stdcall;
  TShowSettings = function: Cardinal; stdcall;

function SetVersion(const lMagor, lMinor, lRelease, lBuild: Integer): TVersion;

implementation

function SetVersion(const lMagor, lMinor, lRelease, lBuild: Integer): TVersion;
begin
  with Result do
  begin
    Magor := lMagor;
    Minor := lMinor;
    Release := lRelease;
    Build := lBuild;
  end;
end;

end.
