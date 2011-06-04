unit SelectProgramFormShutdown;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GCAV, ExtCtrls;

type
  TSelectProgramm = class(TForm)
    eFilePath: TEdit;
    eParameters: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BBrowse: TButton;
    BOK: TButton;
    BCancel: TButton;
    ProgramBrowser: TOpenDialog;
    PanelHLine: TPanel;
    procedure BBrowseClick(Sender: TObject);
    procedure BOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TSelectProgramm.FormActivate(Sender: TObject);
begin
  eFilePath.Text := gvFilePath;
  eParameters.Text := gvParameters;
end;

procedure TSelectProgramm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    BCancel.Click;
end;

end.
