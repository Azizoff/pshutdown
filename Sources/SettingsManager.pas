unit SettingsManager;

interface

uses SysUtils, IniFiles;

type
  TSettingsManager = class
  private
    fMinimizeToTray: Boolean; // True = Сворачивать окно в трей
    fMinimizeOnEscape: Boolean; // True = Сворачивать по ESCAPE
    fLanguageFile: string;
    fBeepOnI: Integer; // Единица измерения минуты
    fAskIfClose: Boolean;
    fOnlyIfTimerRunning: Boolean;

    fProgressBarDisplayMode: Integer;

    fShowMessageIfNow: Boolean;
    // Выводить запрос при выполнении функции немедленно
    fShowMessageOnlyForCrytical: Boolean;
    // Выводить запрос подтвержднеия только для критических заданий }
    fForceAction: Boolean;
    // True = компьютер будет выключаться принудительно, даже если не отвечают программы
    fBeepLastTen: Boolean;
    fBeepOnB: Boolean;
    fShowTimerWindow: Boolean;
    fExeFilePath: UnicodeString;
    fParameters: UnicodeString;
    fSoundPath: UnicodeString;
    fSoundLoop: Boolean;
    fShowFormInLastTenSec: Boolean;
  public
    property ExeFilePath: UnicodeString read fExeFilePath write fExeFilePath;
    property Parameters: UnicodeString read fParameters write fParameters;
    property SoundPath: UnicodeString read fSoundPath write fSoundPath;
    property SoundLoop: Boolean read fSoundLoop write fSoundLoop;
    function SaveToFile(const Path: string; const FileName: string): Boolean;
    function LoadFromFile(const Path: string; const FileName: string): Boolean;
    property MinimizeToTray: Boolean read fMinimizeToTray write fMinimizeToTray;
    property MinimizeOnEscape: Boolean read fMinimizeOnEscape write fMinimizeOnEscape;
    property LanguageFile: string read fLanguageFile write fLanguageFile;
    property AskIfClose: Boolean read fAskIfClose write fAskIfClose;
    property OnlyIfTimerRunning: Boolean read fOnlyIfTimerRunning write fOnlyIfTimerRunning;
    property BeepOnI: Integer read fBeepOnI write fBeepOnI;
    property ShowMessageIfNow: Boolean read fShowMessageIfNow write fShowMessageIfNow;
    property ShowMessageOnlyForCrytical: Boolean read fShowMessageOnlyForCrytical write fShowMessageOnlyForCrytical;
    property ForceAction: Boolean read fForceAction write fForceAction;
    property BeepLastTen: Boolean read fBeepLastTen write fBeepLastTen;
    property BeepOnB: Boolean read fBeepOnB write fBeepOnB;
    property ShowTimerWindow: Boolean read fShowTimerWindow write fShowTimerWindow;
    property ShowFormInLastTenSec: Boolean read fShowFormInLastTenSec write fShowFormInLastTenSec;
    property ProgressBarDisplayMode: Integer read fProgressBarDisplayMode write fProgressBarDisplayMode;

    constructor Create();
  end;

var
  GlobalSettings: TSettingsManager;

implementation

{ TSettingsManager }

constructor TSettingsManager.Create;
begin
  fMinimizeToTray := False;
  fForceAction := False;
  fShowMessageIfNow := True;
  fShowMessageOnlyForCrytical := False;
  fMinimizeOnEscape := False;
  fOnlyIfTimerRunning := True;
  fAskIfClose := True;
  fBeepOnI := 2;
  fLanguageFile := '';
  fBeepLastTen := False;
  fShowTimerWindow := False;
  fBeepOnB := False;
  fShowFormInLastTenSec := True;
  fProgressBarDisplayMode := 0;
end;

function TSettingsManager.LoadFromFile(const Path: string; const FileName: string): Boolean;
var
  SettingFile: TMemIniFile;
begin
  Result := True;
  try
    SettingFile := TMemIniFile.Create(Path + FileName + '.ini', TEncoding.UTF8);
    try
      with SettingFile do
      begin
        ShowMessageIfNow := ReadBool('General', 'SHowMessageIfNow', False);
        ShowMessageOnlyForCrytical := ReadBool('General', 'ShowMessageOnlyForCrytical', False);
        AskIfClose := ReadBool('General', 'AskIfClose', True);
        OnlyIfTimerRunning := ReadBool('General', 'OnlyIfTimerRunning', True);
        ForceAction := ReadBool('General', 'ForceAction', False);
        BeepLastTen := ReadBool('General', 'BeepLastTen', False);
        BeepOnB := ReadBool('General', 'BeepOnB', False);
        BeepOnI := ReadInteger('General', 'BeepOnI', 2);
        MinimizeToTray := ReadBool('Interface', 'MinimizeToTray', False);
        MinimizeOnEscape := ReadBool('Interface', 'MinimizeOnEscape', False);
        LanguageFile := (ReadString('Interface', 'LanguageFile', ''));
        ExeFilePath := (ReadString('Other', 'FilePath', ''));
        Parameters := (ReadString('Other', 'Parameters', ''));
        SoundPath := (ReadString('Other', 'SoundPath', ''));
        SoundLoop := ReadBool('Other', 'SoundLoop', False);
        ShowFormInLastTenSec := ReadBool('Other', 'ShowWindowInLastTenSec', True);
        ProgressBarDisplayMode := ReadInteger('Interface', 'ProgressBarDisplayMode', 0);
      end;
    except
      Result := False;
    end;
  finally
    FreeAndNil(SettingFile);
  end;
end;

function TSettingsManager.SaveToFile(const Path: string; const FileName: string): Boolean;
var
  SettingFile: TMemIniFile;
begin
  Result := True;
  try
    SettingFile := TMemIniFile.Create(Path + FileName + '.ini', TEncoding.UTF8);
    try
      with SettingFile do
      begin
        WriteBool('General', 'SHowMessageIfNow', ShowMessageIfNow);
        WriteBool('General', 'ShowMessageOnlyForCrytical', ShowMessageOnlyForCrytical);
        WriteBool('General', 'AskIfClose', AskIfClose);
        WriteBool('General', 'OnlyIfTimerRunning', OnlyIfTimerRunning);
        WriteBool('General', 'ForceAction', ForceAction);
        WriteBool('General', 'BeepLastTen', BeepLastTen);
        WriteBool('General', 'BeepOnB', BeepOnB);
        WriteInteger('General', 'BeepOnI', BeepOnI);
        WriteBool('Other', 'ShowWindowInLastTenSec', ShowFormInLastTenSec);
        WriteBool('Interface', 'MinimizeToTray', MinimizeToTray);
        WriteBool('Interface', 'MinimizeOnEscape', MinimizeOnEscape);
        WriteString('Interface', 'LanguageFile', LanguageFile);
        WriteInteger('Interface', 'ProgressBarDisplayMode', ProgressBarDisplayMode);
        UpdateFile;
      end;
    except
      Result := False;
    end;
  finally
    FreeAndNil(SettingFile);
  end;
end;

initialization

GlobalSettings := TSettingsManager.Create;

finalization

GlobalSettings.Free;

end.
