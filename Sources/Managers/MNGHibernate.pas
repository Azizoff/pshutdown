unit MNGHibernate;

interface
uses MainFrame, Windows, SysUtils;
type
  TManagerOfHibernate = class(TMainFrame)
  private

  public
    function DoAction(): Cardinal; override;
    constructor Create();
  end;
implementation

{ TManagerOfHibernate }

constructor TManagerOfHibernate.Create;
begin

end;

function TManagerOfHibernate.DoAction: Cardinal;
var
  hToken: THandle;
  NewState: TTokenPrivileges;
  PreviousState: TTokenPrivileges;
  ReturnLength: Cardinal;
  ptResult: LongBool;
  ErrorResult: Cardinal;
begin
  ErrorResult := 0;
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
{$REGION 'AdjustPrivilege'}
    ReturnLength := 0;
    ptResult := OpenProcessToken(GetCurrentProcess(),
      TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, hToken);
    if ptResult then
    begin
      if (LookupPrivilegeValue(nil, 'SeShutdownPrivilege',
        NewState.Privileges[0].Luid)) then
      begin
        NewState.PrivilegeCount := 1;
        NewState.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
        if not (AdjustTokenPrivileges(hToken, False, NewState,
          SizeOf(TTokenPrivileges), PreviousState, ReturnLength)) then
          begin
          Inc(ErrorResult, 3);
          end;
        Inc(ErrorResult, GetLastError());
      end
      else
      begin
        Inc(ErrorResult, 2);
      end;
    end
    else
    begin
      Inc(ErrorResult, 1);
    end;
{$ENDREGION}
  end;

  if (ErrorResult = 0) then
  begin
    SetSystemPowerState(True, True);
  end;
  Result := ErrorResult;
end;

end.
