unit ULampForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TfrmLamp = class(TForm)
    imgLampOn: TImage;
    imgLampOff: TImage;
    tmrSwitcher: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure tmrSwitcherTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLamp: TfrmLamp;

implementation

{$R *.dfm}

procedure TfrmLamp.FormCreate(Sender: TObject);
begin
imgLampOn.Visible := False;
imgLampOff.Visible := True;
tmrSwitcher.Enabled := True;
end;

procedure TfrmLamp.tmrSwitcherTimer(Sender: TObject);
begin
imgLampOff.Visible := imgLampOn.Visible;
imgLampOn.Visible := not imgLampOn.Visible;
end;

end.
