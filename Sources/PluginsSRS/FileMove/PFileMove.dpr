library PFileMove;

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
  SysUtils,
  Classes,
  SharedTypes in '..\..\SharedTypes.pas',
  FileMoveSettings in 'FileMoveSettings.pas' {Form1},
  GV in 'GV.pas', Windows;

{$R *.res}

function DoAction: Cardinal; stdcall;
  var sr: TSearchRec;
  SearchRec: TSearchRec;
begin
  Result := 1;
  if DirectoryExists(gvsDestinationFolder) and DirectoryExists(gvsSourseFolder) then
  begin
  if (FindFirst(gvsSourseFolder + '*.*',
    faAnyFile and not faDirectory, SearchRec) = 0) then
  begin

    MoveFile(PWideChar(gvsSourseFolder + SearchRec.Name), PWideChar(gvsDestinationFolder + SearchRec.Name));
    while FindNext(SearchRec) = 0 do
          MoveFile(PWideChar(gvsSourseFolder + SearchRec.Name), PWideChar(gvsDestinationFolder + SearchRec.Name));
  end;
  end;
end;

function GetPluginInfo(): TPluginInfo; stdcall;
begin
  Result.Name := 'Перемещение файлов';
  Result.Author := 'Ильдар Азизов [Azizoff]';
  Result.Description := PWideChar('Плагин для перемещения файлов');
  Result.HasSettings := True;
  Result.Version := SetVersion(1, 0, 0, 1);
end;

function ShowSettings(): Cardinal; stdcall;
begin
  Form1 := TForm1.Create(nil);
  Result := Form1.ShowModal;
  Form1.Free;
end;

exports DoAction name 'DoAction', GetPluginInfo name 'GetPluginInfo',
  ShowSettings name 'ShowSettings';

begin
end.
