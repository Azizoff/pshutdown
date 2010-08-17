unit MNGDisplay;

interface
uses MainFrame, Windows,Messages;
type
  TManagerOfDisplay = class(TMainFrame)
  private
    dmFlag: Boolean;
    dmHandle: HWND;
  public
    function DoAction(): Cardinal; override;
    constructor Create(const ldmHandle: HWND; const ldmFlag: Boolean = False);
  end;

implementation
{ TDisplayManager }

constructor TManagerOfDisplay.Create(const ldmHandle: HWND;
  const ldmFlag: Boolean);
begin
  dmHandle := ldmHandle;
  dmFlag := ldmFlag;
end;

function TManagerOfDisplay.DoAction: Cardinal;
begin
  if dmFlag then
    Result := SendMessage(dmHandle, WM_SYSCOMMAND, SC_MONITORPOWER, 2)
  else
    Result := SendMessage(dmHandle, WM_SYSCOMMAND, SC_MONITORPOWER, -1);
end;
end.
