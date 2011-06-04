unit MNGMessage;

interface

uses MainFrame, Windows;

type
  TManagerOfMessage = class(TMainFrame)
  private
    mmHandle: HWND;
    mmTextMessage: String;
  public
    function DoAction(): Cardinal; override;
    constructor Create(const lmmHandle: HWND; const lmmTextMessage: string);
  end;

implementation

{ TManagerOfMessage }

constructor TManagerOfMessage.Create(const lmmHandle: HWND;
  const lmmTextMessage: string);
begin
  mmHandle := lmmHandle;
  mmTextMessage := lmmTextMessage;
end;

function TManagerOfMessage.DoAction: Cardinal;
begin
  Result := MessageBox(mmHandle, PWideChar(mmTextMessage), 'PShutDown',
    MB_OK or MB_ICONINFORMATION);
end;

end.
