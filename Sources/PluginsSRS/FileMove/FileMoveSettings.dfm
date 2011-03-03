object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077' '#1092#1072#1081#1083#1086#1074
  ClientHeight = 144
  ClientWidth = 403
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 86
    Height = 13
    Caption = #1048#1089#1093#1086#1076#1085#1072#1103' '#1087#1072#1087#1082#1072':'
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 97
    Height = 13
    Caption = #1055#1072#1087#1082#1072' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103':'
  end
  object edtSourceFolder: TEdit
    Left = 8
    Top = 29
    Width = 337
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object edtDestinationFolder: TEdit
    Left = 8
    Top = 72
    Width = 337
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object btnSourceFolder: TButton
    Left = 351
    Top = 29
    Width = 44
    Height = 21
    Caption = '...'
    TabOrder = 2
    OnClick = btnSourceFolderClick
  end
  object btnDestinationFolder: TButton
    Left = 351
    Top = 72
    Width = 44
    Height = 21
    Caption = '...'
    TabOrder = 3
    OnClick = btnDestinationFolderClick
  end
  object btnOK: TButton
    Left = 232
    Top = 110
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 4
  end
  object btnCancel: TButton
    Left = 320
    Top = 110
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 5
  end
end
