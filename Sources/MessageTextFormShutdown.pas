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
    Label1: TLabel;
    procedure BOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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

end.
