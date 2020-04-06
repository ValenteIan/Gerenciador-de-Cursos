object Form_rel_turmas: TForm_rel_turmas
  Left = 508
  Top = 367
  Width = 332
  Height = 159
  Caption = 'Rela'#231#227'o de Turmas por Curso'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 27
    Height = 13
    Caption = 'Curso'
  end
  object edt_curso: TEdit
    Left = 16
    Top = 32
    Width = 257
    Height = 21
    Color = clInfoBk
    Enabled = False
    TabOrder = 0
  end
  object btn_ok: TBitBtn
    Left = 80
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = btn_okClick
  end
  object btn_fechar: TBitBtn
    Left = 176
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 2
    OnClick = btn_fecharClick
  end
  object btn_curso: TBitBtn
    Left = 280
    Top = 32
    Width = 25
    Height = 21
    Caption = '+'
    TabOrder = 3
    OnClick = btn_cursoClick
  end
  object adoquery_rel_turmas: TADOQuery
    Connection = Form_logon.ConexaoBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 40
    Top = 64
  end
  object adoquery_aux: TADOQuery
    Connection = Form_logon.ConexaoBD
    Parameters = <>
    Left = 8
    Top = 64
  end
  object rel_turmas: TRvProject
    Left = 272
    Top = 96
  end
  object ds_rel_turmas: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = adoquery_rel_turmas
    Left = 8
    Top = 96
  end
end
