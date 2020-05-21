object frmMain: TfrmMain
  Left = 384
  Top = 146
  Width = 800
  Height = 464
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 39
    Width = 11
    Height = 16
    Caption = 'P'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 77
    Width = 12
    Height = 16
    Caption = 'Q'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 147
    Width = 12
    Height = 16
    Caption = 'N'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 113
    Width = 11
    Height = 16
    Caption = 'B'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 370
    Top = 2
    Width = 126
    Height = 16
    Caption = #1048#1089#1093#1086#1076#1085#1099#1081' '#1090#1077#1082#1089#1090': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 370
    Top = 222
    Width = 177
    Height = 16
    Caption = #1047#1072#1096#1080#1092#1088#1086#1074#1072#1085#1085#1099#1081' '#1090#1077#1082#1089#1090': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 32
    Top = 176
    Width = 129
    Height = 25
    Caption = #1063#1080#1090#1072#1077#1084' '#1080#1079' '#1092#1072#1081#1083#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtKeyP: TEdit
    Tag = 1
    Left = 32
    Top = 39
    Width = 150
    Height = 21
    Hint = '>3'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object edtKeyQ: TEdit
    Tag = 2
    Left = 32
    Top = 77
    Width = 150
    Height = 21
    Hint = '>3511'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object edtKeyN: TEdit
    Tag = 3
    Left = 32
    Top = 147
    Width = 150
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object edtKeyB: TEdit
    Tag = 4
    Left = 32
    Top = 113
    Width = 150
    Height = 21
    Hint = ' 0 < b < 10533'
    TabOrder = 3
  end
  object edtFile: TEdit
    Left = 32
    Top = 200
    Width = 200
    Height = 21
    TabOrder = 4
  end
  object btnFile: TButton
    Left = 234
    Top = 200
    Width = 20
    Height = 20
    Caption = '...'
    TabOrder = 5
    OnClick = btnFileClick
  end
  object mmPlaintext: TMemo
    Left = 370
    Top = 22
    Width = 400
    Height = 180
    ScrollBars = ssVertical
    TabOrder = 6
  end
  object mmCiphertext: TMemo
    Left = 370
    Top = 242
    Width = 400
    Height = 180
    ScrollBars = ssVertical
    TabOrder = 7
  end
  object btnEncryption: TButton
    Left = 8
    Top = 264
    Width = 161
    Height = 73
    Caption = #1064#1080#1092#1088#1086#1074#1072#1090#1100'!!!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = btnEncryptionClick
  end
  object btnDecryption: TButton
    Left = 192
    Top = 264
    Width = 161
    Height = 73
    Caption = #1044#1077#1096#1080#1092#1088#1086#1074#1072#1090#1100'!!!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = btnDecryptionClick
  end
  object ProgressBar1: TProgressBar
    Left = 24
    Top = 360
    Width = 321
    Height = 41
    TabOrder = 10
  end
  object dialogOpen: TOpenDialog
    Left = 272
    Top = 80
  end
  object dialogSave: TSaveDialog
    Left = 232
    Top = 128
  end
end
