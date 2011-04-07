object SelectProgramm: TSelectProgramm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Select the program to launch'
  ClientHeight = 148
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 360
    Height = 13
    Caption = 'Path:'
  end
  object Label2: TLabel
    Left = 8
    Top = 51
    Width = 402
    Height = 13
    Caption = 'Parameters:'
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
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 3
    OnClick = BOKClick
  end
  object BCancel: TButton
    Left = 305
    Top = 110
    Width = 105
    Height = 30
    Caption = 'Cancel'
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
