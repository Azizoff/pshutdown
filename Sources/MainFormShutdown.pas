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
  MNGAlarm,
  MNGHibernate,
  MNGPlugins,
  MNGMessage,
  ULogger;

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
    mniNotAvaliableYet1: TMenuItem;
    mniN1: TMenuItem;
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
    procedure UDMinuteAfterMouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure UDHourAfterMouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure UDSecondAfterMouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure UDHourAtMouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure UDMinuteAtMouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure UDSecondAtMouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
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
    procedure UDHourEveryMouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure UDMinuteEveryMouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure UDSecondEveryMouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure RBEveryClick(Sender: TObject);
    procedure mniSaveAsLangFileClick(Sender: TObject);
        procedure PluginMenuOnClick(Sender: TObject);
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
    { Private declarations }
  public
    { Public declarations }
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
  CloseProgramm:Boolean  = False;
const
  ShiftWeek: array[0..6] of Byte = (6, 0, 1, 2, 3, 4, 5);
  DBG_MODE = False;
procedure TimerProc(uTimerID, uMessage: UINT; dwUser, dw1, dw2: DWORD); stdcall;

implementation

{$R *.dfm}

procedure TimerProc(uTimerID, uMessage: UINT; dwUser, dw1, dw2: DWORD) stdcall;
begin
  Counter.Decrement;

  if gvsBeepLastTen then
    if Counter.TotalSeconds < 10 then
    begin
      Windows.Beep(2000, 50);
    end;

  if gvsBeepOnB then
    if (Counter.TotalSeconds mod (gvsBeepOnI * 60) = 0) then
    begin
      Windows.Beep(1000, 300);
    end;

  with MainFormSD do
  begin
    CBDaysAfter.ItemIndex := StrToInt(Counter.sDays);
    pbTotalProgress.StepIt;
    pbHintLabel.Caption := Format('%.1f %%',[(pbTotalProgress.Position / pbTotalProgress.Max) * 100]);
    EHourAfter.Text := Counter.sHours;
    EMinuteAfter.Text := Counter.sMinutes;
    ESecondAfter.Text := Counter.sSeconds;
    if Counter.TotalSeconds = 0 then
    begin
      DoAction;
      if not RBEvery.Checked then
        BPauseClick(BPause)
      else
        Counter.SetFields(0, StrToInt(EHourEvery.Text),
          StrToInt(EMinuteEvery.Text), StrToInt(ESecondEvery.Text));

    end;
  end;

end;

procedure TMainFormSD.LoadPlugIns;
var
  SearchRec: TSearchRec;
begin
  if (FindFirst(gvPluginsPath + '*.dll',
    faAnyFile and not faDirectory, SearchRec) = 0) then
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
  SettingFile := TIniFile.Create(gvApplicationPath + DEF_SETTINGS_FILE);
  try
    with SettingFile do
    begin
      gvsShowMessageIfNow := ReadBool('General', 'SHowMessageIfNow', False);
      gvsShowMessageOnlyForCrytical := ReadBool('General',
        'ShowMessageOnlyForCrytical', False);
      gvsAskIfClose := ReadBool('General', 'AskIfClose', True);
      gvsForceAction := ReadBool('General', 'ForceAction', False);
      gvsBeepLastTen := ReadBool('General', 'BeepLastTen', False);
      gvsBeepOnB := ReadBool('General', 'BeepOnB', False);
      gvsBeepOnI := ReadInteger('General', 'BeepOnI', 2);
      gvsMinimizeToTray := ReadBool('Interface', 'MinimizeToTray', False);
      gvsMinimizeOnEscape := ReadBool('Interface', 'MinimizeOnEscape', False);
      gvsLanguageFile := ReadString('Interface', 'LanguageFile', '');
      gvFilePath := ReadString('Other', 'FilePath', '');
      gvParameters := ReadString('Other', 'Parameters', '');
      gvSoundPath := ReadString('Other', 'SoundPath', '');
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
    Counter.SetFields(StrToInt(CBDaysAfter.Text), StrToInt(EHourAfter.Text),
      StrToInt(EMinuteAfter.Text), StrToInt(ESecondAfter.Text));
  end;

  if RBAt.Checked then
  begin
    GetLocalTime(lLocalTime);
    if (lLocalTime.wSecond = 0) and (lLocalTime.wMinute = 0) and
      (lLocalTime.wHour = 0) then
    begin
      lLocalTime.wHour := 24;
    end;

    lLocalTimeAsSeconds :=
      (lLocalTime.wHour * SECONDS_IN_HOUR + lLocalTime.wMinute *
      SECONDS_IN_MINUTE + lLocalTime.wSecond);
    lHour := StrToInt(EHourAt.Text);
    lMinute := StrToInt(EMinuteAt.Text);
    lSecond := StrToInt(ESecondAt.Text);
    if (lSecond = 0) and (lMinute = 0) and (lHour = 0) then
    begin
      lHour := 24;
    end;

    lSetupTime := lHour * 3600 + lMinute * 60 + lSecond;

    if (CBDaysAt.ItemIndex = ShiftWeek[lLocalTime.wDayOfWeek]) and
      (lSetupTime < lLocalTimeAsSeconds) then
    begin
      lSetupTime := lSetupTime + 7 * SECONDS_IN_DAY;
    end;

    if (CBDaysAt.ItemIndex < ShiftWeek[lLocalTime.wDayOfWeek]) then
    begin
      lSetupTime := lSetupTime +
        (7 - ShiftWeek[lLocalTime.wDayOfWeek] + CBDaysAt.ItemIndex)
        * SECONDS_IN_DAY;
    end;

    if (CBDaysAt.ItemIndex > ShiftWeek[lLocalTime.wDayOfWeek]) then
    begin
      lSetupTime := lSetupTime +
        (CBDaysAt.ItemIndex - ShiftWeek[lLocalTime.wDayOfWeek])
        * SECONDS_IN_DAY;
    end;
    Counter.SetFields(lSetupTime - lLocalTimeAsSeconds);
  end;

  if RBEvery.Checked then
  begin
    Counter.SetFields(0, StrToInt(EHourEvery.Text),
      StrToInt(EMinuteEvery.Text), StrToInt(ESecondEvery.Text));
  end;

  if Counter.TotalSeconds > 0 then
  begin
    pbTotalProgress.Max := Counter.TotalSeconds;
    TimerID := timeSetEvent(1000, timeGetMinPeriod, TimerProc, 0,
      TIME_CALLBACK_FUNCTION or TIME_PERIODIC);
  end
  else
  begin
    MessageBox(handle, 'Установите таймер', 'PShutDown',
      MB_OK or MB_ICONINFORMATION);
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
  sndPlaySound(nil, SND_ASYNC);
  BStopAlarm.Visible := False;
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
  SetWindowPos(ChildHandle, MainFormSD.handle, X, Y, 0, 0,
    SWP_NOSIZE or SWP_NOZORDER);
end;

procedure TMainFormSD.ChangeLanguage;
var
  Localizer: TMultiLocalizer;
begin
  if FileExists(gvLanguagesPath + gvsLanguageFile)
    then
  begin
    Localizer := TMultiLocalizer.Create(gvLanguagesPath + gvsLanguageFile);
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
  timeKillEvent(TimerID);
  TimerID := 0;
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
  if gvsShowMessageIfNow then
  begin
    if gvsShowMessageOnlyForCrytical then
    begin
      if RGActionList.ItemIndex in [0..3] then
      begin
        if (MessageBox(handle,
          PWideChar(mbtext_AreYouShoreWantTo + NEW_LINE + RGActionList.Items
          [RGActionList.ItemIndex] + '?'), 'PShutDown',
          MB_YESNO or MB_ICONQUESTION) = mrYes) then
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
      if (MessageBox(handle,
        PWideChar(mbtext_AreYouShoreWantTo + NEW_LINE + RGActionList.Items
        [RGActionList.ItemIndex] + '?'), 'PShutDown',
        MB_YESNO or MB_ICONQUESTION) = mrYes) then
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

procedure TMainFormSD.BBrowsePluginClick(Sender: TObject);
begin
  CenterModal(SelectPlugin.Handle);
  SelectPlugin.ShowModal;
end;

procedure TMainFormSD.BBrowseProgrammClick(Sender: TObject);
begin
  CenterModal(SelectProgramm.handle);
  SelectProgramm.ShowModal;
  SaveOtherSettings;
end;

function TMainFormSD.DoAction(): Boolean;
var
  IsOK: Boolean;
begin
  IsOK := True;
  if Actor <> nil then
  begin
    if not (Actor is TManagerOfPlugin) then
      FreeAndNil(Actor);
  end;
  case RGActionList.ItemIndex of
    0:
    begin
      Actor := TManagerOfShutDown.Create(sdShutdown, gvsForceAction);
    end;
    1:
    begin
      Actor := TManagerOfShutDown.Create(sdReboot, gvsForceAction);
    end;
    2:
      Actor := TManagerOfShutDown.Create(sdLogOff, gvsForceAction);
    3:
      Actor := TManagerOfHibernate.Create();
    4:
      Actor := TManagerOfDisplay.Create(handle, True);
    5:
      Actor := TManagerOfExecuting.Create(handle, gvFilePath, gvParameters,
        IsOK);
    6:
      begin
        Actor := TManagerOfAlarm.Create(handle, gvSoundPath, gvSoundLoop, IsOK);
        BStopAlarm.Visible := gvSoundLoop and IsOK;
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

  if (Actor <> nil) and (IsOK) then
  begin
  Actor.DoAction ;
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

procedure TMainFormSD.FormatText(Sender: TObject);
begin
  if Length(TEdit(Sender).Text) = 0 then
    TEdit(Sender).Text := '0';
  TEdit(Sender).Text := Format('%2.2d', [StrToInt(TEdit(Sender).Text)]);
end;

function TMainFormSD.timeGetMinPeriod(): DWORD;
begin
  Result := 1;
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

procedure TMainFormSD.UDHourAfterMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
  EHourAfter.SetFocus;
end;

procedure TMainFormSD.UDHourAtClick(Sender: TObject; Button: TUDBtnType);
begin
  FormatText(EHourAt);
end;

procedure TMainFormSD.UDHourAtMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
  EHourAt.SetFocus;
end;

procedure TMainFormSD.UDMinuteAfterClick(Sender: TObject; Button: TUDBtnType);
begin
  FormatText(EMinuteAfter);
end;

procedure TMainFormSD.UDMinuteAfterMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
  EMinuteAfter.SetFocus;
end;

procedure TMainFormSD.UDMinuteAtClick(Sender: TObject; Button: TUDBtnType);
begin
  FormatText(EMinuteAt);
end;

procedure TMainFormSD.UDMinuteAtMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
  EMinuteAt.SetFocus;
end;

procedure TMainFormSD.UDSecondAfterClick(Sender: TObject; Button: TUDBtnType);
begin
  FormatText(ESecondAfter);
end;

procedure TMainFormSD.UDSecondAfterMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
  ESecondAfter.SetFocus;
end;

procedure TMainFormSD.UDSecondAtClick(Sender: TObject; Button: TUDBtnType);
begin
  FormatText(ESecondAt);
end;

procedure TMainFormSD.UDSecondAtMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
  EMinuteAt.SetFocus;
end;

procedure TMainFormSD.UDHourEveryClick(Sender: TObject; Button: TUDBtnType);
begin
  FormatText(EHourEvery);
end;

procedure TMainFormSD.UDHourEveryMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
  EHourEvery.SetFocus;
end;

procedure TMainFormSD.UDMinuteEveryClick(Sender: TObject; Button: TUDBtnType);
begin
  FormatText(EMinuteEvery);
end;

procedure TMainFormSD.UDMinuteEveryMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
  EMinuteEvery.SetFocus;
end;

procedure TMainFormSD.UDSecondEveryClick(Sender: TObject; Button: TUDBtnType);
begin
  FormatText(ESecondEvery);
end;

procedure TMainFormSD.UDSecondEveryMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
  ESecondEvery.SetFocus;
end;

procedure TMainFormSD.WindowMessage(var Msg: TMessage);
begin
  if Msg.WParam = SC_MINIMIZE then
  begin
    if gvsMinimizeToTray then
    begin
      TrayIcon.Visible := True;
      Hide;
    end
    else
      Application.Minimize;
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
var I:Integer;
begin
  timeKillEvent(TimerID);
  if not (Actor is TManagerOfPlugin) then
    FreeAndNil(Actor);
  FreeAndNil(PluginList);
  FreeAndNil(Counter);
  I:= pmPluginChoise.Items.Count - 1;
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
  if (gvsAskIfClose) and (not CloseProgramm) then
  begin
    Answ := MessageBox(handle, PChar(mbtext_AreYouShoreWantTo + 'close PShutDown?'),
      'PShutDown', MB_YESNO or MB_ICONQUESTION);
    CanClose := Answ = mrYes;
  end
  else
  begin
   CanClose := True;
  end;
end;

procedure TMainFormSD.FormCreate(Sender: TObject);
var
  I: Integer;
  NewMenuItem: TMenuItem;
begin
  MainFormHandle := Handle;
  gvApplicationPath := ExtractFilePath(ParamStr(0));
  gvLanguagesPath := gvApplicationPath + LANGUAGE_PATH;
  gvPluginsPath := gvApplicationPath + PLUGIN_PATH;
  Counter := TCounter.Create();
  LoadSettings();
  PluginList := TPluginList.Create;
  LoadPlugIns();
  TimerID := 0;
  mniSaveAsLangFile.Visible := DebugHook = 1;
  LangLoaded := False;
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
  pbHintLabel := TLabel.Create(Self);
  pbHintLabel.SetParentComponent(pbTotalProgress);
  pbHintLabel.Font.Size := 10;
  pbHintLabel.Font.Color := RGB(70, 80, 70);
  pbHintLabel.SetBounds(
  (pbTotalProgress.Width div 2) -
  (pbHintLabel.Width div 2),
  (pbTotalProgress.Height div 2) -
  (pbHintLabel.Height div 2)
  ,0,0);
end;

procedure TMainFormSD.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if gvsMinimizeOnEscape then
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
  gvMainWindowHandle := MainFormSD.Handle;
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
  CBDaysAt.ItemIndex := ShiftWeek[DayOfWeek(Date) - 1];
  BStopAlarm.Visible := False;
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

procedure TMainFormSD.mniSettingsClick(Sender: TObject);
var
  OldLang: string;
begin
  CenterModal(Settings.handle);
  OldLang := gvsLanguageFile;
  IntToStr(Settings.ShowModal);
  if OldLang <> gvsLanguageFile then
  begin
    MainFormSD.ChangeLanguage();
  end;
  if gvsForceAction then
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

procedure TMainFormSD.OnSelectPlugin(var Msg: TMessage);
var
  I:Integer;
begin
  if (Msg.WParam>-1) then
  begin
    pmPluginChoise.Items[Msg.WParam].Checked  := True;
    RGActionList.Buttons[8].Caption := PluginList.SelectedItem.PluginInfo.Name
  end
  else
  begin
  RGActionList.Buttons[8].Caption := mbtext_ChoosePlugin;
    I := pmPluginChoise.Items.Count - 1;
    while (I >= 0) do
    begin
      pmPluginChoise.Items[I].Checked  := False;
      Dec(I);
    end;
  end;
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
        mbAnswer := MessageBox(Handle, 'System time was changed' + NEW_LINE +
        'Update timer?', 'PShutDown', MB_YESNO + MB_ICONQUESTION);
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
    RGActionList.Buttons[8].Caption :=
    PluginList.SelectedItem.PluginInfo.Name;
  end
  else
  begin
    RGActionList.Buttons[8].Caption := mbtext_ChoosePlugin;
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
  try
    I := Localizer.AddForm(MainFormSD);
    Localizer.AddFilter(I, 'CBDaysAfter');
    Localizer.AddFilter(I, 'N4');
    Localizer.AddFilter(I, '');
    I := Localizer.AddForm(About);
    Localizer.AddFilter(I, 'lblAboutAuhtorDescription');
    Localizer.AddFilter(I, 'lblAboutEmailDescription');
    Localizer.AddFilter(I, 'lblAboutProgramName');
    I := Localizer.AddForm(Settings);
    Localizer.AddFilter(I, 'Label1');
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
  SettingFile := TIniFile.Create(gvApplicationPath
    + DEF_SETTINGS_FILE);
  try
    with SettingFile do
    begin
      WriteString('Other', 'FilePath', gvFilePath);
      WriteString('Other', 'Parameters', gvParameters);
      WriteString('Other', 'SoundPath', gvSoundPath);
      WriteBool('Other', 'SoundLoop', gvSoundLoop);
    end;
  except
    MessageBox(handle,
      PChar(mbtext_UnableToSaveSettings + NEW_LINE +
      mbtext_FileIsWriteProtected), 'PShutDown',
      MB_ICONINFORMATION);
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
