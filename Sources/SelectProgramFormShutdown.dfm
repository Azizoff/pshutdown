object SelectProgramm: TSelectProgramm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1042#1099#1073#1086#1088' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' '#1076#1083#1103' '#1079#1072#1087#1091#1089#1082#1072
  ClientHeight = 148
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
    Top = 8
    Width = 94
    Height = 13
    Caption = #1055#1091#1090#1100' '#1082' '#1087#1088#1086#1075#1088#1072#1084#1084#1077':'
  end
  object Label2: TLabel
    Left = 8
    Top = 51
    Width = 151
    Height = 13
    Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099':'
  end
  object eFilePath: TEdit
    Left = 8
    Top = 24
    Width = 360
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object eParameters: TEdit
    Left = 8
    Top = 70
    Width = 402
    Height = 21
    TabOrder = 1
  end
  object BBrowse: TButton
    Left = 374
    Top = 24
    Width = 36
    Height = 21
    Caption = '...'
    TabOrder = 2
    OnClick = BBrowseClick
  end
  object BOK: TButton
    Left = 192
    Top = 110
    Width = 105
    Height = 30
    Caption = #1054#1050
    ModalResult = 1
    TabOrder = 3
    OnClick = BOKClick
  end
  object BCancel: TButton
    Left = 305
    Top = 110
    Width = 105
    Height = 30
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 4
  end
  object PanelHLine: TPanel
    Left = 8
    Top = 101
    Width = 402
    Height = 3
    BevelEdges = [beBottom]
    BevelKind = bkSoft
    BevelOuter = bvNone
    TabOrder = 5
  end
  object ProgramBrowser: TOpenDialog
    Filter = #1048#1089#1087#1086#1083#1085#1103#1077#1084#1099#1077' '#1092#1072#1081#1083#1099'|*.exe'
    Left = 8
    Top = 96
  end
end
