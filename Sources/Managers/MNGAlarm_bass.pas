unit MNGAlarm_bass;

interface

uses MainFrame, Windows, MMSystem, SysUtils, bass;

type
  TManagerOfAlarm = class(TMainFrame)
  private
    mmSoundPath: String;
    mmHandle: HWND;

    bStream: HSTREAM;
    PlaySync: HSYNC;
  public
  mmLoop: Boolean;
    ChannelEndSync: procedure(handle: HSYNC; Stream, data: DWORD; user: Pointer) of object;
    function DoAction(): Cardinal; override;
    procedure Stop();
    constructor Create(const lmmHandle: HWND; const lmmSoundPath: string;
      const lmmLoop: Boolean; var IsOK: Boolean);
    destructor Destroy; override;
  end;

implementation

{ TManagerOfAlarm }


constructor TManagerOfAlarm.Create(const lmmHandle: HWND;
  const lmmSoundPath: string; const lmmLoop: Boolean; var IsOK: Boolean);
begin
  mmLoop := lmmLoop;
  PlaySync := 0;
  mmHandle := lmmHandle;
  mmSoundPath := lmmSoundPath;
  IsOK := FileExists(mmSoundPath);
  if not BASS_Init(-1, 44100, 0, lmmHandle, nil) then
  MessageBox(0, ('t'), nil, 0);
  if mmLoop then
  begin
   bStream := BASS_StreamCreateFile(False, PChar(mmSoundPath), 0, 0, BASS_SAMPLE_LOOP {$IFDEF UNICODE} or BASS_UNICODE {$ENDIF});
  end
  else
  bStream := BASS_StreamCreateFile(False, PChar(mmSoundPath), 0, 0, 0 {$IFDEF UNICODE} or BASS_UNICODE {$ENDIF});
  end;

destructor TManagerOfAlarm.Destroy;
begin
  BASS_StreamFree(bStream);
  BASS_Free;
 // sndPlaySound(nil, 0);
  inherited;
end;

function TManagerOfAlarm.DoAction: Cardinal;
begin
  Result := 0;
  BASS_ChannelPlay(bStream, False);
  if (@ChannelEndSync <> nil) then
  PlaySync := BASS_ChannelSetSync(bStream, BASS_SYNC_END, 0, @ChannelEndSync, nil);
end;

procedure TManagerOfAlarm.Stop;
begin
BASS_ChannelStop(bStream);
end;

end.
