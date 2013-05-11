unit SettingsFormShutdown;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, GCAV, IniFiles, SettingsManager;

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
    LBLngFile: TLabel;
    LVLanguage: TListView;
    GBSysTray: TGroupBox;
    CBMinimizeToTray: TCheckBox;
    CBMinimizeOnEscape: TCheckBox;
    tsOther: TTabSheet;
    CBShowFormInLastTenSec: TCheckBox;
    GBPBDisplay: TRadioGroup;
    procedure TVCategoriesChange(Sender: TObject; Node: TTreeNode);
    procedure BOKClick(Sender: TObject);
    procedure BApplyClick(Sender: TObject);
    procedure ChangeSetting(Sender: TObject);
    procedure BCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure LVLanguageChange(Sender: TObject; Item: TListItem; Change: TItemChange);
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
  if (FindFirst(gvLanguagesPath + '*.ini', faAnyFile and not faDirectory, SearchRec) = 0) then
  begin
    LVLanguage.Items.BeginUpdate;
    LVLanguage.Items.Clear;

    LangFile := TiniFile.Create(gvLanguagesPath + SearchRec.Name);
    if LangFile.SectionExists('Language_File') then
    begin
      LIT := LVLanguage.Items.Add;
      LIT.Caption := UTF8ToString(LangFile.ReadString('Language_File', 'Language', 'Lang'));
      LIT.SubItems.Add(SearchRec.Name);
      LIT.SubItems.Add(UTF8ToString(LangFile.ReadString('Language_File', 'Author', 'Auth')));
    end;
    FreeAndNil(LangFile);
    while FindNext(SearchRec) = 0 do
    begin
      LangFile := TiniFile.Create(gvLanguagesPath + SearchRec.Name);
      if LangFile.SectionExists('Language_File') then
      begin
        LIT := LVLanguage.Items.Add;
        LIT.Caption := UTF8ToString(LangFile.ReadString('Language_File', 'Language', 'Lang'));
        LIT.SubItems.Add(SearchRec.Name);
        LIT.SubItems.Add(UTF8ToString(LangFile.ReadString('Language_File', 'Author', 'Auth')));
      end;
      FreeAndNil(LangFile);
    end;
    LVLanguage.Items.EndUpdate;
  end;

  LoadSettings();
end;

procedure TSettings.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
  CBSForceAction.Checked := GlobalSettings.ForceAction;
  CBSShowMessageIfNow.Checked := GlobalSettings.ShowMessageIfNow;
  CBSShowMessageOnlyForCrytical.Enabled := CBSShowMessageIfNow.Checked;
  CBSShowMessageOnlyForCrytical.Checked := GlobalSettings.ShowMessageOnlyForCrytical;
  CBAskIfClose.Checked := GlobalSettings.AskIfClose;
  CBOnlyIfTimerRunning.Checked := GlobalSettings.OnlyIfTimerRunning;
  CBBeepLastTen.Checked := GlobalSettings.BeepLastTen;
  CBMinimizeToTray.Checked := GlobalSettings.MinimizeToTray;
  CBMinimizeOnEscape.Checked := GlobalSettings.MinimizeOnEscape;
  BApply.Enabled := vsSettingsChanged;
  CBShowFormInLastTenSec.Checked := GlobalSettings.ShowFormInLastTenSec;
  GBPBDisplay.ItemIndex := GlobalSettings.ProgressBarDisplayMode;
end;

procedure TSettings.LVLanguageChange(Sender: TObject; Item: TListItem; Change: TItemChange);
begin
  ChangeSetting(Sender);
end;

function TSettings.SaveSettings: Boolean;
begin
  Result := True;
  vsSettingsChanged := False;
  GlobalSettings.ForceAction := CBSForceAction.Checked;
  GlobalSettings.ShowMessageIfNow := CBSShowMessageIfNow.Checked;
  GlobalSettings.ShowMessageOnlyForCrytical := CBSShowMessageOnlyForCrytical.Checked;
  GlobalSettings.BeepLastTen := CBBeepLastTen.Checked;
  GlobalSettings.MinimizeToTray := CBMinimizeToTray.Checked;
  GlobalSettings.MinimizeOnEscape := CBMinimizeOnEscape.Checked;
  GlobalSettings.AskIfClose := CBAskIfClose.Checked;
  GlobalSettings.OnlyIfTimerRunning := CBOnlyIfTimerRunning.Checked;
  GlobalSettings.ShowFormInLastTenSec := CBShowFormInLastTenSec.Checked;
  GlobalSettings.ProgressBarDisplayMode := GBPBDisplay.ItemIndex;
  if LVLanguage.ItemIndex > -1 then
    GlobalSettings.LanguageFile := LVLanguage.Selected.SubItems[0];
  BApply.Enabled := vsSettingsChanged;

  if not GlobalSettings.SaveToFile(gvApplicationPath, DEF_SETTINGS_FILE) then
    MessageBox(Handle, PChar(langs[2] + NEW_LINE + langs[3]), 'PShutDown', MB_ICONINFORMATION);
end;

procedure TSettings.TVCategoriesChange(Sender: TObject; Node: TTreeNode);
begin
  Label1.Caption := Node.Text;
  if Node.Index < pcSettings.PageCount then
    pcSettings.ActivePageIndex := Node.Index;
end;

end.
