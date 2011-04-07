unit SelectSoundFormShutdown;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GCAV, ExtCtrls;

type
  TSelectSound = class(TForm)
    ESoundPath: TEdit;
    BBrowseSound: TButton;
    Label1: TLabel;
    CBSoundLoop: TCheckBox;
    BOK: TButton;
    BCancel: TButton;
    SoundBrowser: TOpenDialog;
    PanelHLine: TPanel;
    procedure BOKClick(Sender: TObject);
    procedure BBrowseSoundClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectSound: TSelectSound;

implementation

{$R *.dfm}

procedure TSelectSound.BBrowseSoundClick(Sender: TObject);
begin
  if SoundBrowser.Execute(Handle) then
  begin
    if FileExists(SoundBrowser.Files[0]) then
    begin
      ESoundPath.Text := SoundBrowser.Files[0];
    end;
  end;
end;

procedure TSelectSound.BOKClick(Sender: TObject);
begin
  if FileExists(ESoundPath.Text) then
    gvSoundPath := ESoundPath.Text
  else
    gvSoundPath := '';
  gvSoundLoop := CBSoundLoop.Checked;
end;

procedure TSelectSound.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    BCancel.Click;
end;

procedure TSelectSound.FormShow(Sender: TObject);
begin
  ESoundPath.Text := gvSoundPath;
  CBSoundLoop.Checked := gvSoundLoop;
end;

end.
