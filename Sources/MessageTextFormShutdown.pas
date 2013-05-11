unit MessageTextFormShutdown;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, GCAV;

type
  TMessageText = class(TForm)
    MMessageText: TMemo;
    BOK: TButton;
    BCancel: TButton;
    PanelHLine: TPanel;
    lblTextMessage: TLabel;
    procedure BOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MessageText: TMessageText;

implementation

{$R *.dfm}

procedure TMessageText.BOKClick(Sender: TObject);
begin
  gvTextMessage := MMessageText.Text;
end;

procedure TMessageText.FormActivate(Sender: TObject);
begin
  MMessageText.Text := gvTextMessage;
end;

procedure TMessageText.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    BCancel.Click;
end;

end.
