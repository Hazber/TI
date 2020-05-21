object Form1: TForm1
  Left = 304
  Top = 152
  Width = 710
  Height = 502
  Caption = #1064#1080#1092#1088#1086#1074#1072#1085#1080#1077
  Color = clBtnFace
  Constraints.MaxHeight = 502
  Constraints.MaxWidth = 710
  Constraints.MinHeight = 502
  Constraints.MinWidth = 710
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LabelISHOD: TLabel
    Left = 240
    Top = 8
    Width = 121
    Height = 19
    Caption = #1048#1089#1093#1086#1076#1085#1099#1081' '#1090#1077#1082#1089#1090
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object LabelRESULT: TLabel
    Left = 240
    Top = 232
    Width = 167
    Height = 19
    Caption = #1047#1072#1096#1080#1092#1088#1086#1074#1072#1085#1085#1099#1081' '#1090#1077#1082#1089#1090
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object LabelKEY: TLabel
    Left = 8
    Top = 200
    Width = 39
    Height = 19
    Caption = #1050#1083#1102#1095
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Key: TEdit
    Left = 8
    Top = 232
    Width = 225
    Height = 21
    TabOrder = 0
    Text = 'Key'
  end
  object ISHOD: TMemo
    Left = 240
    Top = 32
    Width = 441
    Height = 193
    Lines.Strings = (
      'ISHOD')
    TabOrder = 1
  end
  object RESULT: TMemo
    Left = 240
    Top = 256
    Width = 441
    Height = 193
    Lines.Strings = (
      'RESULT')
    TabOrder = 2
  end
  object RBIzgorod: TRadioButton
    Left = 8
    Top = 16
    Width = 81
    Height = 33
    Caption = #1048#1079#1075#1086#1088#1086#1076#1100
    TabOrder = 3
    OnClick = RBIzgorodClick
  end
  object SHIFR: TButton
    Left = 8
    Top = 272
    Width = 225
    Height = 81
    Caption = #1064#1080#1092#1088#1086#1074#1072#1090#1100'!!!'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 4
    OnClick = SHIFRClick
  end
  object RBPlay: TRadioButton
    Left = 8
    Top = 80
    Width = 81
    Height = 33
    Caption = #1055#1083#1101#1081#1092#1077#1081#1088
    TabOrder = 5
    OnClick = RBPlayClick
  end
  object RBVishiner: TRadioButton
    Left = 8
    Top = 136
    Width = 81
    Height = 33
    Caption = #1042#1080#1078#1077#1085#1077#1088
    TabOrder = 6
    OnClick = RBVishinerClick
  end
  object DESHIFR: TButton
    Left = 8
    Top = 368
    Width = 225
    Height = 81
    Caption = #1044#1077#1096#1080#1092#1088#1080#1088#1086#1074#1072#1090#1100'!!!'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 7
    OnClick = DESHIFRClick
  end
  object BitBtn1: TBitBtn
    Left = 128
    Top = 128
    Width = 97
    Height = 25
    Caption = #1063#1080#1090#1072#1077#1084' '#1080#1079' '#1092#1072#1081#1083#1072
    TabOrder = 8
    OnClick = BitBtn1Click
  end
  object Edit1: TEdit
    Left = 112
    Top = 160
    Width = 121
    Height = 21
    TabOrder = 9
    Text = 'Edit1'
  end
  object English: TButton
    Left = 136
    Top = 16
    Width = 81
    Height = 33
    Caption = 'English'
    TabOrder = 10
    OnClick = EnglishClick
  end
  object Russian: TButton
    Left = 136
    Top = 64
    Width = 81
    Height = 33
    Caption = 'Russian'
    TabOrder = 11
    OnClick = RussianClick
  end
  object Ready: TButton
    Left = 576
    Top = 8
    Width = 105
    Height = 25
    Caption = #1043#1086#1090#1086#1074#1086
    TabOrder = 12
    OnClick = ReadyClick
  end
  object Button1: TButton
    Left = 104
    Top = 192
    Width = 121
    Height = 25
    Caption = #1055#1077#1088#1077#1082#1086#1076#1080#1088#1086#1074#1072#1090#1100' '#1092#1072#1081#1083
    TabOrder = 13
    OnClick = Button1Click
  end
  object OpenDialog1: TOpenDialog
    Left = 392
  end
end
