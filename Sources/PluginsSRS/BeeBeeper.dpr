library BeeBeeper;

uses
  Windows, SharedTypes in '..\SharedTypes.pas';

function DoAction: Cardinal; stdcall;
begin
  Result := 1;
  Beep(500, 100);
  Beep(1000, 100);
  Beep(1500, 100);
  Beep(2000, 100);
  Beep(2500, 100);
  Beep(3000, 100);
  Beep(3500, 100);
  Beep(4000, 100);
  Beep(4500, 100);
  Beep(5000, 100);
  Beep(5500, 100);
end;

function GetPluginInfo(): TPluginInfo; stdcall;
begin
  Result.Name := PWideChar('Bee-Beeper');
  Result.Author := PWideChar('Ильдар Азизов [Azizoff]');
  Result.Description := PWideChar('Тестовый плагин' + #13 + #10 +
      'Делает бип - бип - бип - бип :)');
  Result.HasSettings := False;
  Result.Version := SetVersion(0, 0, 0, 2);
end;

exports DoAction name 'DoAction', GetPluginInfo name 'GetPluginInfo';

begin

end.
