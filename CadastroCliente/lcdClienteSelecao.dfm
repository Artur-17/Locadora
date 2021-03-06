object ClienteSelecao: TClienteSelecao
  Left = 0
  Top = 0
  Caption = 'Sele'#231#227'o de cliente'
  ClientHeight = 571
  ClientWidth = 1015
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 1015
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'LOCALIZAR CLIENTES'
    Color = 4605510
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 15790320
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object pnlfields: TPanel
    Left = 0
    Top = 41
    Width = 1015
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
    DesignSize = (
      1015
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
      Width = 1007
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
  end
  object grdCliente: TcxGrid
    Left = 0
    Top = 87
    Width = 1015
    Height = 444
    Align = alClient
    TabOrder = 2
    object grdClienteDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dtsCliente
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Editing = False
      object grdClienteDBTableView1ID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
      end
      object grdClienteDBTableView1NOME: TcxGridDBColumn
        DataBinding.FieldName = 'NOME'
        Width = 300
      end
      object grdClienteDBTableView1CPF: TcxGridDBColumn
        DataBinding.FieldName = 'CPF'
        Width = 150
      end
      object grdClienteDBTableView1EMAIL: TcxGridDBColumn
        DataBinding.FieldName = 'EMAIL'
        Width = 300
      end
      object grdClienteDBTableView1TELEFONE: TcxGridDBColumn
        DataBinding.FieldName = 'TELEFONE'
        Width = 150
      end
      object grdClienteDBTableView1DT_NASCIMENTO: TcxGridDBColumn
        Caption = 'DATA DE NASCIMENTO'
        DataBinding.FieldName = 'DT_NASCIMENTO'
        Width = 100
      end
      object grdClienteDBTableView1ESTADO: TcxGridDBColumn
        DataBinding.FieldName = 'ESTADO'
      end
      object grdClienteDBTableView1LOGRADOURO: TcxGridDBColumn
        DataBinding.FieldName = 'LOGRADOURO'
        Width = 300
      end
      object grdClienteDBTableView1BAIRRO: TcxGridDBColumn
        DataBinding.FieldName = 'BAIRRO'
        Width = 300
      end
      object grdClienteDBTableView1CIDADE: TcxGridDBColumn
        DataBinding.FieldName = 'CIDADE'
      end
      object grdClienteDBTableView1COMPLEMENTO: TcxGridDBColumn
        DataBinding.FieldName = 'COMPLEMENTO'
      end
      object grdClienteDBTableView1OBSERVACAO: TcxGridDBColumn
        DataBinding.FieldName = 'OBSERVACAO'
      end
    end
    object grdClienteLevel1: TcxGridLevel
      GridView = grdClienteDBTableView1
    end
  end
  object pnlbottom: TPanel
    Left = 0
    Top = 531
    Width = 1015
    Height = 40
    Align = alBottom
    TabOrder = 3
    DesignSize = (
      1015
      40)
    object btnCancelar: TcxButton
      Left = 905
      Top = 6
      Width = 105
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Office2010Silver'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
    object btnSelecionar: TcxButton
      Left = 782
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
    end
  end
  object qryCliente: TUniQuery
    Connection = dtmPrincipal.conexao
    SQL.Strings = (
      'SELECT'
      '    *'
      'FROM'
      '    Cliente c')
    Active = True
    Left = 48
    Top = 424
    object qryClienteID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qryClienteNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object qryClienteCPF: TStringField
      FieldName = 'CPF'
      Size = 18
    end
    object qryClienteEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 80
    end
    object qryClienteTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 80
    end
    object qryClienteDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
    end
    object qryClienteESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 2
    end
    object qryClienteLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 150
    end
    object qryClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 80
    end
    object qryClienteCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 150
    end
    object qryClienteCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 80
    end
    object qryClienteOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 800
    end
  end
  object dtsCliente: TDataSource
    DataSet = qryCliente
    Left = 120
    Top = 424
  end
end
