object Settings: TSettings
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Settings'
  ClientHeight = 404
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    0000010020000000000000000000000000000000000000000000000000000000
    0000000000000000001601010158000000000000000000000000000000000000
    000000000000212121613F3F3FB52525256A1D1D1D0100000000000000000000
    00000404042C1B1B1BD9131313F6020202400000000000000000000000000000
    00001F1F1F4A828383F9BBBCBDF1B9B8B9FB6867682200000000000000000000
    000022222233414141F0303030FE111111E10909091B00000000000000001111
    111E585858E7AEAFB0FC4D4D4D73D3D2D3FBC7C4C63700000000000000000000
    0000000000003D3D3D553D3D3DFD2B2B2BFE141414BA04040407060606054444
    44BCA9AAABFEC3C5C6FECFCFD0FECDCACCADCCC9CA0400000000000000000000
    000000000000000000003C3C3C8B393939FE151515FE0C0C0C862D2D2D7CA3A4
    A4FEC2C4C5FECDCECEFEC9C6C8AECBC8CA070000000000000000000000000000
    00000000000000000000313131052A2A2ABE151515FE171717FB868686F9C2C3
    C4FECECFCFFECFCDCFAECBC8CA07000000000000000000000000000000000000
    000000000000000000000000000014141419191919E3616161FEB7B8B9FEC7C8
    C9FED7D5D6AECFCDCE0700000000000000000000000000000000000000000000
    000000000000000000000000000004040407434343ADABACACFEC9CACBFE9593
    94F0484848130000000000000000000000000000000000000000000000000000
    00000707070A1C1C1C663131319C454545D1999999FECFD0D1FE9E9D9EFE2C2C
    2CFE131313800000000000000000000000000000000000000000000000000000
    0000555555949D9D9DFE989898FE9C9C9CFEBEBDBEFECBC9CAC7434343A23737
    37FE1B1B1BEB0707070900000000000000000000000000000000000000000000
    000074747480B3B3B3FBABABABFE8B8B8BFECFCECFFECFCDCE692E2E2E033434
    34876C6C6CF83535358310101001000000000101011C01010105000000004B4A
    4B05A1A0A1E9A5A5A5D1D5D5D5FEAFAFB0FEBEBDBEFECFCDCF66000000000000
    0000C2C2C26D7F7F7FFB242424A40C0C0C5E191919E40F0F0F7900000000605F
    5F30D8D7D7F9B9B8B961D4D3D4CCE2E2E2FED2D1D2FEBFBDBE6E000000000000
    0000B5B5B5015C5C5CD1222222FE1F1F1FFE232323FE1F1F1FE1000000009391
    922EBFBEBF48201F1F21B6B5B6E8EBEBEBFEE1E1E1FEADABAC5E000000000000
    0000000000002222227F282828FE252525FE262626E01D1D1D3E000000000000
    00000E0D0E0B737373C7F6F6F6FEF2F2F2FEE0E0E0E9AFADAE16000000000000
    00000404041B292929B7464646FE474747AE4444441300000000000000000000
    0000605E5F21DEDDDECBEDEDEDD9E5E4E5A1D4D2D42400000000000000003939
    3905525252D6626262D05A5A5A6252525201000000000000000000000000CFC3
    AC418783AC418303AC41C003AC41E007AC41E00FAC41F01FAC41F03FAC41803F
    AC41801FAC418009AC410181AC410181AC4101C1AC418183AC418307AC41}
  OldCreateOrder = False
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelInterface: TPanel
    Left = 184
    Top = 36
    Width = 400
    Height = 317
    BevelOuter = bvLowered
    Caption = #1048#1085#1090#1077#1088#1092#1077#1081#1089
    ShowCaption = False
    TabOrder = 2
    object GroupBox4: TGroupBox
      Left = 8
      Top = 8
      Width = 385
      Height = 81
      Caption = 'System Tray'
      TabOrder = 0
      object CBMinimizeToTray: TCheckBox
        Left = 16
        Top = 47
        Width = 121
        Height = 17
        Caption = 'Minimize to tray'
        TabOrder = 1
        OnClick = ChangeSetting
      end
      object CBMinimizeOnEscape: TCheckBox
        Left = 16
        Top = 24
        Width = 185
        Height = 17
        Caption = 'Minimize on Escape'
        TabOrder = 0
        OnClick = ChangeSetting
      end
    end
    object GBLanguage: TGroupBox
      Left = 8
      Top = 101
      Width = 385
      Height = 146
      Caption = 'Language'
      TabOrder = 1
      object Label2: TLabel
        Left = 16
        Top = 18
        Width = 70
        Height = 13
        Caption = 'Language File:'
      end
      object LVLanguage: TListView
        Left = 16
        Top = 37
        Width = 353
        Height = 100
        Columns = <
          item
            Caption = 'Description'
            Width = 150
          end
          item
            Caption = 'File'
            Width = 98
          end
          item
            Caption = 'Author'
            Width = 98
          end>
        ColumnClick = False
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
        OnChange = LVLanguageChange
      end
    end
  end
  object PanelGeneral: TPanel
    Left = 184
    Top = 36
    Width = 401
    Height = 317
    BevelOuter = bvLowered
    Caption = #1054#1073#1097#1080#1077
    ShowCaption = False
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 385
      Height = 105
      Caption = 'Messaging'
      TabOrder = 0
      object CBSShowMessageIfNow: TCheckBox
        Left = 16
        Top = 24
        Width = 185
        Height = 17
        Caption = 'Ask before running "Immediately"'
        TabOrder = 0
        OnClick = ChangeSetting
      end
      object CBSShowMessageOnlyForCrytical: TCheckBox
        Left = 32
        Top = 47
        Width = 121
        Height = 17
        Caption = 'Only for critical action'
        TabOrder = 1
        OnClick = ChangeSetting
      end
      object CBAskIfClose: TCheckBox
        Left = 16
        Top = 70
        Width = 153
        Height = 17
        Caption = 'Ask when Programm closing'
        TabOrder = 2
        OnClick = ChangeSetting
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 119
      Width = 385
      Height = 58
      Caption = 'Power Management'
      TabOrder = 1
      object CBSForceAction: TCheckBox
        Left = 16
        Top = 24
        Width = 201
        Height = 17
        Caption = 'Forcing the completion of applications'
        TabOrder = 0
        OnClick = ChangeSetting
      end
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 183
      Width = 385
      Height = 55
      Caption = 'Sound Beeping'
      TabOrder = 2
      object CBBeepLastTen: TCheckBox
        Left = 16
        Top = 24
        Width = 121
        Height = 17
        Caption = 'Beep last 10 seconds'
        TabOrder = 0
        OnClick = ChangeSetting
      end
    end
  end
  object PanelHLine: TPanel
    Left = 8
    Top = 359
    Width = 576
    Height = 3
    BevelEdges = [beBottom]
    BevelKind = bkSoft
    BevelOuter = bvNone
    TabOrder = 3
  end
  object TVCategories: TTreeView
    Left = 9
    Top = 8
    Width = 169
    Height = 345
    Indent = 19
    ReadOnly = True
    TabOrder = 0
    OnChange = TVCategoriesChange
    Items.NodeData = {
      03020000002C0000000000000001000000FFFFFFFFFFFFFFFF00000000000000
      00000000000107470065006E006500720061006C003000000000000000010000
      00FFFFFFFFFFFFFFFF000000000000000000000000010949006E007400650072
      006600610063006500}
  end
  object BOK: TButton
    Left = 256
    Top = 368
    Width = 105
    Height = 30
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 4
    OnClick = BOKClick
  end
  object BApply: TButton
    Left = 480
    Top = 368
    Width = 105
    Height = 30
    Caption = 'Apply'
    Enabled = False
    TabOrder = 6
    OnClick = BApplyClick
  end
  object BCancel: TButton
    Left = 368
    Top = 368
    Width = 105
    Height = 30
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
    OnClick = BCancelClick
  end
  object PanelDescription: TPanel
    Left = 184
    Top = 8
    Width = 401
    Height = 25
    BevelOuter = bvLowered
    Color = clHighlight
    ParentBackground = False
    TabOrder = 7
    object Label1: TLabel
      Left = 8
      Top = 0
      Width = 6
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
end
