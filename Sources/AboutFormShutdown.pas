﻿unit AboutFormShutdown;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, GCAV, ShellAPI;

type
  TAbout = class(TForm)
    Panel1: TPanel;
    BCancel: TButton;
    lblAboutProgramName: TLabel;
    lblAboutAuthor: TLabel;
    lblAboutAuhtorDescription: TLabel;
    lblAboutEmail: TLabel;
    lblAboutEmailDescription: TLabel;
    imgAbout: TImage;
    mmoAboutDescription: TMemo;
    lblSite: TLabel;
    lblSiteLink: TLabel;
    lblVersion: TLabel;
    procedure lblAboutEmailDescriptionClick(Sender: TObject);
    procedure lblAboutEmailDescriptionMouseEnter(Sender: TObject);
    procedure lblAboutEmailDescriptionMouseLeave(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BCancelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lblSiteLinkMouseEnter(Sender: TObject);
    procedure lblSiteLinkMouseLeave(Sender: TObject);
    procedure lblSiteLinkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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

procedure TAbout.BCancelKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    BCancel.Click;
end;

procedure TAbout.FormActivate(Sender: TObject);
begin
lblVersion.Left := About.ClientWidth - lblVersion.Width - 15;
end;

procedure TAbout.FormCreate(Sender: TObject);
begin
  lblAboutProgramName.Caption := GLOBAL_PROJECT_NAME;
  lblVersion.Caption := GLOBAL_PROGECT_VERSION;
end;

procedure TAbout.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    BCancel.Click;
end;

procedure TAbout.lblAboutEmailDescriptionClick(Sender: TObject);
var
RetVal: NativeUInt;
begin
  RetVal := ShellExecute(Handle, 'open', PChar('mailto:AzizovReg@gmail.com?subject=PShutDown'), nil,
    nil, SW_SHOWNORMAL); // написать мне письмо
 if RetVal <= 32 then
    MessageDlg(langs[9], mtWarning, [mbOK], 0);
end;

procedure TAbout.lblAboutEmailDescriptionMouseEnter(Sender: TObject);
begin
  lblAboutEmailDescription.Font.Style := [fsUnderline];
end;

procedure TAbout.lblAboutEmailDescriptionMouseLeave(Sender: TObject);
begin
  lblAboutEmailDescription.Font.Style := [];
end;

procedure TAbout.lblSiteLinkClick(Sender: TObject);
begin
  ShellExecute(Handle, nil, 'https://code.google.com/p/pshutdown/', nil,
    nil, SW_SHOW);
end;

procedure TAbout.lblSiteLinkMouseEnter(Sender: TObject);
begin
  lblSiteLink.Font.Style := [fsUnderline];
  lblSiteLink.Cursor := crHandPoint;
end;

procedure TAbout.lblSiteLinkMouseLeave(Sender: TObject);
begin
  lblSiteLink.Font.Style := [];
  lblSiteLink.Cursor := crDefault;
end;

end.
