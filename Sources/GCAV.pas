unit GCAV;

interface

uses SharedTypes;

type
  TPluginsList = record
    PluginFile: string;
    PluginDesription: TPluginInfo;
  end;

const

  WMU_PSHUTDOWN_INC = 2331;
  WMU_DEFAULT = 1024 + WMU_PSHUTDOWN_INC;
  WMU_PLUGIN_SELECTED = WMU_DEFAULT + 1;
  WMU_1 = WMU_DEFAULT + 2;
  WMU_2 = WMU_DEFAULT + 3;
  WMU_3 = WMU_DEFAULT + 4;


  SECONDS_IN_DAY = 86400;
  SECONDS_IN_HOUR = 3600;
  SECONDS_IN_MINUTE = 60;

  DEF_SETTINGS_FILE = 'Settings.ini';
  PLUGIN_PATH = 'Plugins\';
  LANGUAGE_PATH = 'Languages\';
  NEW_LINE = #13 + #10;
  {
    Наименование переменных: [gvs]
    [gv] - (Global Value)
    [s] - (Settings) Переменные, отвечающие за настройки программы
    }
var

  MainFormHandle: Cardinal;

  mbtext_AreYouShoreWantTo: string = 'Вы действительно хотите ';
  mbtext_ThisPluginHasNoSettings: string = 'У данного плагина нет настроек.';
  mbtext_UnableToSaveSettings: string = 'Невозможно сохранить настройки.';
  mbtext_FileIsWriteProtected: string = 'Файл защищен от записи.';
  mbtext_ChoosePlugin: string = 'Выбрать плагин';

  gvMainWindowHandle: LongWord;
  { [Настройки] }
  gvFilePath: string; // Путь запускаемого файла
  gvParameters: string = ''; // Параметры запускаемого файла
  gvSoundPath: string = ''; // Путь аудио файла
  gvSoundLoop: boolean = False;
  gvTextMessage: string = ''; // Текст сообщения

  { GENERAL }
  gvsShowMessageIfNow: boolean = True;
  // Выводить запрос при выполнении функции немедленно
  gvsShowMessageOnlyForCrytical: boolean = False;
  // Выводить запрос подтвержднеия только для критических заданий }
  gvsForceAction: boolean = False;
  // True = компьютер будет выключаться принудительно, даже если не отвечают программы
  gvsBeepLastTen: boolean = False;
  gvsBeepOnB: boolean = False;
  // Выводить звуковой сигнал в минуты кратные {gvsBeepOnI}
  gvsBeepOnI: Integer = 2; // Единица измерения минуты
  gvsAskIfClose: boolean = True;

  { INTERFACE }
  gvsMinimizeToTray: boolean = False; // True = Сворачивать окно в трей
  gvsMinimizeOnEscape: boolean = False; // True = Сворачивать по ESCAPE
  gvsLanguageFile: string;
  { PASSWORD }

  gvApplicationPath: string = '';
  gvLanguagesPath: string = '';
  gvPluginsPath: string = '';

implementation

end.
