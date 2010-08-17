unit BeeperPluginSettings;

interface

uses
  Forms, StdCtrls, Controls, Classes, GV, Windows;

type
  TBeeperSettingsForm = class(TForm)
    BOK: TButton;
    BCancel: TButton;
    CBBeepType: TComboBox;
    Label1: TLabel;
    procedure BOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BeeperSettingsForm: TBeeperSettingsForm;

implementation

{$R *.dfm}

procedure TBeeperSettingsForm.BOKClick(Sender: TObject);
begin
  case CBBeepType.ItemIndex of
    0:
      BeeperType := MB_OK;
    1:
      BeeperType := MB_ICONHAND;
    2:
      BeeperType := MB_ICONQUESTION;
    3:
      BeeperType := MB_ICONEXCLAMATION;
    4:
      BeeperType := MB_ICONASTERISK;
  else
    BeeperType := MB_OK;
  end;
end;

procedure TBeeperSettingsForm.FormActivate(Sender: TObject);
begin
  case BeeperType of
    MB_OK:
      CBBeepType.ItemIndex := 0;
    MB_ICONHAND:
      CBBeepType.ItemIndex := 1;
    MB_ICONQUESTION:
      CBBeepType.ItemIndex := 2;
    MB_ICONEXCLAMATION:
      CBBeepType.ItemIndex := 3;
    MB_ICONASTERISK:
      CBBeepType.ItemIndex := 4;
  else
    CBBeepType.ItemIndex := 0;
  end;
end;

end.
