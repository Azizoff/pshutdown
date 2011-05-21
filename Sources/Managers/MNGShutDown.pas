unit MNGShutDown;
interface
uses MainFrame, Windows, SysUtils;
type
  tsdMode = (sdShutdown, sdReboot, sdPowerOff, sdLogOff);
type
  TManagerOfShutDown = class(TMainFrame)
  private
    sdMode: tsdMode;
    sdForceFlag: Boolean;
  public
    function DoAction(): Cardinal; override;
    constructor Create(const lsdMode: tsdMode;
    const lsdForceFlag: Boolean = False);
  end;
implementation
{ TShutDown }

constructor TManagerOfShutDown.Create(const lsdMode: tsdMode;
  const lsdForceFlag: Boolean);
begin
  sdMode := lsdMode;
  sdForceFlag := lsdForceFlag;
end;

function TManagerOfShutDown.DoAction: Cardinal;
var
  hToken: THandle;
  NewState: TTokenPrivileges;
  PreviousState: TTokenPrivileges;
  ReturnLength: Cardinal;
  ErrorResult: Cardinal;
  uFlags: Cardinal;
const
  SE_SHUTDOWN_NAME = 'SeShutdownPrivilege';
begin
  ErrorResult := 0;
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
{$REGION 'AdjustPrivilege'}
    ReturnLength := 0;
    if OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, hToken) then
    begin
      if LookupPrivilegeValue(nil, SE_SHUTDOWN_NAME, NewState.Privileges[0].Luid) then
      begin
        NewState.PrivilegeCount := 1;
        NewState.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
        AdjustTokenPrivileges(hToken, False, NewState, SizeOf(TTokenPrivileges),
        PreviousState, ReturnLength);
        Inc(ErrorResult, GetLastError());
      end
      else
        Inc(ErrorResult, 2);
    end
    else
      Inc(ErrorResult, 1);
{$ENDREGION}
  end;

  if (ErrorResult = 0) then
  begin
    case sdMode of
      sdShutdown:
        uFlags := EWX_SHUTDOWN;
      sdReboot:
        uFlags := EWX_REBOOT;
      sdPowerOff:
        uFlags := EWX_POWEROFF;
      sdLogOff:
        uFlags := EWX_LOGOFF;
    else
      uFlags := EWX_SHUTDOWN;
    end;
    if sdForceFlag then
      uFlags := uFlags or EWX_FORCE;
    ExitWindowsEx(uFlags, 0);
  end;

  Result := ErrorResult;
end;
end.
