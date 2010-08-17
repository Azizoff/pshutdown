unit SelectPluginFormShutdown;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, PluginListManager, ComCtrls, GCAV;

type
  TSelectPlugin = class(TForm)
    lblAvailablePlugins: TLabel;
    MPluginInfo: TMemo;
    lblPluginDescription: TLabel;
    BOK: TButton;
    BCancel: TButton;
    PanelHLine: TPanel;
    BPluginSettings: TButton;
    LVPluginList: TListView;
    procedure FormActivate(Sender: TObject);
    procedure BOKClick(Sender: TObject);
    procedure BPluginSettingsClick(Sender: TObject);
    procedure LVPluginListDblClick(Sender: TObject);
    procedure LVPluginListSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
  public
    { Public declarations }
  end;

var
  SelectPlugin: TSelectPlugin;

implementation

{$R *.dfm}

procedure TSelectPlugin.BOKClick(Sender: TObject);
begin
  PluginList.SelectFocused;
  PostMessage(MainFormHandle, WMU_PLUGIN_SELECTED, PluginList.Selected, 0);
end;

procedure TSelectPlugin.BPluginSettingsClick(Sender: TObject);
begin
if PluginList.Focused > -1 then
begin
    if (PluginList.FocusedItem.PluginHasSettings) then
      PluginList.FocusedItem.ShowSettings
    else
      MessageBox(Handle, PChar(mbtext_ThisPluginHasNoSettings), 'PShutDown',
        MB_ICONINFORMATION);
end;
end;

procedure TSelectPlugin.FormActivate(Sender: TObject);
var
  I: Integer;
  ListItem: TListItem;
begin
  LVPluginList.Items.BeginUpdate;
  LVPluginList.Items.Clear;
  for I := 0 to PluginList.Count - 1 do
  begin
    with PluginList.Items[I] do
    begin
      ListItem := LVPluginList.Items.Add;
      ListItem.Caption := PluginInfo.Name;
      ListItem.SubItems.Add(PluginList.Items[I].PluginFile);
      with PluginInfo.Version do
      begin
        ListItem.SubItems.Add(Format('%u.%u.%u.%u', [Magor, Minor, Release,
            Build]));
      end;
    end;
  end;
  LVPluginList.Items.EndUpdate;

  BPluginSettings.Visible := False;
  if PluginList.Selected > -1 then
  begin
    LVPluginList.ItemIndex := PluginList.Selected;
    BPluginSettings.Visible :=
    PluginList.SelectedItem.PluginInfo.HasSettings;
  end;

end;

procedure TSelectPlugin.LVPluginListDblClick(Sender: TObject);
begin
  BOK.Click;
end;

procedure TSelectPlugin.LVPluginListSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
PluginList.Focused := LVPluginList.ItemIndex;
    BPluginSettings.Visible := False;
    MPluginInfo.Clear;
  if (PluginList.Focused > -1)  then
  begin
    MPluginInfo.Text := PluginList.FocusedItem.PluginInfo.Description;
    BPluginSettings.Visible := PluginList.FocusedItem.PluginInfo.HasSettings;
  end;
end;

end.
