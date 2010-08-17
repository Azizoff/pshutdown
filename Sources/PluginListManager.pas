unit PluginListManager;

interface

uses MNGPlugins, SysUtils;

type
  TPluginList = class
  private
    fList: array of TManagerOfPlugin;
    fListLength: Integer;
    fSelectedIndex: Integer;
    fFocusedIndex: Integer;
    function GetItem(Index: Integer): TManagerOfPlugin;
    function GetSelectedItem(): TManagerOfPlugin;
    function GetFocusedItem: TManagerOfPlugin;
  public
    procedure FocusItem(const newIndex: Integer);
    property Focused: Integer read fFocusedIndex write FocusItem;
    procedure SelectFocused();
    procedure SelectItem(const newIndex: Integer);
    property Selected: Integer read fSelectedIndex write SelectItem;
    property Count: Integer read fListLength;
    property Length: Integer read fListLength;
    function AddPlugin(const PluginPath: string): Boolean;
    constructor Create();
    destructor Destroy; override;
    property Items[Index: Integer]: TManagerOfPlugin read GetItem;
    property SelectedItem: TManagerOfPlugin read GetSelectedItem;
    property FocusedItem: TManagerOfPlugin read GetFocusedItem;
  end;

var
  PluginList: TPluginList;

implementation

{ TPluginList }

function TPluginList.AddPlugin(const PluginPath: string): Boolean;
var
  TempPlugin: TManagerOfPlugin;
  IsOK: Boolean;
begin
  Result := False;
  TempPlugin := TManagerOfPlugin.Create(PluginPath, IsOK);
  if IsOK then
  begin
    SetLength(fList, fListLength + 1);
    fList[fListLength] := TempPlugin;
    Inc(fListLength);
  end
  else
    FreeAndNil(TempPlugin);
end;

constructor TPluginList.Create;
begin
  fListLength := 0;
  fSelectedIndex := -1;
  fFocusedIndex := -1;
end;

destructor TPluginList.Destroy;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
  begin
    FreeAndNil(fList[I]);
  end;
  inherited Destroy;
end;

procedure TPluginList.FocusItem(const newIndex: Integer);
begin
  fFocusedIndex := -1;
if (newIndex > -1) and (newIndex < fListLength) then
  fFocusedIndex := newIndex;
end;

function TPluginList.GetFocusedItem: TManagerOfPlugin;
begin
  Result := nil;
  if (fFocusedIndex > -1) and (fFocusedIndex < fListLength) then
    Result := fList[fFocusedIndex];
end;

function TPluginList.GetItem(Index: Integer): TManagerOfPlugin;
begin
  Result := nil;
  if (Index > -1) and (Index < fListLength) then
    Result := fList[Index];
end;

function TPluginList.GetSelectedItem: TManagerOfPlugin;
begin
  Result := nil;
  if (fSelectedIndex > -1) and (fSelectedIndex < fListLength) then
    Result := fList[fSelectedIndex];
end;

procedure TPluginList.SelectFocused;
begin
  fSelectedIndex := fFocusedIndex;
end;

procedure TPluginList.SelectItem(const newIndex: Integer);
begin
  fSelectedIndex := -1;
  if (newIndex > -1) and (newIndex < fListLength) then
  begin
    fSelectedIndex := newIndex;
    fFocusedIndex := newIndex;
  end;
end;

end.
