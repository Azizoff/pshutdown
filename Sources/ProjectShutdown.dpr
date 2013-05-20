program ProjectShutdown;

{$R *.dres}

uses
  Forms,
  MainFormShutdown in 'MainFormShutdown.pas' {MainFormSD},
  SelectProgramFormShutdown in 'SelectProgramFormShutdown.pas' {SelectProgramm},
  SettingsFormShutdown in 'SettingsFormShutdown.pas' {Settings},
  AboutFormShutdown in 'AboutFormShutdown.pas' {About},
  CounterClass in 'CounterClass.pas',
  SelectSoundFormShutdown in 'SelectSoundFormShutdown.pas' {SelectSound},
  SelectPluginFormShutdown in 'SelectPluginFormShutdown.pas' {SelectPlugin},
  PluginListManager in 'PluginListManager.pas',
  MessageTextFormShutdown in 'MessageTextFormShutdown.pas' {MessageText},
  SharedTypes in 'SharedTypes.pas',
  MultiLocalizer in 'MultiLocalizer.pas',
  MNGShutDown in 'Managers\MNGShutDown.pas',
  MNGDisplay in 'Managers\MNGDisplay.pas',
  MNGExecuting in 'Managers\MNGExecuting.pas',
  MNGHibernate in 'Managers\MNGHibernate.pas',
  MNGPlugins in 'Managers\MNGPlugins.pas',
  MNGMessage in 'Managers\MNGMessage.pas',
  MainFrame in 'MainFrame.pas',
  GCAV,
  TimerForm in 'TimerForm.pas' {TimerFormSD},
  SettingsManager in 'SettingsManager.pas',
  CmnFunct in 'CmnFunct.pas',
  MNGAlarm_bass in 'Managers\MNGAlarm_bass.pas',
  bass in 'bass\bass.pas',
  PathUtils in 'PathUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'PShutDown';
  Application.CreateForm(TMainFormSD, MainFormSD);
  Application.CreateForm(TSelectProgramm, SelectProgramm);
  Application.CreateForm(TSettings, Settings);
  Application.CreateForm(TAbout, About);
  Application.CreateForm(TSelectSound, SelectSound);
  Application.CreateForm(TSelectPlugin, SelectPlugin);
  Application.CreateForm(TMessageText, MessageText);
  Application.Run;

end.
