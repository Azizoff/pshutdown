unit MNGExecuting;

interface
uses MainFrame, Windows, Messages, SysUtils, ShellAPI;
type
  TManagerOfExecuting = class(TMainFrame)
  private
    emFilePath: String;
    emParameters: String;
    emHandle: HWND;
  public
    function DoAction(): Cardinal; override;
    constructor Create(const lemHandle: HWND; const lemFilePath: string;
      const lemParameters: string; var IsOK: Boolean);
  end;
implementation
{ TManagerOfExecuting }

constructor TManagerOfExecuting.Create(const lemHandle: HWND;
  const lemFilePath, lemParameters: string; var IsOK: Boolean);
begin
  emHandle := lemHandle;
  emFilePath := lemFilePath;
  emParameters := lemParameters;
  IsOK := FileExists(emFilePath);
end;

function TManagerOfExecuting.DoAction: Cardinal;
begin
  Result := 0;
  if FileExists(emFilePath) then
    Result := ShellExecute(emHandle, nil, PWideChar(emFilePath),
      PWideChar(emParameters), nil, SW_NORMAL);
end;
end.
