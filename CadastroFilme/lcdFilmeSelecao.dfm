object FilmeSelecao: TFilmeSelecao
  Left = 0
  Top = 0
  Caption = 'Sele'#231#227'o de filme'
  ClientHeight = 561
  ClientWidth = 973
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 973
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'LOCALIZAR FILME'
    Color = 4605510
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 15790320
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = -42
    ExplicitWidth = 1015
  end
  object pnlfields: TPanel
    Left = 0
    Top = 41
    Width = 973
    Height = 46
    ParentCustomHint = False
    Align = alTop
    BiDiMode = bdLeftToRight
    Color = 15921906
    Ctl3D = True
    DoubleBuffered = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBiDiMode = False
    ParentBackground = False
    ParentCtl3D = False
    ParentDoubleBuffered = False
    ParentFont = False
    ParentShowHint = False
    ShowCaption = False
    ShowHint = False
    TabOrder = 1
    ExplicitLeft = -84
    ExplicitWidth = 1057
    DesignSize = (
      973
      46)
    object lblPesquisa: TLabel
      Left = 7
      Top = 3
      Width = 247
      Height = 13
      Caption = 'C'#211'DIGO DE BARRAS / T'#205'TULO DO FILME / GENERO'
    end
    object edtPesquisa: TEdit
      Left = 3
      Top = 19
      Width = 965
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitWidth = 1049
    end
  end
  object grdFilme: TcxGrid
    Left = 0
    Top = 87
    Width = 973
    Height = 434
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 432
    ExplicitTop = 176
    ExplicitWidth = 250
    ExplicitHeight = 200
    object grdFilmeDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dtsFilme
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object grdFilmeDBTableView1ID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
      end
      object grdFilmeDBTableView1TITULO: TcxGridDBColumn
        DataBinding.FieldName = 'TITULO'
      end
    end
    object grdFilmeLevel1: TcxGridLevel
      GridView = grdFilmeDBTableView1
    end
  end
  object pnlbottom: TPanel
    Left = 0
    Top = 521
    Width = 973
    Height = 40
    Align = alBottom
    TabOrder = 3
    ExplicitLeft = -84
    ExplicitWidth = 1057
    DesignSize = (
      973
      40)
    object btnCancelar: TcxButton
      Left = 863
      Top = 6
      Width = 105
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Office2010Silver'
      TabOrder = 1
      ExplicitLeft = 947
    end
    object btnSelecionar: TcxButton
      Left = 740
      Top = 6
      Width = 105
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Selecionar'
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Office2010Silver'
      TabOrder = 0
      OnClick = btnSelecionarClick
      ExplicitLeft = 824
    end
  end
  object qryFilme: TUniQuery
    Connection = dtmPrincipal.conexao
    SQL.Strings = (
      'Select '
      '   f.id,'
      '   f.titulo'
      'from'
      '   filme f  ')
    Active = True
    Left = 40
    Top = 432
    object qryFilmeID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qryFilmeTITULO: TStringField
      FieldName = 'TITULO'
      Size = 80
    end
  end
  object dtsFilme: TDataSource
    DataSet = qryFilme
    Left = 120
    Top = 432
  end
end
