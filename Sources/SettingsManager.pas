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

    fShowMessageIfNow: Boolean;
    // Выводить запрос при выполнении функции немедленно
    fShowMessageOnlyForCrytical: Boolean;
    // Выводить запрос подтвержднеия только для критических заданий }
    fForceAction: Boolean;
    // True = компьютер будет выключаться принудительно, даже если не отвечают программы
    fBeepLastTen: Boolean;
    fBeepOnB: Boolean;
    fShowTimerWindow: Boolean;
  public
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
end;

function TSettingsManager.LoadFromFile(const Path: string; const FileName: string): Boolean;
begin

end;

function TSettingsManager.SaveToFile(const Path: string; const FileName: string): Boolean;
var
  SettingFile: TIniFile;
begin
  Result := True;
  try
    SettingFile := TIniFile.Create(Path + FileName + '.ini');
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
        WriteBool('Interface', 'MinimizeToTray', MinimizeToTray);
        WriteBool('Interface', 'MinimizeOnEscape', MinimizeOnEscape);
        WriteString('Interface', 'LanguageFile', LanguageFile);
      end;
    except
      Result := False;
    end;
  finally
    SettingFile.Free;
  end;
end;

initialization

GlobalSettings := TSettingsManager.Create;

finalization

GlobalSettings.Free;

end.
