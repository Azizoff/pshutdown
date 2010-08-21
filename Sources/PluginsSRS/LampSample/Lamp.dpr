library Lamp;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SharedTypes in '..\..\SharedTypes.pas',
  ULampForm in 'ULampForm.pas' {frmLamp};
var AllreadyRunning:Boolean = False;
{$R *.res}
function DoAction: Cardinal; stdcall;
begin
Result := 0;
if not AllreadyRunning then
begin
  AllreadyRunning := True;
  frmLamp := TfrmLamp.Create(nil);
  Result := frmLamp.ShowModal;
  frmLamp.Free;
  AllreadyRunning := False;
end;
end;

function GetPluginInfo(): TPluginInfo; stdcall;
begin
  Result.Name := PWideChar('Lamp');
  Result.Author := PWideChar('Ильдар Азизов [Azizoff]');
  Result.Description := PWideChar('Тестовый плагин' + #13 + #10 +
      'Мигающая лампочка');
  Result.HasSettings := False;
  Result.Version := SetVersion(0, 0, 0, 2);
end;

exports DoAction name 'DoAction', GetPluginInfo name 'GetPluginInfo';

begin
end.
