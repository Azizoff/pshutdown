unit SettingsFormShutdown;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, GCAV, IniFiles;

type
  TSettings = class(TForm)
    TVCategories: TTreeView;
    PanelHLine: TPanel;
    BOK: TButton;
    BApply: TButton;
    BCancel: TButton;
    PanelDescription: TPanel;
    Label1: TLabel;
    pcSettings: TPageControl;
    tsGeneral: TTabSheet;
    tsInterface: TTabSheet;
    GroupBox1: TGroupBox;
    CBSShowMessageIfNow: TCheckBox;
    CBSShowMessageOnlyForCrytical: TCheckBox;
    CBAskIfClose: TCheckBox;
    CBOnlyIfTimerRunning: TCheckBox;
    GroupBox2: TGroupBox;
    CBSForceAction: TCheckBox;
    GroupBox3: TGroupBox;
    CBBeepLastTen: TCheckBox;
    GBLanguage: TGroupBox;
    Label2: TLabel;
    LVLanguage: TListView;
    GroupBox4: TGroupBox;
    CBMinimizeToTray: TCheckBox;
    CBMinimizeOnEscape: TCheckBox;
    procedure TVCategoriesChange(Sender: TObject; Node: TTreeNode);
    procedure BOKClick(Sender: TObject);
    procedure BApplyClick(Sender: TObject);
    procedure ChangeSetting(Sender: TObject);
    procedure BCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure LVLanguageChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    function SaveSettings(): Boolean;
    function LoadSettings(): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Settings: TSettings;
  vsSettingsChanged: Boolean;

implementation

{$R *.dfm}

procedure TSettings.BCancelClick(Sender: TObject);
begin
  vsSettingsChanged := False;
  BApply.Enabled := vsSettingsChanged;
end;

procedure TSettings.BOKClick(Sender: TObject);
begin
  SaveSettings();
end;

procedure TSettings.ChangeSetting(Sender: TObject);
begin
  vsSettingsChanged := True;
  BApply.Enabled := vsSettingsChanged;
  CBSShowMessageOnlyForCrytical.Enabled := CBSShowMessageIfNow.Checked;
  CBOnlyIfTimerRunning.Enabled := CBAskIfClose.Checked;
end;

procedure TSettings.BApplyClick(Sender: TObject);
begin
  SaveSettings();
end;

procedure TSettings.FormActivate(Sender: TObject);
var
  LangFile: TiniFile;
  SearchRec: TSearchRec;
  LIT: TListItem;
begin
  if (FindFirst(gvLanguagesPath + '*.ini', faAnyFile and not faDirectory,
    SearchRec) = 0) then
  begin
    LVLanguage.Items.BeginUpdate;
    LVLanguage.Items.Clear;

    LangFile := TiniFile.Create(gvLanguagesPath + SearchRec.Name);
    if LangFile.SectionExists('Language_File') then
    begin
      LIT := LVLanguage.Items.Add;
      LIT.Caption := LangFile.ReadString('Language_File', 'Language', 'Lang');
      LIT.SubItems.Add(SearchRec.Name);
      LIT.SubItems.Add(LangFile.ReadString('Language_File', 'Author', 'Auth'));
    end;
    FreeAndNil(LangFile);
    while FindNext(SearchRec) = 0 do
    begin
      LangFile := TiniFile.Create(gvLanguagesPath + SearchRec.Name);
      if LangFile.SectionExists('Language_File') then
      begin
        LIT := LVLanguage.Items.Add;
        LIT.Caption := LangFile.ReadString('Language_File', 'Language', 'Lang');
        LIT.SubItems.Add(SearchRec.Name);
        LIT.SubItems.Add(LangFile.ReadString('Language_File', 'Author',
          'Auth'));
      end;
      FreeAndNil(LangFile);
    end;
    LVLanguage.Items.EndUpdate;
  end;

  LoadSettings();
end;

procedure TSettings.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    BCancel.Click;
end;

procedure TSettings.FormShow(Sender: TObject);
begin
  TVCategories.Items[0].Selected := True;
  TVCategories.SetFocus;
  BApply.Enabled := vsSettingsChanged;
end;

function TSettings.LoadSettings: Boolean;
begin
  Result := True;
  vsSettingsChanged := False;
  CBSForceAction.Checked := gvsForceAction;
  CBSShowMessageIfNow.Checked := gvsShowMessageIfNow;
  CBSShowMessageOnlyForCrytical.Enabled := CBSShowMessageIfNow.Checked;
  CBSShowMessageOnlyForCrytical.Checked := gvsShowMessageOnlyForCrytical;
  CBAskIfClose.Checked := gvsAskIfClose;
  CBOnlyIfTimerRunning.Checked := gvsOnlyIfTimerRunning;
  CBBeepLastTen.Checked := gvsBeepLastTen;
  CBMinimizeToTray.Checked := gvsMinimizeToTray;
  CBMinimizeOnEscape.Checked := gvsMinimizeOnEscape;
  BApply.Enabled := vsSettingsChanged;
end;

procedure TSettings.LVLanguageChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  ChangeSetting(Sender);
end;

function TSettings.SaveSettings: Boolean;
var
  SettingFile: TiniFile;
begin
  Result := True;
  vsSettingsChanged := False;
  gvsForceAction := CBSForceAction.Checked;
  gvsShowMessageIfNow := CBSShowMessageIfNow.Checked;
  gvsShowMessageOnlyForCrytical := CBSShowMessageOnlyForCrytical.Checked;
  gvsBeepLastTen := CBBeepLastTen.Checked;
  gvsMinimizeToTray := CBMinimizeToTray.Checked;
  gvsMinimizeOnEscape := CBMinimizeOnEscape.Checked;
  gvsAskIfClose := CBAskIfClose.Checked;
  gvsOnlyIfTimerRunning := CBOnlyIfTimerRunning.Checked;
  if LVLanguage.ItemIndex > -1 then
    gvsLanguageFile := LVLanguage.Selected.SubItems[0];
  BApply.Enabled := vsSettingsChanged;

  SettingFile := TiniFile.Create(gvApplicationPath + DEF_SETTINGS_FILE);

  try
    with SettingFile do
    begin
      WriteBool('General', 'SHowMessageIfNow', gvsShowMessageIfNow);
      WriteBool('General', 'ShowMessageOnlyForCrytical',
        gvsShowMessageOnlyForCrytical);
      WriteBool('General', 'AskIfClose', gvsAskIfClose);
      WriteBool('General', 'OnlyIfTimerRunning', gvsOnlyIfTimerRunning);
      WriteBool('General', 'ForceAction', gvsForceAction);
      WriteBool('General', 'BeepLastTen', gvsBeepLastTen);
      WriteBool('General', 'BeepOnB', gvsBeepOnB);
      WriteInteger('General', 'BeepOnI', gvsBeepOnI);
      WriteBool('Interface', 'MinimizeToTray', gvsMinimizeToTray);
      WriteBool('Interface', 'MinimizeOnEscape', gvsMinimizeOnEscape);
      WriteString('Interface', 'LanguageFile', gvsLanguageFile);
    end;
  except
    MessageBox(Handle, PChar(langs[2] + NEW_LINE + langs[3]), 'PShutDown',
      MB_ICONINFORMATION);
  end;
  FreeAndNil(SettingFile);
end;

procedure TSettings.TVCategoriesChange(Sender: TObject; Node: TTreeNode);
begin
  Label1.Caption := Node.Text;
  if Node.Index < pcSettings.PageCount then
    pcSettings.ActivePageIndex := Node.Index;
end;

end.
