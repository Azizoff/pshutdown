unit MNGAlarm;

interface
uses MainFrame, Windows, MMSystem, SysUtils;
type
  TManagerOfAlarm = class(TMainFrame)
  private
    mmSoundPath: String;
    mmHandle: HWND;
    mmLoop: Boolean;
  public
    function DoAction(): Cardinal; override;
    constructor Create(const lmmHandle: HWND; const lmmSoundPath: string;
      const lmmLoop: Boolean; var IsOK: Boolean);
  end;
implementation
{ TManagerOfAlarm }

constructor TManagerOfAlarm.Create(const lmmHandle: HWND;
  const lmmSoundPath: string; const lmmLoop: Boolean; var IsOK: Boolean);
begin
  mmLoop := lmmLoop;
  mmHandle := lmmHandle;
  mmSoundPath := lmmSoundPath;
  IsOK := FileExists(mmSoundPath);
end;

function TManagerOfAlarm.DoAction: Cardinal;
begin
  Result := 0;
  if mmLoop then
  begin
    sndPlaySound(PWideChar(mmSoundPath), SND_ASYNC or SND_LOOP);
  end
  else
  begin
    sndPlaySound(PWideChar(mmSoundPath), SND_SYNC);
  end;
end;
end.
