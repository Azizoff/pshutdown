object BeeperSettingsForm: TBeeperSettingsForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 89
  ClientWidth = 258
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 5
    Width = 65
    Height = 13
    Caption = #1058#1080#1087' '#1089#1080#1075#1085#1072#1083#1072':'
  end
  object BOK: TButton
    Left = 88
    Top = 56
    Width = 75
    Height = 25
    Caption = #1054#1050
    ModalResult = 1
    TabOrder = 1
    OnClick = BOKClick
  end
  object BCancel: TButton
    Left = 175
    Top = 57
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
  object CBBeepType: TComboBox
    Left = 8
    Top = 24
    Width = 242
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 0
    Text = 'MB_OK'
    Items.Strings = (
      'MB_OK'
      'MB_ICONHAND'
      'MB_ICONQUESTION'
      'MB_ICONEXCLAMATION'
      'MB_ICONASTERISK')
  end
end
