unit FileMoveSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShlObj, GV;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtSourceFolder: TEdit;
    edtDestinationFolder: TEdit;
    btnSourceFolder: TButton;
    btnDestinationFolder: TButton;
    btnOK: TButton;
    btnCancel: TButton;
    procedure btnSourceFolderClick(Sender: TObject);
    procedure btnDestinationFolderClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function BrowseCallbackProc(hwnd: HWND; uMsg: UINT; lParam: LPARAM; lpData: LPARAM): Integer; stdcall;
begin
  if (uMsg = BFFM_INITIALIZED) then
    SendMessage(hwnd, BFFM_SETSELECTION, 1, lpData);
  BrowseCallbackProc := 0;
end;

function GetFolderDialog(Handle: Integer; Caption: string; var strFolder: string): Boolean;
const
  BIF_STATUSTEXT           = $0004;
  BIF_NEWDIALOGSTYLE       = $0040;
  BIF_RETURNONLYFSDIRS     = $0080;
  BIF_SHAREABLE            = $0100;
  BIF_USENEWUI             = BIF_EDITBOX or BIF_NEWDIALOGSTYLE;

var
  BrowseInfo: TBrowseInfo;
  ItemIDList: PItemIDList;
  JtemIDList: PItemIDList;
  Path: PWideChar;
begin
  Result := False;
  Path := StrAlloc(MAX_PATH);
  SHGetSpecialFolderLocation(Handle, CSIDL_DRIVES, JtemIDList);
  with BrowseInfo do
  begin
    hwndOwner := GetActiveWindow;
    pidlRoot := JtemIDList;
    SHGetSpecialFolderLocation(hwndOwner, CSIDL_DRIVES, JtemIDList);

    { return display name of item selected }
    pszDisplayName := StrAlloc(MAX_PATH);

    { set the title of dialog }
    lpszTitle := PChar(Caption);//'Select the folder';
    { flags that control the return stuff }
    lpfn := @BrowseCallbackProc;
    { extra info that's passed back in callbacks }
    lParam := LongInt(PChar(strFolder));
  end;

  ItemIDList := SHBrowseForFolder(BrowseInfo);

  if (ItemIDList <> nil) then
    if SHGetPathFromIDList(ItemIDList, Path) then
    begin
      strFolder := Path;
      Result := True
    end;
end;

procedure TForm1.btnDestinationFolderClick(Sender: TObject);
var S: string;
begin
if GetFolderDialog(Form1.Handle, 'Папка назначения', s) then
begin
if S[Length(S)] <> '\' then
begin
  S := S + '\';
end;

  edtDestinationFolder.Text := S;
  gvsDestinationFolder := S;
end;
end;

procedure TForm1.btnSourceFolderClick(Sender: TObject);
var s: string;
begin
if GetFolderDialog(Form1.Handle, 'Исходная папка', s) then
begin
if S[Length(S)] <> '\' then
begin
  S := S + '\';
end;
  edtSourceFolder.Text := s;
  gvsSourseFolder := s;
end;
end;



procedure TForm1.FormCreate(Sender: TObject);
begin
  edtSourceFolder.Text := gvsSourseFolder;
  edtDestinationFolder.Text := gvsDestinationFolder;
end;

end.
