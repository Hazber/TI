object Form1: TForm1
  Left = 276
  Top = 183
  Width = 889
  Height = 471
  Caption = #1064#1080#1092#1088#1072#1090#1086#1088' '#1087#1086' '#1092#1086#1088#1084#1091#1083#1077' '#1043#1077#1092#1092#1072
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
    Left = 40
    Top = 384
    Width = 199
    Height = 16
    Caption = ' '#1053#1072#1095#1072#1083#1100#1085#1086#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1077' LFSR_3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labellsfr2: TLabel
    Left = 40
    Top = 336
    Width = 199
    Height = 16
    Caption = ' '#1053#1072#1095#1072#1083#1100#1085#1086#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1077' LFSR_2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labellsfr3: TLabel
    Left = 40
    Top = 288
    Width = 199
    Height = 16
    Caption = ' '#1053#1072#1095#1072#1083#1100#1085#1086#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1077' LFSR_1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labelKey: TLabel
    Left = 48
    Top = 112
    Width = 164
    Height = 16
    Caption = ' '#1057#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1085#1085#1099#1081' '#1082#1083#1102#1095
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Filelabel: TLabel
    Left = 48
    Top = 40
    Width = 118
    Height = 16
    Caption = ' '#1063#1080#1090#1072#1077#1084' '#1080#1079' '#1092#1072#1081#1083#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 640
    Top = 16
    Width = 152
    Height = 19
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1088#1072#1073#1086#1090#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labelishod: TLabel
    Left = 352
    Top = 16
    Width = 135
    Height = 19
    Caption = #1048#1089#1093#1086#1076#1085#1099#1081' '#1090#1077#1082#1089#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Lfsr1: TEdit
    Left = 16
    Top = 304
    Width = 257
    Height = 21
    MaxLength = 29
    TabOrder = 0
    OnKeyPress = Lfsr1KeyPress
  end
  object lfsr2: TEdit
    Left = 16
    Top = 352
    Width = 257
    Height = 21
    MaxLength = 37
    TabOrder = 1
    OnKeyPress = lfsr2KeyPress
  end
  object lfsr3: TEdit
    Left = 16
    Top = 400
    Width = 257
    Height = 21
    MaxLength = 27
    TabOrder = 2
    OnKeyPress = lfsr3KeyPress
  end
  object BitKey: TMemo
    Left = 0
    Top = 128
    Width = 273
    Height = 121
    Lines.Strings = (
      'BitKey')
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object FileEdit: TEdit
    Left = 8
    Top = 56
    Width = 193
    Height = 21
    TabOrder = 4
    Text = 'FileEdit'
  end
  object BitBtnFile: TBitBtn
    Left = 200
    Top = 56
    Width = 33
    Height = 25
    Caption = '...'
    TabOrder = 5
    OnClick = BitBtnFileClick
  end
  object Chiper: TMemo
    Left = 592
    Top = 32
    Width = 257
    Height = 257
    Lines.Strings = (
      'Chiper')
    ScrollBars = ssVertical
    TabOrder = 6
  end
  object ShifrRB: TRadioButton
    Left = 496
    Top = 336
    Width = 129
    Height = 17
    Caption = #1047#1072#1096#1080#1092#1088#1086#1074#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object DeshifrRB: TRadioButton
    Left = 312
    Top = 336
    Width = 129
    Height = 17
    Caption = #1044#1077#1096#1080#1092#1088#1086#1074#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object Go: TButton
    Left = 680
    Top = 344
    Width = 169
    Height = 65
    Caption = #1055#1086#1077#1093#1072#1083#1080'!!!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = GoClick
  end
  object ProgressBar1: TProgressBar
    Left = 296
    Top = 376
    Width = 361
    Height = 33
    TabOrder = 10
  end
  object Ishod: TMemo
    Left = 296
    Top = 32
    Width = 257
    Height = 257
    Lines.Strings = (
      'Chiper')
    ScrollBars = ssVertical
    TabOrder = 11
  end
  object btLFSRreal: TButton
    Left = 680
    Top = 304
    Width = 169
    Height = 25
    Caption = #1046#1084#1077#1084', '#1077#1089#1083#1080' '#1096#1080#1092#1088#1091#1077#1084' LFSR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    OnClick = btLFSRrealClick
  end
  object KeyLfsr1MEMO: TMemo
    Left = 0
    Top = 184
    Width = 273
    Height = 41
    Lines.Strings = (
      'KeyLfsr1MEMO')
    TabOrder = 13
    Visible = False
  end
  object KeyLfsr2MEMO: TMemo
    Left = 0
    Top = 240
    Width = 273
    Height = 41
    Lines.Strings = (
      'KeyLfsr1MEMO')
    TabOrder = 14
    Visible = False
  end
  object keyLfsr3MEMO: TMemo
    Left = 0
    Top = 128
    Width = 273
    Height = 41
    Lines.Strings = (
      'KeyLfsr1MEMO')
    TabOrder = 15
    Visible = False
  end
  object SeeBTN: TButton
    Left = 64
    Top = 88
    Width = 145
    Height = 17
    Caption = #1057#1082#1088#1099#1090#1100'/'#1087#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1082#1083#1102#1095
    TabOrder = 16
    Visible = False
    OnClick = SeeBTNClick
  end
  object OpenDialog1: TOpenDialog
    Left = 560
    Top = 256
  end
end
