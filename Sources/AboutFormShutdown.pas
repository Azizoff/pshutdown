unit AboutFormShutdown;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, GCAV, ShellAPI;

type
  TAbout = class(TForm)
    Panel1: TPanel;
    BClose: TButton;
    lblAboutProgramName: TLabel;
    lblAboutAuthor: TLabel;
    lblAboutAuhtorDescription: TLabel;
    lblAboutEmail: TLabel;
    lblAboutEmailDescription: TLabel;
    imgAbout: TImage;
    mmoAboutDescription: TMemo;
    procedure lblAboutEmailDescriptionClick(Sender: TObject);
    procedure lblAboutEmailDescriptionMouseEnter(Sender: TObject);
    procedure lblAboutEmailDescriptionMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  About: TAbout;

const
  AboutText = ' ';

implementation

{$R *.dfm}

procedure TAbout.lblAboutEmailDescriptionClick(Sender: TObject);
begin
  ShellExecute(Handle, nil, 'mailto:AzizovReg@Gmail.com?subject=PShutDown',
    nil, nil, SW_RESTORE); // написать мне письмо
end;

procedure TAbout.lblAboutEmailDescriptionMouseEnter(Sender: TObject);
begin
  lblAboutEmailDescription.Font.Style := [fsUnderline];
end;

procedure TAbout.lblAboutEmailDescriptionMouseLeave(Sender: TObject);
begin
  lblAboutEmailDescription.Font.Style := [];
end;

end.
