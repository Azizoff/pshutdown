unit MainFormShutdown;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  PluginListManager,
  MMSystem,
  StdCtrls,
  ComCtrls,
  ExtCtrls,
  GCAV,
  SelectProgramFormShutdown,
  SettingsFormShutdown,
  AboutFormShutdown,
  Menus,
  CounterClass,
  IniFiles,
  SelectSoundFormShutdown,
  SelectPluginFormShutdown,
  MainFrame,
  MessageTextFormShutdown,
  MultiLocalizer,
  MNGShutDown,
  MNGDisplay,
  MNGExecuting,
  MNGAlarm_bass,
  MNGHibernate,
  MNGPlugins,
  MNGMessage,
  SettingsManager,
  CmnFunct;

const
  DaysPerWeek = 7;
  SecsPerWeek = DaysPerWeek * SecsPerDay;

type
  TMainFormSD = class(TForm)
    PCMain: TPageControl;
    TSOnTimer: TTabSheet;
    RGActionList: TRadioGroup;
    pbTotalProgress: TProgressBar;
    GBAfter: TGroupBox;
    GBAt: TGroupBox;
    RBAfter: TRadioButton;
    RBAt: TRadioButton;
    CBDaysAfter: TComboBox;
    lblDaysAfter: TLabel;
    LHourAfter: TLabel;
    LSecondAfter: TLabel;
    LMinuteAfter: TLabel;
    EHourAfter: TEdit;
    EMinuteAfter: TEdit;
    ESecondAfter: TEdit;
    UDHourAfter: TUpDown;
    UDMinuteAfter: TUpDown;
    UDSecondAfter: TUpDown;
    UDHourAt: TUpDown;
    UDMinuteAt: TUpDown;
    UDSecondAt: TUpDown;
    CBDaysAt: TComboBox;
    EHourAt: TEdit;
    EMinuteAt: TEdit;
    ESecondAt: TEdit;
    BStart: TButton;
    BPause: TButton;
    LHourAt: TLabel;
    LMinuteAt: TLabel;
    LSecondAt: TLabel;
    BRigthNow: TButton;
    BBrowseProgramm: TButton;
    BBrowseSound: TButton;
    MainMenu: TMainMenu;
    mniFile: TMenuItem;
    mniSettings: TMenuItem;
    mniAbout: TMenuItem;
    N4: TMenuItem;
    mniExit: TMenuItem;
    BStopAlarm: TButton;
    TrayIcon: TTrayIcon;
    BBrowsePlugin: TButton;
    BBrowseTextMessage: TButton;
    GBEvery: TGroupBox;
    RBEvery: TRadioButton;
    LHourEvery: TLabel;
    LMinuteEvery: TLabel;
    LSecondEvery: TLabel;
    EHourEvery: TEdit;
    EMinuteEvery: TEdit;
    ESecondEvery: TEdit;
    UDHourEvery: TUpDown;
    UDMinuteEvery: TUpDown;
    UDSecondEvery: TUpDown;
    mniSaveAsLangFile: TMenuItem;
    pmPluginChoise: TPopupMenu;
    pmPopup: TPopupMenu;
    pmniExit: TMenuItem;
    pmniShow: TMenuItem;
    mniBreak: TMenuItem;
    mniPluginsNotFound: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure RGActionListClick(Sender: TObject);
    procedure BRigthNowClick(Sender: TObject);
    procedure BBrowseProgrammClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mniExitClick(Sender: TObject);
    procedure mniSettingsClick(Sender: TObject);
    procedure mniAboutClick(Sender: TObject);
    procedure RBAfterClick(Sender: TObject);
    procedure RBAtClick(Sender: TObject);
    procedure BStartClick(Sender: TObject);
    procedure BPauseClick(Sender: TObject);
    procedure FormatText(Sender: TObject);
    procedure UDHourAfterClick(Sender: TObject; Button: TUDBtnType);
    procedure UDMinuteAfterClick(Sender: TObject; Button: TUDBtnType);
    procedure UDSecondAfterClick(Sender: TObject; Button: TUDBtnType);
    procedure UDHourAtClick(Sender: TObject; Button: TUDBtnType);
    procedure UDMinuteAtClick(Sender: TObject; Button: TUDBtnType);
    procedure UDSecondAtClick(Sender: TObject; Button: TUDBtnType);
    procedure UDMinuteAfterMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer; var MouseActivate: TMouseActivate);
    procedure UDHourAfterMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer; var MouseActivate: TMouseActivate);
    procedure UDSecondAfterMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer; var MouseActivate: TMouseActivate);
    procedure UDHourAtMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer; var MouseActivate: TMouseActivate);
    procedure UDMinuteAtMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer; var MouseActivate: TMouseActivate);
    procedure UDSecondAtMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer; var MouseActivate: TMouseActivate);
    procedure EHourAfterChange(Sender: TObject);
    procedure EMinuteAfterChange(Sender: TObject);
    procedure ESecondAfterChange(Sender: TObject);
    procedure ESecondAtChange(Sender: TObject);
    procedure EMinuteAtChange(Sender: TObject);
    procedure EHourAtChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TrayIconDblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBrowseSoundClick(Sender: TObject);
    procedure BStopAlarmClick(Sender: TObject);
    procedure BBrowsePluginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BBrowseTextMessageClick(Sender: TObject);
    procedure UDHourEveryClick(Sender: TObject; Button: TUDBtnType);
    procedure UDMinuteEveryClick(Sender: TObject; Button: TUDBtnType);
    procedure UDSecondEveryClick(Sender: TObject; Button: TUDBtnType);
    procedure EHourEveryChange(Sender: TObject);
    procedure EMinuteEveryChange(Sender: TObject);
    procedure ESecondEveryChange(Sender: TObject);
    procedure UDHourEveryMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer; var MouseActivate: TMouseActivate);
    procedure UDMinuteEveryMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer; var MouseActivate: TMouseActivate);
    procedure UDSecondEveryMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer; var MouseActivate: TMouseActivate);
    procedure RBEveryClick(Sender: TObject);
    procedure mniSaveAsLangFileClick(Sender: TObject);
    procedure PluginMenuOnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    function DoAction(): Boolean;
    procedure SetEnabledMode();
    function timeGetMinPeriod(): DWORD;
    procedure SetNormalValue(Source: TEdit; const MaxValue: Integer);
    procedure WindowMessage(var Msg: TMessage); message WM_SYSCOMMAND;
    function LoadSettings(): Boolean;
    function SaveOtherSettings(): Boolean;
    procedure CenterModal(const ChildHandle: HWND);
    procedure LoadPlugIns();
    procedure OnTimeChange(var Message: TWMTimeChange); message WM_TIMECHANGE;
    procedure OnSelectPlugin(var Msg: TMessage); message WMU_PLUGIN_SELECTED;
    procedure WMQueryEndSession(var Message: TWMQueryEndSession); message WM_QUERYENDSESSION;
    procedure CreateProgressBarHint();
    procedure InitializePluginsMenu();
    procedure ApplyVisualSettings();

    { Private declarations }
  public
    { Public declarations }
    procedure Callback(handle: Cardinal; Stream, data: DWORD; user: Pointer);
    procedure ChangeLanguage();
  end;

var
  MainFormSD: TMainFormSD;
  TimerID: UINT = 0;
  Counter: TCounter;
  Actor: TMainFrame;
  LangLoaded: Boolean = False;
  ShowMessageOnes: Boolean = False;
  pbHintLabel: TLabel;
  CloseProgramm: Boolean = False;

const
  ShiftWeek: array [0 .. 6] of Byte = (6, 0, 1, 2, 3, 4, 5);
  DBG_MODE = False;
procedure TimerProc(uTimerID, uMessage: UINT; dwUser, dw1, dw2: DWORD); stdcall;

implementation

{$R *.dfm}

procedure TimerProc(uTimerID, uMessage: UINT; dwUser, dw1, dw2: DWORD); stdcall;
begin
  if Counter.TotalSeconds > 0 then
  begin
    Counter.Decrement;
    if GlobalSettings.BeepLastTen then
      if Counter.TotalSeconds < 10 then
      begin
        Windows.Beep(2000, 50);
      end;

      if GlobalSettings.ShowFormInLastTenSec then
      begin
        if (Counter.TotalSeconds <= 10) and (MainFormSD.Visible = False) then
        begin
          MainFormSD.TrayIcon.Visible := False;
          MainFormSD.Show;
        end;

      end;

    if GlobalSettings.BeepOnB then
      if (Counter.TotalSeconds mod (GlobalSettings.BeepOnI * 60) = 0) then
      begin
        Windows.Beep(1000, 300);
      end;

    with MainFormSD do
    begin
      TrayIcon.Hint := Format('%s'#13#10'%s'#13#10'%s %s', [GLOBAL_PROJECT_NAME, RGActionList.Buttons[RGActionList.ItemIndex].Caption, RBAfter.Caption, Counter.AsString]);
      CBDaysAfter.ItemIndex := StrToInt(Counter.sDays);
      pbTotalProgress.StepIt;
      if Assigned(pbHintLabel) then
      begin
      case GlobalSettings.ProgressBarDisplayMode of
        0: pbHintLabel.Caption := '';
        1: pbHintLabel.Caption := Format('%.1f %%', [(pbTotalProgress.Position / pbTotalProgress.Max) * 100]);
        2: pbHintLabel.Caption := Counter.AsString(false);
      end;
      end;
      EHourAfter.Text := Counter.sHours;
      EMinuteAfter.Text := Counter.sMinutes;
      ESecondAfter.Text := Counter.sSeconds;
      if Counter.TotalSeconds = 0 then
      begin
        DoAction;
        if not RBEvery.Checked then
          BPauseClick(BPause)
        else
          Counter.SetFields(0, StrToInt(EHourEvery.Text), StrToInt(EMinuteEvery.Text), StrToInt(ESecondEvery.Text));
      end;
    end;
  end
  else
  begin
    if TimerID > 0 then
    begin
      timeKillEvent(TimerID);
      TimerID := 0;
    end;
  end;
end;

procedure TMainFormSD.LoadPlugIns;
var
  SearchRec: TSearchRec;
begin
  if (FindFirst(gvPluginsPath + '*.dll', faAnyFile and not faDirectory, SearchRec) = 0) then
  begin
    PluginList.AddPlugin(gvPluginsPath + SearchRec.Name);
    while FindNext(SearchRec) = 0 do
      PluginList.AddPlugin(gvPluginsPath + SearchRec.Name);
  end;
end;

function TMainFormSD.LoadSettings(): Boolean;
var
  SettingFile: TIniFile;
begin
  Result := True;
  SettingFile := TIniFile.Create(gvApplicationPath + DEF_SETTINGS_FILE + '.ini');
  try
    with SettingFile do
    begin
      GlobalSettings.ShowMessageIfNow := ReadBool('General', 'SHowMessageIfNow', False);
      GlobalSettings.ShowMessageOnlyForCrytical := ReadBool('General', 'ShowMessageOnlyForCrytical', False);
      GlobalSettings.AskIfClose := ReadBool('General', 'AskIfClose', True);
      GlobalSettings.OnlyIfTimerRunning := ReadBool('General', 'OnlyIfTimerRunning', True);
      GlobalSettings.ForceAction := ReadBool('General', 'ForceAction', False);
      GlobalSettings.BeepLastTen := ReadBool('General', 'BeepLastTen', False);
      GlobalSettings.BeepOnB := ReadBool('General', 'BeepOnB', False);
      GlobalSettings.BeepOnI := ReadInteger('General', 'BeepOnI', 2);
      GlobalSettings.MinimizeToTray := ReadBool('Interface', 'MinimizeToTray', False);
      GlobalSettings.MinimizeOnEscape := ReadBool('Interface', 'MinimizeOnEscape', False);
      GlobalSettings.ProgressBarDisplayMode := ReadInteger('Interface', 'ProgressBarDisplayMode', 0);
      GlobalSettings.LanguageFile := UTF8ToString(ReadString('Interface', 'LanguageFile', ''));
      GlobalSettings.ShowFormInLastTenSec := ReadBool('Other', 'ShowWindowInLastTenSec', True);
      gvFilePath := (ReadString('Other', 'FilePath', ''));
      gvParameters := (ReadString('Other', 'Parameters', ''));
      gvSoundPath := (ReadString('Other', 'SoundPath', ''));
      gvSoundLoop := ReadBool('Other', 'SoundLoop', False);
    end;
  finally
    FreeAndNil(SettingFile);
  end;

end;

procedure TMainFormSD.BStartClick(Sender: TObject);
var
  lLocalTime: TSystemTime;
  lLocalTimeAsSeconds: Int64;
  lSetupTime: Int64;
  lHour, lMinute, lSecond: Integer;
begin
  pbTotalProgress.Position := 0;

  if RBAfter.Checked then
  begin
    Counter.SetFields(StrToIntDef(CBDaysAfter.Text, 0), StrToIntDef(EHourAfter.Text, 0), StrToIntDef(EMinuteAfter.Text, 0), StrToIntDef(ESecondAfter.Text, 0));
  end;

  if RBAt.Checked then
  begin
    GetLocalTime(lLocalTime);
    if (lLocalTime.wSecond = 0) and (lLocalTime.wMinute = 0) and (lLocalTime.wHour = 0) then
    begin
      lLocalTime.wHour := 24;
    end;

    lLocalTimeAsSeconds := (lLocalTime.wHour * SecsPerHour + lLocalTime.wMinute * SecsPerMin + lLocalTime.wSecond);
    lHour := StrToInt(EHourAt.Text);
    lMinute := StrToInt(EMinuteAt.Text);
    lSecond := StrToInt(ESecondAt.Text);
    if (lSecond = 0) and (lMinute = 0) and (lHour = 0) then
    begin
      lHour := 24;
    end;

    lSetupTime := lHour * SecsPerHour + lMinute * SecsPerMin + lSecond;

    if (CBDaysAt.ItemIndex = ShiftWeek[lLocalTime.wDayOfWeek]) and (lSetupTime < lLocalTimeAsSeconds) then
    begin
      lSetupTime := lSetupTime + SecsPerWeek;
    end;

    if (CBDaysAt.ItemIndex < ShiftWeek[lLocalTime.wDayOfWeek]) then
    begin
      lSetupTime := lSetupTime + (DaysPerWeek - ShiftWeek[lLocalTime.wDayOfWeek] + CBDaysAt.ItemIndex) * SecsPerDay;
    end;

    if (CBDaysAt.ItemIndex > ShiftWeek[lLocalTime.wDayOfWeek]) then
    begin
      lSetupTime := lSetupTime + (CBDaysAt.ItemIndex - ShiftWeek[lLocalTime.wDayOfWeek]) * SecsPerDay;
    end;
    Counter.SetFields(lSetupTime - lLocalTimeAsSeconds);
  end;

  if RBEvery.Checked then
  begin
    Counter.SetFields(0, StrToIntDef(EHourEvery.Text, 0), StrToIntDef(EMinuteEvery.Text, 0), StrToIntDef(ESecondEvery.Text, 0));
  end;

  if Counter.TotalSeconds > 0 then
  begin
    pbTotalProgress.Max := Counter.TotalSeconds;
    TimerID := timeSetEvent(1000, timeGetMinPeriod, @TimerProc, 0, TIME_CALLBACK_FUNCTION or TIME_PERIODIC);
  end
  else
  begin
    MessageBox(handle, PWideChar(langs[8]), GLOBAL_PROJECT_NAME, MB_OK or MB_ICONINFORMATION);
  end;

  BPause.Enabled := TimerID > 0;
  BStart.Enabled := TimerID = 0;
  RGActionList.Enabled := TimerID = 0;
  RBAfter.Enabled := TimerID = 0;
  GBAfter.Enabled := TimerID = 0;
  RBAt.Enabled := TimerID = 0;
  GBAt.Enabled := TimerID = 0;
  RBEvery.Enabled := TimerID = 0;
  GBEvery.Enabled := TimerID = 0;
  BRigthNow.Enabled := TimerID = 0;
  BBrowseTextMessage.Enabled := TimerID = 0;
  BBrowseProgramm.Enabled := TimerID = 0;
  BBrowseSound.Enabled := TimerID = 0;
  BBrowsePlugin.Enabled := TimerID = 0;
  mniSettings.Enabled := TimerID = 0;
end;

procedure TMainFormSD.BStopAlarmClick(Sender: TObject);
begin
if (Actor is TManagerOfAlarm) then
  (Actor as TManagerOfAlarm).Stop;
  //sndPlaySound(nil, SND_ASYNC);
  // BStopAlarm.Enabled := False;
  ShowWindow(BStopAlarm.handle, SW_HIDE);
end;

procedure TMainFormSD.CenterModal(const ChildHandle: HWND);
var
  MainForm, ChildForm: TRect;
  MainWidth, MainHeight, ChildWidth, ChildHeight: Integer;
  X, Y: Integer;
begin
  GetWindowRect(MainFormSD.handle, MainForm);
  MainWidth := MainForm.Right - MainForm.Left;
  MainHeight := MainForm.Bottom - MainForm.Top;
  GetWindowRect(ChildHandle, ChildForm);
  ChildWidth := ChildForm.Right - ChildForm.Left;
  ChildHeight := ChildForm.Bottom - ChildForm.Top;
  X := MainForm.Left + MainWidth div 2 - ChildWidth div 2;
  Y := MainForm.Top + MainHeight div 2 - ChildHeight div 2;
  if X < 0 then
    X := 0;
  if X + ChildWidth > Screen.Width then
    X := Screen.Width - ChildWidth;
  if Y < 0 then
    Y := 0;
  if Y + ChildHeight > Screen.Height then
    Y := Screen.Height - ChildHeight;
  SetWindowPos(ChildHandle, MainFormSD.handle, X, Y, 0, 0, SWP_NOSIZE or SWP_NOZORDER);
end;

procedure TMainFormSD.ChangeLanguage;
var
  Localizer: TMultiLocalizer;
begin
  if FileExists(gvLanguagesPath + GlobalSettings.LanguageFile) then
  begin
    Localizer := TMultiLocalizer.Create(gvLanguagesPath + GlobalSettings.LanguageFile);
    Localizer.UserLoad := @LoadArray;
    Localizer.UserSave := @SaveArray;
    try
      Localizer.AddForm(MainFormSD);
      Localizer.AddForm(About);
      Localizer.AddForm(Settings);
      Localizer.AddForm(SelectPlugin);
      Localizer.AddForm(SelectSound);
      Localizer.AddForm(SelectProgramm);
      Localizer.AddForm(MessageText);
      Localizer.LoadFromFile;
    finally
      FreeAndNil(Localizer);
    end;
  end;
end;

procedure TMainFormSD.CreateProgressBarHint;
begin
  pbHintLabel := TLabel.Create(Self);
  pbHintLabel.Name := 'pbHintLabel';
  pbHintLabel.SetParentComponent(pbTotalProgress);
  pbHintLabel.Caption := '--------';
  pbHintLabel.Font.Size := 10;
  pbHintLabel.Font.Color := RGB(70, 80, 70);
  pbHintLabel.SetBounds((pbTotalProgress.Width div 2) - (pbHintLabel.Width div 2), (pbTotalProgress.Height div 2) - (pbHintLabel.Height div 2), 0, 0);
end;

procedure TMainFormSD.BBrowseSoundClick(Sender: TObject);
begin
  CenterModal(SelectSound.handle);
  SelectSound.ShowModal;
  SaveOtherSettings;
end;

procedure TMainFormSD.BBrowseTextMessageClick(Sender: TObject);
begin
  CenterModal(MessageText.handle);
  MessageText.ShowModal;
  SaveOtherSettings;
end;

procedure TMainFormSD.BPauseClick(Sender: TObject);
begin
  if TimerID > 0 then
  begin
    timeKillEvent(TimerID);
    TimerID := 0;
  end;

  TrayIcon.Hint := GLOBAL_PROJECT_NAME;
  pbTotalProgress.Position := 0;
  BPause.Enabled := False;
  BStart.Enabled := True;
  RGActionList.Enabled := True;
  RBAfter.Enabled := True;
  GBAfter.Enabled := RBAfter.Checked;
  RBAt.Enabled := True;
  GBAt.Enabled := RBAt.Checked;
  RBEvery.Enabled := True;
  GBEvery.Enabled := RBEvery.Checked;
  mniSettings.Enabled := True;
  BRigthNow.Enabled := True;
  BBrowseProgramm.Enabled := RGActionList.ItemIndex = 5;
  BBrowseSound.Enabled := RGActionList.ItemIndex = 6;
  BBrowseTextMessage.Enabled := RGActionList.ItemIndex = 7;
  BBrowsePlugin.Enabled := RGActionList.ItemIndex = 8;
end;

procedure TMainFormSD.BRigthNowClick(Sender: TObject);
begin
  if GlobalSettings.ShowMessageIfNow then
  begin
    if GlobalSettings.ShowMessageOnlyForCrytical then
    begin
      if RGActionList.ItemIndex in [0 .. 3] then
      begin
        if (MessageBox(handle, PWideChar(langs[0] + NEW_LINE + RGActionList.Buttons[RGActionList.ItemIndex].Caption + '?'), GLOBAL_PROJECT_NAME, MB_YESNO or MB_ICONQUESTION)
          = mrYes) then
        begin
          DoAction;
        end;
      end
      else
      begin
        DoAction;
      end;
    end
    else
    begin
      if (MessageBox(handle, PWideChar(langs[0] + NEW_LINE + RGActionList.Buttons[RGActionList.ItemIndex].Caption + '?'), GLOBAL_PROJECT_NAME, MB_YESNO or MB_ICONQUESTION)
        = mrYes) then
      begin
        DoAction;
      end;
    end;
  end
  else
  begin
    DoAction;
  end;
end;

procedure TMainFormSD.ApplyVisualSettings;
begin
  if GlobalSettings.ForceAction then
  begin
    RGActionList.Buttons[0].Font.Style := [fsUnderline];
    RGActionList.Buttons[1].Font.Style := [fsUnderline];
    RGActionList.Buttons[2].Font.Style := [fsUnderline];
  end
  else
  begin
    RGActionList.Buttons[0].Font.Style := [];
    RGActionList.Buttons[1].Font.Style := [];
    RGActionList.Buttons[2].Font.Style := [];
  end;
end;

procedure TMainFormSD.BBrowsePluginClick(Sender: TObject);
begin
  CenterModal(SelectPlugin.handle);
  SelectPlugin.ShowModal;
end;

procedure TMainFormSD.BBrowseProgrammClick(Sender: TObject);
begin
  CenterModal(SelectProgramm.handle);
  SelectProgramm.ShowModal;
  SaveOtherSettings;
end;

procedure TMainFormSD.Callback (handle: Cardinal; Stream, data: DWORD; user: Pointer);
begin
if not (Actor as TManagerOfAlarm).mmLoop then
  ShowWindowAsync(MainFormSD.BStopAlarm.handle, SW_HIDE);
end;

function TMainFormSD.DoAction(): Boolean;
var
  IsOK: Boolean;

begin
  IsOK := True;
  if Assigned(Actor) then
  begin
    if not(Actor is TManagerOfPlugin) then
      FreeAndNil(Actor);
  end;
  case RGActionList.ItemIndex of
    0:
      begin
        Actor := TManagerOfShutDown.Create(sdShutdown, GlobalSettings.ForceAction);
      end;
    1:
      begin
        Actor := TManagerOfShutDown.Create(sdReboot, GlobalSettings.ForceAction);
      end;
    2:
      Actor := TManagerOfShutDown.Create(sdLogOff, GlobalSettings.ForceAction);
    3:
      Actor := TManagerOfHibernate.Create();
    4:
      Actor := TManagerOfDisplay.Create(handle, True);
    5:
      Actor := TManagerOfExecuting.Create(handle, gvFilePath, gvParameters, IsOK);
    6:
      begin
        //if gvSoundLoop and IsOK then
          ShowWindowAsync(BStopAlarm.handle, SW_SHOW);
        Actor := TManagerOfAlarm.Create(handle, gvSoundPath, gvSoundLoop, IsOK);
       (Actor as TManagerOfAlarm).ChannelEndSync := Callback;
      end;
    7:
      Actor := TManagerOfMessage.Create(handle, gvTextMessage);
    8:
      begin
        Actor := PluginList.SelectedItem;
      end;
  else
    Beep;
  end;
  if Assigned(Actor) and (IsOK) then
  begin
    Actor.DoAction;
  end
  else
  begin
  end;
  Result := True;
end;

procedure TMainFormSD.EHourAfterChange(Sender: TObject);
begin
  SetNormalValue(TEdit(Sender), 23);
end;

procedure TMainFormSD.EHourAtChange(Sender: TObject);
begin
  SetNormalValue(TEdit(Sender), 23);
end;

procedure TMainFormSD.EHourEveryChange(Sender: TObject);
begin
  SetNormalValue(TEdit(Sender), 99);
end;

procedure TMainFormSD.EMinuteAfterChange(Sender: TObject);
begin
  SetNormalValue(TEdit(Sender), 59);
end;

procedure TMainFormSD.EMinuteAtChange(Sender: TObject);
begin
  SetNormalValue(TEdit(Sender), 59);
end;

procedure TMainFormSD.EMinuteEveryChange(Sender: TObject);
begin
  SetNormalValue(TEdit(Sender), 59);
end;

procedure TMainFormSD.ESecondAfterChange(Sender: TObject);
begin
  SetNormalValue(TEdit(Sender), 59);
end;

procedure TMainFormSD.ESecondAtChange(Sender: TObject);
begin
  SetNormalValue(TEdit(Sender), 59);
end;

procedure TMainFormSD.ESecondEveryChange(Sender: TObject);
begin
  SetNormalValue(TEdit(Sender), 59);
end;

procedure TMainFormSD.FormActivate(Sender: TObject);
begin
  ApplyVisualSettings();
  CBDaysAt.ItemIndex := ShiftWeek[DayOfWeek(Date) - 1];
end;

procedure TMainFormSD.FormatText(Sender: TObject);
begin
  if Length(TEdit(Sender).Text) = 0 then
    TEdit(Sender).Text := '0';
  TEdit(Sender).Text := Format('%2.2d', [StrToInt(TEdit(Sender).Text)]);
end;

function TMainFormSD.timeGetMinPeriod(): DWORD;
begin
  Result := 10;
end;

procedure TMainFormSD.TrayIconDblClick(Sender: TObject);
begin
  TrayIcon.Visible := False;
  Show;
end;

procedure TMainFormSD.UDHourAfterClick(Sender: TObject; Button: TUDBtnType);
begin
  FormatText(EHourAfter);
end;

procedure TMainFormSD.UDHourAfterMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer; var MouseActivate: TMouseActivate);
begin
  EHourAfter.SetFocus;
end;

procedure TMainFormSD.UDHourAtClick(Sender: TObject; Button: TUDBtnType);
begin
  FormatText(EHourAt);
end;

procedure TMainFormSD.UDHourAtMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer; var MouseActivate: TMouseActivate);
begin
  EHourAt.SetFocus;
end;

procedure TMainFormSD.UDMinuteAfterClick(Sender: TObject; Button: TUDBtnType);
begin
  FormatText(EMinuteAfter);
end;

procedure TMainFormSD.UDMinuteAfterMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer; var MouseActivate: TMouseActivate);
begin
  EMinuteAfter.SetFocus;
end;

procedure TMainFormSD.UDMinuteAtClick(Sender: TObject; Button: TUDBtnType);
begin
  FormatText(EMinuteAt);
end;

procedure TMainFormSD.UDMinuteAtMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer; var MouseActivate: TMouseActivate);
begin
  EMinuteAt.SetFocus;
end;

procedure TMainFormSD.UDSecondAfterClick(Sender: TObject; Button: TUDBtnType);
begin
  FormatText(ESecondAfter);
end;

procedure TMainFormSD.UDSecondAfterMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer; var MouseActivate: TMouseActivate);
begin
  ESecondAfter.SetFocus;
end;

procedure TMainFormSD.UDSecondAtClick(Sender: TObject; Button: TUDBtnType);
begin
  FormatText(ESecondAt);
end;

procedure TMainFormSD.UDSecondAtMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer; var MouseActivate: TMouseActivate);
begin
  EMinuteAt.SetFocus;
end;

procedure TMainFormSD.UDHourEveryClick(Sender: TObject; Button: TUDBtnType);
begin
  FormatText(EHourEvery);
end;

procedure TMainFormSD.UDHourEveryMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer; var MouseActivate: TMouseActivate);
begin
  EHourEvery.SetFocus;
end;

procedure TMainFormSD.UDMinuteEveryClick(Sender: TObject; Button: TUDBtnType);
begin
  FormatText(EMinuteEvery);
end;

procedure TMainFormSD.UDMinuteEveryMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer; var MouseActivate: TMouseActivate);
begin
  EMinuteEvery.SetFocus;
end;

procedure TMainFormSD.UDSecondEveryClick(Sender: TObject; Button: TUDBtnType);
begin
  FormatText(ESecondEvery);
end;

procedure TMainFormSD.UDSecondEveryMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer; var MouseActivate: TMouseActivate);
begin
  ESecondEvery.SetFocus;
end;

procedure TMainFormSD.WindowMessage(var Msg: TMessage);
begin
  if Msg.WParam = SC_MINIMIZE then
  begin
  if GlobalSettings.ShowFormInLastTenSec and  (Counter.TotalSeconds <= 10) then
  begin
  end
  else
  begin
    if GlobalSettings.MinimizeToTray then
    begin
      TrayIcon.Visible := True;
      Hide;
    end
    else
      Application.Minimize;
  end;

  end
  else
    inherited;
end;

procedure TMainFormSD.WMQueryEndSession(var Message: TWMQueryEndSession);
begin
  CloseProgramm := True;
  Message.Result := 1;
  inherited;
end;

procedure TMainFormSD.FormClose(Sender: TObject; var Action: TCloseAction);
var
  I: Integer;
begin
  timeKillEvent(TimerID);
  if not(Actor is TManagerOfPlugin) then
    FreeAndNil(Actor);
  FreeAndNil(PluginList);
  FreeAndNil(Counter);
  I := pmPluginChoise.Items.Count - 1;
  while (I >= 0) do
  begin
    pmPluginChoise.Items[I].Free;
    Dec(I);
  end;
  pbHintLabel.Free;
end;

procedure TMainFormSD.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  Answ: Integer;
begin
  Answ := mrYes;
  if (GlobalSettings.AskIfClose) and (not CloseProgramm) then
  begin
    if GlobalSettings.OnlyIfTimerRunning then
    begin
      if TimerID <> 0 then
      begin
        Answ := MessageBox(handle, PChar(langs[0] + ' ' + langs[7]), GLOBAL_PROJECT_NAME, MB_YESNO or MB_ICONQUESTION);
      end;
    end
    else
    begin
      Answ := MessageBox(handle, PChar(langs[0] + ' ' + langs[7]), GLOBAL_PROJECT_NAME, MB_YESNO or MB_ICONQUESTION);
    end;
  end;
  CanClose := Answ = mrYes;
end;

procedure TMainFormSD.FormCreate(Sender: TObject);
begin
  gvMainFormHandle := handle;
  gvApplicationPath := ExtractFilePath(ParamStr(0));
  gvLanguagesPath := gvApplicationPath + LANGUAGE_PATH;
  gvPluginsPath := gvApplicationPath + PLUGIN_PATH;
  Counter := TCounter.Create();
  LoadSettings();
  PluginList := TPluginList.Create;
  //LoadPlugIns();
  TimerID := 0;
  mniSaveAsLangFile.Visible := DebugHook = 1;
  LangLoaded := False;
  InitializePluginsMenu;
  CreateProgressBarHint;
  ShowWindowAsync(BStopAlarm.handle, SW_HIDE);

ProcessCommandLine;

end;

procedure TMainFormSD.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if GlobalSettings.MinimizeOnEscape then
    if Key = VK_ESCAPE then
    begin
      PostMessage(handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
    end;
end;

procedure TMainFormSD.FormShow(Sender: TObject);
begin
  if not LangLoaded then
  begin
    MainFormSD.ChangeLanguage();
    LangLoaded := True;
  end;
  gvMainWindowHandle := MainFormSD.handle;
  pbTotalProgress.Step := 1;
  FormatText(EHourAfter);
  FormatText(EHourAt);
  FormatText(EHourEvery);
  FormatText(EMinuteAfter);
  FormatText(EMinuteAt);
  FormatText(EMinuteEvery);
  FormatText(ESecondAfter);
  FormatText(ESecondAt);
  FormatText(ESecondEvery);
  // BStopAlarm.Visible := False;
  BBrowseProgramm.Hint := gvFilePath;
  BBrowseSound.Hint := gvSoundPath;
  BBrowseTextMessage.Hint := gvTextMessage;
  RGActionList.Buttons[5].ShowHint := True;
  RGActionList.Buttons[5].Hint := gvFilePath;
  RGActionList.Buttons[6].ShowHint := True;
  RGActionList.Buttons[6].Hint := gvSoundPath;
  RGActionList.Buttons[7].ShowHint := True;
  RGActionList.Buttons[7].Hint := gvTextMessage;
end;

procedure TMainFormSD.InitializePluginsMenu;
var
  I: Integer;
  NewMenuItem: TMenuItem;
begin
  for I := 0 to PluginList.Count - 1 do
  begin
    with PluginList.Items[I] do
    begin
      NewMenuItem := TMenuItem.Create(Self);
      NewMenuItem.Caption := PluginInfo.Name;
      NewMenuItem.Tag := I;
      NewMenuItem.RadioItem := True;
      NewMenuItem.Hint := PluginInfo.Description;
      NewMenuItem.Checked := PluginList.Selected = I;
      NewMenuItem.OnClick := PluginMenuOnClick;
      pmPluginChoise.Items.Add(NewMenuItem);
    end;
  end;
  mniPluginsNotFound.Visible := PluginList.Count = 0;
end;

procedure TMainFormSD.mniSettingsClick(Sender: TObject);
var
  OldLang: string;
begin
  CenterModal(Settings.handle);
  OldLang := GlobalSettings.LanguageFile;
  IntToStr(Settings.ShowModal);
  if OldLang <> GlobalSettings.LanguageFile then
  begin
    MainFormSD.ChangeLanguage();
  end;
  ApplyVisualSettings;
end;

procedure TMainFormSD.OnSelectPlugin(var Msg: TMessage);
//var
  //I: Integer;
begin
  {

  if (Msg.WParam >=0 ) then
  begin
    pmPluginChoise.Items[Msg.WParam + 1].Checked := True;
    RGActionList.Buttons[8].Caption := PluginList.SelectedItem.PluginInfo.Name;
  end
  else
  begin
    RGActionList.Buttons[8].Caption := langs[4];
    I := pmPluginChoise.Items.Count - 1;
    while (I >= 0) do
    begin
      pmPluginChoise.Items[I].Checked := False;
      Dec(I);
    end;
  end;

  }
end;

procedure TMainFormSD.OnTimeChange(var Message: TWMTimeChange);
var
  mbAnswer: Integer;
begin
  if (TimerID > 0) then
  begin
    if (RBAt.Checked) then
    begin
      if not ShowMessageOnes then
      begin
        ShowMessageOnes := True;
        mbAnswer := MessageBox(handle, PWideChar(langs[5] + NEW_LINE + langs[6]), GLOBAL_PROJECT_NAME, MB_YESNO + MB_ICONQUESTION);
        if mbAnswer = mrYes then
        begin
          BPause.Click;
          BStart.Click;
        end;
        ShowMessageOnes := False;
      end;
    end;
  end;
end;

procedure TMainFormSD.PluginMenuOnClick(Sender: TObject);
begin
  PluginList.SelectItem((Sender as TMenuItem).Tag);
  (Sender as TMenuItem).Checked := True;
  if PluginList.Selected > -1 then
  begin
    RGActionList.Buttons[8].Caption := PluginList.SelectedItem.PluginInfo.Name;
  end
  else
  begin
    RGActionList.Buttons[8].Caption := langs[4];
  end;
end;

procedure TMainFormSD.mniAboutClick(Sender: TObject);
begin
  CenterModal(About.handle);
  About.ShowModal;
end;

procedure TMainFormSD.mniExitClick(Sender: TObject);
begin
  Close;
end;

procedure TMainFormSD.mniSaveAsLangFileClick(Sender: TObject);
var
  Localizer: TMultiLocalizer;
  I: Integer;
begin
  I := 0;
  while FileExists(gvApplicationPath + 'Lang_' + IntToStr(I) + '.ini') do
    Inc(I);
  Localizer := TMultiLocalizer.Create(gvApplicationPath + 'Lang_' + IntToStr(I) + '.ini');
  Localizer.UserLoad := @LoadArray;
  Localizer.UserSave := @SaveArray;
  try
    I := Localizer.AddForm(MainFormSD);
    Localizer.AddFilter(I, 'CBDaysAfter');
    Localizer.AddFilter(I, 'mniN1');
    Localizer.AddFilter(I, 'N4');
    Localizer.AddFilter(I, 'mniBreak');
    Localizer.AddFilter(I, 'mniSaveAsLangFile');
    Localizer.AddFilter(I, 'pbHintLabel');
    Localizer.AddFilter(I, 'mniPluginsNotFound');
    I := Localizer.AddForm(About);
    Localizer.AddFilter(I, 'lblAboutAuhtorDescription');
    Localizer.AddFilter(I, 'lblAboutEmailDescription');
    Localizer.AddFilter(I, 'lblAboutProgramName');
    Localizer.AddFilter(I, 'lblSiteLink');
    Localizer.AddFilter(I, 'lblVersion');

    I := Localizer.AddForm(Settings);
    Localizer.AddFilter(I, 'Label1');
    Localizer.AddFilter(I, 'pcSettings');
    Localizer.AddForm(SelectPlugin);
    Localizer.AddForm(SelectSound);
    Localizer.AddForm(SelectProgramm);
    Localizer.AddForm(MessageText);
    Localizer.SaveToFile;
  finally
    FreeAndNil(Localizer);
  end;
end;

procedure TMainFormSD.RBAfterClick(Sender: TObject);
begin
  SetEnabledMode();
end;

procedure TMainFormSD.RBAtClick(Sender: TObject);
begin
  SetEnabledMode();
end;

procedure TMainFormSD.RBEveryClick(Sender: TObject);
begin
  SetEnabledMode();
end;

procedure TMainFormSD.RGActionListClick(Sender: TObject);
begin
  BBrowseProgramm.Enabled := RGActionList.ItemIndex = 5;
  BBrowseSound.Enabled := RGActionList.ItemIndex = 6;
  BBrowseTextMessage.Enabled := RGActionList.ItemIndex = 7;
  BBrowsePlugin.Enabled := RGActionList.ItemIndex = 8;
end;

function TMainFormSD.SaveOtherSettings: Boolean;
var
  SettingFile: TIniFile;
begin
  Result := True;
  SettingFile := TIniFile.Create(gvApplicationPath + DEF_SETTINGS_FILE + '.ini');
  try
    with SettingFile do
    begin
      WriteString('Other', 'FilePath', UnicodeString(gvFilePath));
      WriteString('Other', 'Parameters', UnicodeString(gvParameters));
      WriteString('Other', 'SoundPath', UnicodeString(gvSoundPath));
      WriteBool('Other', 'SoundLoop', gvSoundLoop);
    end;
  except
    MessageBox(handle, PChar(langs[2] + NEW_LINE + langs[3]), GLOBAL_PROJECT_NAME, MB_ICONINFORMATION);
  end;
  BBrowseProgramm.Hint := gvFilePath;
  BBrowseSound.Hint := gvSoundPath;
  BBrowseTextMessage.Hint := gvTextMessage;
  RGActionList.Buttons[5].ShowHint := True;
  RGActionList.Buttons[5].Hint := gvFilePath;
  RGActionList.Buttons[6].ShowHint := True;
  RGActionList.Buttons[6].Hint := gvSoundPath;
  RGActionList.Buttons[7].ShowHint := True;
  RGActionList.Buttons[7].Hint := gvTextMessage;
  FreeAndNil(SettingFile);
end;

procedure TMainFormSD.SetEnabledMode();
begin
  GBAt.Enabled := RBAt.Checked;
  GBAfter.Enabled := RBAfter.Checked;
  GBEvery.Enabled := RBEvery.Checked;
end;

procedure TMainFormSD.SetNormalValue(Source: TEdit; const MaxValue: Integer);
begin
  if Length(Source.Text) > 0 then
  begin
    if StrToInt(Source.Text) > MaxValue then
    begin
      Source.Text := IntToStr(MaxValue);
    end;
  end;
end;

end.
