object TFMain: TTFMain
  Left = 294
  Top = 184
  Width = 737
  Height = 480
  Caption = 'TFMain'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblQ: TLabel
    Left = 315
    Top = 32
    Width = 22
    Height = 21
    Caption = ' Q:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object lblP: TLabel
    Left = 315
    Top = 62
    Width = 22
    Height = 21
    Caption = ' P:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object lblH: TLabel
    Left = 488
    Top = 30
    Width = 22
    Height = 21
    Caption = ' H:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object lblX: TLabel
    Left = 488
    Top = 62
    Width = 22
    Height = 21
    Caption = ' X:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object lblK: TLabel
    Left = 488
    Top = 93
    Width = 22
    Height = 21
    Caption = ' K:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object lblY: TLabel
    Left = 315
    Top = 93
    Width = 22
    Height = 21
    Caption = ' Y:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object lblHESH: TLabel
    Left = 128
    Top = 208
    Width = 57
    Height = 23
    Caption = #1061#1077#1096
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object lblishod: TLabel
    Left = 88
    Top = 8
    Width = 145
    Height = 19
    Caption = #1048#1089#1093#1086#1076#1085#1099#1081' '#1090#1077#1082#1089#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object lblResSignature: TLabel
    Left = 312
    Top = 201
    Width = 116
    Height = 21
    Caption = 'lblResSignature'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object lblSignature: TLabel
    Left = 536
    Top = 200
    Width = 87
    Height = 21
    Caption = 'lblSignature'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object lblOpenY: TLabel
    Left = 576
    Top = 136
    Width = 57
    Height = 41
    Caption = 'lblOpenY'
  end
  object IshodMemo: TMemo
    Left = 16
    Top = 32
    Width = 281
    Height = 169
    Lines.Strings = (
      'IshodMemo')
    TabOrder = 0
  end
  object HeshMemo: TMemo
    Left = 16
    Top = 232
    Width = 281
    Height = 169
    Lines.Strings = (
      'IshodMemo')
    TabOrder = 1
  end
  object edtQ: TEdit
    Left = 351
    Top = 34
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '107'
  end
  object edtP: TEdit
    Left = 351
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '643'
  end
  object edtH: TEdit
    Left = 519
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '2'
  end
  object edtX: TEdit
    Left = 519
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 5
    Text = '45'
  end
  object edtK: TEdit
    Left = 519
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 6
    Text = '31'
  end
  object edtY: TEdit
    Left = 351
    Top = 95
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object btnSignFile: TButton
    Left = 312
    Top = 328
    Width = 177
    Height = 65
    Caption = #1055#1086#1076#1087#1080#1089#1072#1090#1100' '#1092#1072#1081#1083'!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 8
    OnClick = btnSignFileClick
  end
  object btnChecksignature: TButton
    Left = 511
    Top = 328
    Width = 178
    Height = 65
    Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1087#1086#1076#1087#1080#1089#1100'!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 9
    OnClick = btnChecksignatureClick
  end
  object btnChooseFile: TButton
    Left = 312
    Top = 272
    Width = 105
    Height = 33
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1092#1072#1081#1083'...'
    TabOrder = 10
    OnClick = btnChooseFileClick
  end
  object chkEDSisInFile: TCheckBox
    Left = 304
    Top = 136
    Width = 217
    Height = 17
    Caption = 'Signature in file'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = btnChecksignatureClick
  end
  object ChoseFile: TOpenDialog
    Left = 8
    Top = 200
  end
  object SaveFile: TSaveDialog
    Left = 40
    Top = 208
  end
end
