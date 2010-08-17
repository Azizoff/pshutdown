object MessageText: TMessageText
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1058#1077#1082#1089#1090' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
  ClientHeight = 179
  ClientWidth = 418
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
    Width = 88
    Height = 13
    Caption = #1058#1077#1082#1089#1090' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
  end
  object MMessageText: TMemo
    Left = 8
    Top = 24
    Width = 402
    Height = 105
    MaxLength = 512
    TabOrder = 0
  end
  object BOK: TButton
    Left = 194
    Top = 144
    Width = 105
    Height = 30
    Caption = #1054#1050
    ModalResult = 1
    TabOrder = 1
    OnClick = BOKClick
  end
  object BCancel: TButton
    Left = 305
    Top = 144
    Width = 105
    Height = 30
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
  object PanelHLine: TPanel
    Left = 8
    Top = 135
    Width = 402
    Height = 3
    BevelEdges = [beBottom]
    BevelKind = bkSoft
    BevelOuter = bvNone
    TabOrder = 3
  end
end
