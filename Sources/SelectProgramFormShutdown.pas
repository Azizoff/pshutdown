unit SelectProgramFormShutdown;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GCAV, ExtCtrls, PathUtils;

type
  TSelectProgramm = class(TForm)
    eFilePath: TEdit;
    eParameters: TEdit;
    lblPath: TLabel;
    lblParameters: TLabel;
    BBrowse: TButton;
    BOK: TButton;
    BCancel: TButton;
    ProgramBrowser: TOpenDialog;
    PanelHLine: TPanel;
    BToRelative: TButton;
    procedure BBrowseClick(Sender: TObject);
    procedure BOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BToRelativeClick(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectProgramm: TSelectProgramm;

implementation

{$R *.dfm}

procedure TSelectProgramm.BBrowseClick(Sender: TObject);
begin
  if ProgramBrowser.Execute(Handle) then
  begin
    if FileExists(ProgramBrowser.Files[0]) then
    begin
      eFilePath.Text := ProgramBrowser.Files[0];
    end;
  end;
end;

procedure TSelectProgramm.BOKClick(Sender: TObject);
begin
  gvFilePath := eFilePath.Text;
  gvParameters := eParameters.Text;
end;

procedure TSelectProgramm.BToRelativeClick(Sender: TObject);
begin
  eFilePath.Text := AbsolutePathToRelative(gvApplicationPath, eFilePath.Text);
end;

procedure TSelectProgramm.FormActivate(Sender: TObject);
begin
  eFilePath.Text := gvFilePath;
  eParameters.Text := gvParameters;
  ProgramBrowser.Filter := langs[13]+'|*.exe';
end;

procedure TSelectProgramm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    BCancel.Click;
end;

end.
