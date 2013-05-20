﻿unit GCAV;

interface

uses
  SharedTypes,
  Classes,
  IniFiles,
  SysUtils;

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


  DEF_SETTINGS_FILE = 'Settings';
  PLUGIN_PATH = 'Plugins\';
  LANGUAGE_PATH = 'Languages\';
  NEW_LINE = #13#10;

  GLOBAL_PROJECT_NAME = 'PShutDown';
  GLOBAL_PROGECT_VERSION = '1.2.1';


  {
    Наименование переменных: [gvs]
    [gv] - (Global Value)
    [s] - (Settings) Переменные, отвечающие за настройки программы
  }
var
  gvMainFormHandle: Cardinal;
  gvMainWindowHandle: LongWord;
  { [Настройки] }
  gvFilePath: string; // Путь запускаемого файла
  gvParameters: string = ''; // Параметры запускаемого файла
  gvSoundPath: string = ''; // Путь аудио файла
  gvSoundLoop: Boolean = False;
  gvTextMessage: string = ''; // Текст сообщения

  { GENERAL }
  {gvsShowMessageIfNow: Boolean = True;
  // Выводить запрос при выполнении функции немедленно
  gvsShowMessageOnlyForCrytical: Boolean = False;
  // Выводить запрос подтвержднеия только для критических заданий
  gvsForceAction: Boolean = False;
  // True = компьютер будет выключаться принудительно, даже если не отвечают программы
  gvsBeepLastTen: Boolean = False;
  gvsBeepOnB: Boolean = False;
  gvsShowTimerWindow: Boolean = True;
  }

  // Выводить звуковой сигнал в минуты кратные {gvsBeepOnI}
  {gvsBeepOnI: Integer = 2; // Единица измерения минуты
  gvsAskIfClose: Boolean = True;
  gvsOnlyIfTimerRunning: Boolean = True;
  }
  { INTERFACE }
 // gvsMinimizeToTray: Boolean = False; // True = Сворачивать окно в трей
 // gvsMinimizeOnEscape: Boolean = False; // True = Сворачивать по ESCAPE
 // gvsLanguageFile: string;
  { PASSWORD }

  gvApplicationPath: string = '';
  gvLanguagesPath: string = '';
  gvPluginsPath: string = '';

  // mbtext_AreYouShoreWantTo: string = 'Do you really want ';
  // mbtext_ThisPluginHasNoSettings: string = 'This plugin has no settings.';
  // mbtext_UnableToSaveSettings: string = 'Can''t save the settings.';
  // mbtext_FileIsWriteProtected: string = 'Can''t rewrite file.';
  // mbtext_ChoosePlugin: string = 'Choose plugin';
  // mbtext_SysTimeChanged: string = 'System time was changed';
  // update_timer: string = 'Update timer?';
  // close_pshutdown: string = 'close PShutDown?';

  langs: array [0 .. 12] of string = (
    'Do you really want',
    'This plugin has no settings.',
    'Can''t save the settings.',
    'Can''t rewrite file.',
    'Choose plugin',
    'System time was changed',
    'Update timer?',
    'close PShutDown?',
    'Set the Timer',

    'Parameters',         //9
    'Don''t start automatically',   //10
    'Time in seconds',    //11
    'Minimized'           //12
    //'Cannot find program to send e-mail.'
  );
function LoadArray(Ini: TMemIniFile): Boolean;
function SaveArray(Ini: TMemIniFile): Boolean;

implementation

function LoadArray(Ini: TMemIniFile): Boolean;
var
  I: Integer;
begin
  for I := Low(langs) to high(langs) do
    langs[I] := StringReplace(Trim(Ini.ReadString('Messages', 'Item_' + IntToStr(I),
      langs[I])), '{!nl}', #13#10, [rfReplaceAll]);
  Result := False;
end;

function SaveArray(Ini: TMemIniFile): Boolean;
var
  I: Integer;
begin
  for I := Low(langs) to high(langs) do
    Ini.WriteString('Messages', 'Item_' + IntToStr(I), StringReplace(langs[I], #13#10, '{!nl}', [rfReplaceAll]));
  Result := False;
end;

end.