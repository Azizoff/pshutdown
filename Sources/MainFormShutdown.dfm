object MainFormSD: TMainFormSD
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'PShutDown'
  ClientHeight = 392
  ClientWidth = 471
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PCMain: TPageControl
    Left = 8
    Top = 8
    Width = 457
    Height = 352
    ActivePage = TSOnTimer
    TabOrder = 0
    object TSOnTimer: TTabSheet
      Caption = 'Timer'
      object RGActionList: TRadioGroup
        Left = 3
        Top = 3
        Width = 198
        Height = 283
        Caption = 'Action'
        ItemIndex = 0
        Items.Strings = (
          'Shutdown Computer'
          'Reboot Computer'
          'Logoff'
          'Sleeping Mode'
          'Switch off Monitor'
          'Run Program'
          'Run Alarm'
          'Show Message')
        TabOrder = 0
        OnClick = RGActionListClick
      end
      object GBAfter: TGroupBox
        Left = 207
        Top = 9
        Width = 233
        Height = 67
        TabOrder = 6
        object lblDaysAfter: TLabel
          Left = 9
          Top = 15
          Width = 24
          Height = 13
          Caption = 'Days'
        end
        object LHourAfter: TLabel
          Left = 64
          Top = 15
          Width = 28
          Height = 13
          Caption = 'Hours'
        end
        object LSecondAfter: TLabel
          Left = 176
          Top = 15
          Width = 40
          Height = 13
          Caption = 'Seconds'
        end
        object LMinuteAfter: TLabel
          Left = 118
          Top = 15
          Width = 37
          Height = 13
          Caption = 'Minutes'
        end
        object CBDaysAfter: TComboBox
          Left = 9
          Top = 34
          Width = 48
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 0
          Text = '0'
          Items.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7'
            '8'
            '9'
            '10'
            '11'
            '12'
            '13'
            '14'
            '15'
            '16'
            '17'
            '18'
            '19'
            '20'
            '21'
            '22'
            '23'
            '24'
            '25'
            '26'
            '27'
            '28'
            '29'
            '30'
            '31')
        end
        object EHourAfter: TEdit
          Left = 63
          Top = 34
          Width = 34
          Height = 21
          MaxLength = 2
          NumbersOnly = True
          TabOrder = 1
          Text = '0'
          OnChange = EHourAfterChange
          OnExit = FormatText
        end
        object EMinuteAfter: TEdit
          Left = 119
          Top = 34
          Width = 34
          Height = 21
          MaxLength = 2
          NumbersOnly = True
          TabOrder = 3
          Text = '0'
          OnChange = EMinuteAfterChange
          OnExit = FormatText
        end
        object ESecondAfter: TEdit
          Left = 175
          Top = 34
          Width = 34
          Height = 21
          MaxLength = 2
          NumbersOnly = True
          TabOrder = 5
          Text = '0'
          OnChange = ESecondAfterChange
          OnExit = FormatText
        end
        object UDHourAfter: TUpDown
          Left = 97
          Top = 34
          Width = 18
          Height = 21
          Associate = EHourAfter
          Max = 23
          TabOrder = 2
          OnClick = UDHourAfterClick
          OnMouseActivate = UDHourAfterMouseActivate
        end
        object UDMinuteAfter: TUpDown
          Left = 153
          Top = 34
          Width = 18
          Height = 21
          Associate = EMinuteAfter
          Max = 59
          TabOrder = 4
          OnClick = UDMinuteAfterClick
          OnMouseActivate = UDMinuteAfterMouseActivate
        end
        object UDSecondAfter: TUpDown
          Left = 209
          Top = 34
          Width = 18
          Height = 21
          Associate = ESecondAfter
          Max = 59
          TabOrder = 6
          OnClick = UDSecondAfterClick
          OnMouseActivate = UDSecondAfterMouseActivate
        end
      end
      object GBAt: TGroupBox
        Left = 207
        Top = 84
        Width = 233
        Height = 87
        Enabled = False
        TabOrder = 8
        object LHourAt: TLabel
          Left = 9
          Top = 39
          Width = 28
          Height = 13
          Caption = 'Hours'
        end
        object LMinuteAt: TLabel
          Left = 83
          Top = 39
          Width = 37
          Height = 13
          Caption = 'Minutes'
        end
        object LSecondAt: TLabel
          Left = 157
          Top = 39
          Width = 40
          Height = 13
          Caption = 'Seconds'
        end
        object EHourAt: TEdit
          Left = 9
          Top = 58
          Width = 51
          Height = 21
          MaxLength = 2
          NumbersOnly = True
          TabOrder = 1
          Text = '0'
          OnChange = EHourAtChange
          OnExit = FormatText
        end
        object UDHourAt: TUpDown
          Left = 60
          Top = 58
          Width = 18
          Height = 21
          Associate = EHourAt
          Max = 23
          TabOrder = 2
          OnClick = UDHourAtClick
          OnMouseActivate = UDHourAtMouseActivate
        end
        object CBDaysAt: TComboBox
          Left = 10
          Top = 16
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 0
          Text = 'Monday'
          Items.Strings = (
            'Monday'
            'Tuesday'
            'Wednesday'
            'Thursday'
            'Friday'
            'Saturday'
            'Sunday')
        end
        object EMinuteAt: TEdit
          Left = 83
          Top = 58
          Width = 51
          Height = 21
          MaxLength = 2
          NumbersOnly = True
          TabOrder = 3
          Text = '0'
          OnChange = EMinuteAtChange
          OnExit = FormatText
        end
        object ESecondAt: TEdit
          Left = 158
          Top = 58
          Width = 51
          Height = 21
          MaxLength = 2
          NumbersOnly = True
          TabOrder = 5
          Text = '0'
          OnChange = ESecondAtChange
          OnExit = FormatText
        end
        object UDSecondAt: TUpDown
          Left = 209
          Top = 58
          Width = 18
          Height = 21
          Associate = ESecondAt
          Max = 59
          TabOrder = 6
          OnClick = UDSecondAtClick
          OnMouseActivate = UDSecondAtMouseActivate
        end
        object UDMinuteAt: TUpDown
          Left = 134
          Top = 58
          Width = 18
          Height = 21
          Associate = EMinuteAt
          Max = 59
          TabOrder = 4
          OnClick = UDMinuteAtClick
          OnMouseActivate = UDMinuteAtMouseActivate
        end
      end
      object RBAfter: TRadioButton
        Left = 217
        Top = 4
        Width = 55
        Height = 17
        Caption = 'After:'
        Checked = True
        TabOrder = 5
        TabStop = True
        OnClick = RBAfterClick
      end
      object RBAt: TRadioButton
        Left = 217
        Top = 77
        Width = 31
        Height = 17
        Caption = 'At:'
        TabOrder = 7
        OnClick = RBAtClick
      end
      object BStart: TButton
        Left = 207
        Top = 257
        Width = 112
        Height = 29
        Caption = 'Start'
        TabOrder = 11
        OnClick = BStartClick
      end
      object BPause: TButton
        Left = 328
        Top = 257
        Width = 112
        Height = 29
        Caption = 'Pause'
        Enabled = False
        TabOrder = 12
        OnClick = BPauseClick
      end
      object BRigthNow: TButton
        Left = 3
        Top = 292
        Width = 198
        Height = 29
        Caption = 'DoIt'
        TabOrder = 13
        OnClick = BRigthNowClick
      end
      object BBrowseProgramm: TButton
        Left = 152
        Top = 193
        Width = 40
        Height = 20
        Caption = '...'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BBrowseProgrammClick
      end
      object BBrowseSound: TButton
        Left = 152
        Top = 223
        Width = 40
        Height = 20
        Caption = '...'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BBrowseSoundClick
      end
      object BStopAlarm: TButton
        Left = 207
        Top = 292
        Width = 233
        Height = 29
        Caption = 'Stop Alarm'
        DoubleBuffered = False
        ParentDoubleBuffered = False
        TabOrder = 14
        Visible = False
        OnClick = BStopAlarmClick
      end
      object BBrowsePlugin: TButton
        Left = 161
        Top = 3
        Width = 40
        Height = 20
        Caption = '...'
        DropDownMenu = pmPluginChoise
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        Style = bsSplitButton
        TabOrder = 4
        Visible = False
        OnClick = BBrowsePluginClick
      end
      object BBrowseTextMessage: TButton
        Left = 152
        Top = 254
        Width = 40
        Height = 20
        Caption = '...'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = BBrowseTextMessageClick
      end
      object GBEvery: TGroupBox
        Left = 207
        Top = 180
        Width = 233
        Height = 67
        Enabled = False
        TabOrder = 10
        object LHourEvery: TLabel
          Left = 9
          Top = 15
          Width = 28
          Height = 13
          Caption = 'Hours'
        end
        object LMinuteEvery: TLabel
          Left = 83
          Top = 15
          Width = 37
          Height = 13
          Caption = 'Minutes'
        end
        object LSecondEvery: TLabel
          Left = 158
          Top = 15
          Width = 40
          Height = 13
          Caption = 'Seconds'
        end
        object EHourEvery: TEdit
          Left = 10
          Top = 34
          Width = 50
          Height = 21
          TabOrder = 0
          Text = '0'
          OnChange = EHourEveryChange
          OnExit = FormatText
        end
        object EMinuteEvery: TEdit
          Left = 83
          Top = 34
          Width = 51
          Height = 21
          TabOrder = 1
          Text = '0'
          OnChange = EMinuteEveryChange
          OnExit = FormatText
        end
        object ESecondEvery: TEdit
          Left = 158
          Top = 34
          Width = 51
          Height = 21
          TabOrder = 2
          Text = '0'
          OnChange = ESecondEveryChange
          OnExit = FormatText
        end
        object UDHourEvery: TUpDown
          Left = 60
          Top = 34
          Width = 18
          Height = 21
          Associate = EHourEvery
          Max = 99
          TabOrder = 3
          OnClick = UDHourEveryClick
          OnMouseActivate = UDHourEveryMouseActivate
        end
        object UDMinuteEvery: TUpDown
          Left = 134
          Top = 34
          Width = 18
          Height = 21
          Associate = EMinuteEvery
          Max = 59
          TabOrder = 4
          OnClick = UDMinuteEveryClick
          OnMouseActivate = UDMinuteEveryMouseActivate
        end
        object UDSecondEvery: TUpDown
          Left = 209
          Top = 34
          Width = 18
          Height = 21
          Associate = ESecondEvery
          Max = 59
          TabOrder = 5
          OnClick = UDSecondEveryClick
          OnMouseActivate = UDSecondEveryMouseActivate
        end
      end
      object RBEvery: TRadioButton
        Left = 217
        Top = 173
        Width = 68
        Height = 17
        Caption = 'Every:'
        TabOrder = 9
        OnClick = RBEveryClick
      end
    end
  end
  object pbTotalProgress: TProgressBar
    Left = 0
    Top = 366
    Width = 471
    Height = 26
    Align = alBottom
    DoubleBuffered = True
    ParentDoubleBuffered = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
  end
  object MainMenu: TMainMenu
    Left = 72
    Top = 344
    object mniFile: TMenuItem
      Caption = 'File'
      object mniSettings: TMenuItem
        Caption = 'Settings'
        ShortCut = 16464
        OnClick = mniSettingsClick
      end
      object mniAbout: TMenuItem
        Caption = 'About'
        ShortCut = 112
        OnClick = mniAboutClick
      end
      object mniSaveAsLangFile: TMenuItem
        Caption = 'Save Language File'
        OnClick = mniSaveAsLangFileClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mniExit: TMenuItem
        Caption = 'Exit'
        OnClick = mniExitClick
      end
    end
    object mniHelp: TMenuItem
      Caption = 'Help'
      OnClick = mniHelpClick
    end
  end
  object TrayIcon: TTrayIcon
    PopupMenu = pmPopup
    OnDblClick = TrayIconDblClick
    Left = 8
    Top = 344
  end
  object pmPluginChoise: TPopupMenu
    Left = 144
    Top = 344
    object mniPluginsNotFound: TMenuItem
      Caption = 'Plugins not found '
      Enabled = False
    end
  end
  object pmPopup: TPopupMenu
    Left = 216
    Top = 344
    object pmniShow: TMenuItem
      Caption = 'Show'
      OnClick = TrayIconDblClick
    end
    object mniBreak: TMenuItem
      Caption = '-'
    end
    object pmniExit: TMenuItem
      Caption = 'Exit'
      OnClick = mniExitClick
    end
  end
end
