unit MNGPlugins;

interface
uses MainFrame, Windows, SysUtils, SharedTypes;
type
  TManagerOfPlugin = class(TMainFrame)
  private
    FHandle: THandle;
    FGetPluginInfo: TGetPluginInfo;
    FDoAction: TDoAction;
    FShowSettings: TShowSettings;
    FPluginInfo: TPluginInfo;
    FPluginFile: string;
    function GetPluginInfo: TPluginInfo;
  public
    property PluginFile: string read FPluginFile;
    property PluginInfo: TPluginInfo read FPluginInfo;
    property PluginHasSettings: Boolean read FPluginInfo.HasSettings;
    function DoAction(): Cardinal; override;
    function ShowSettings(): Cardinal;
    constructor Create(const PluginPath: string; var IsValidModule: Boolean);
    destructor Destroy; override;
  end;
implementation
{ TManagerOfPlugin }

constructor TManagerOfPlugin.Create(const PluginPath: string;
  var IsValidModule: Boolean);
begin
  IsValidModule := False;
  // загрузка
  FHandle := LoadLibrary(PChar(PluginPath));
  if (FHandle > 0) then
  begin
    // получение адресов функций плагина
    FGetPluginInfo := GetProcAddress(FHandle, 'GetPluginInfo');
    FDoAction := GetProcAddress(FHandle, 'DoAction');
    FShowSettings := GetProcAddress(FHandle, 'ShowSettings');
    FPluginFile := ExtractFileName(PluginPath);
    // начальные действия
    FPluginInfo := GetPluginInfo;
    IsValidModule := True;
  end;
end;

destructor TManagerOfPlugin.Destroy;
begin
  FreeLibrary(FHandle);
  FHandle := 0;
  FGetPluginInfo := nil;
  FDoAction := nil;
  inherited Destroy;
end;

function TManagerOfPlugin.DoAction: Cardinal;
begin
  Result := 0;
  if @FDoAction <> nil then
    Result := FDoAction;
end;

function TManagerOfPlugin.GetPluginInfo: TPluginInfo;
begin
  Result.Name := 'null';
  Result.Author := 'null';
  Result.Description := 'null';
  Result.Version := SetVersion(0, 0, 0, 0);
  if @FGetPluginInfo <> nil then
    Result := FGetPluginInfo;
end;

function TManagerOfPlugin.ShowSettings: Cardinal;
begin
  Result := 0;
  if @FShowSettings <> nil then
    Result := FShowSettings;
end;
end.
