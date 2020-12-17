object LocalizarCliente: TLocalizarCliente
  Left = 0
  Top = 0
  Caption = 'Localizar Cliente'
  ClientHeight = 624
  ClientWidth = 1207
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  WindowState = wsMaximized
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 1207
    Height = 41
    Align = alTop
    Caption = 'LOCALIZAR CLIENTE'
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
  object pnlClient: TPanel
    Left = 0
    Top = 41
    Width = 1207
    Height = 56
    Align = alTop
    TabOrder = 1
    DesignSize = (
      1207
      56)
    object lblPesquisa: TLabel
      Left = 16
      Top = 6
      Width = 118
      Height = 13
      Caption = 'NOME / CPF / TELEFONE'
    end
    object edtPesquisa: TEdit
      Left = 4
      Top = 25
      Width = 1196
      Height = 21
      Hint = 'Digite o seu texto aqui para pesquisar'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      TextHint = 'Digite o seu texto aqui para pesquisar'
      OnKeyUp = edtPesquisaKeyUp
    end
  end
  object grid: TcxGrid
    Left = 0
    Top = 97
    Width = 1207
    Height = 486
    Align = alClient
    TabOrder = 2
    object viewcliente: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dtsCliente
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      object viewclienteID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
      end
      object viewclienteNOME: TcxGridDBColumn
        DataBinding.FieldName = 'NOME'
      end
      object viewclienteCPF: TcxGridDBColumn
        DataBinding.FieldName = 'CPF'
      end
      object viewclienteEMAIL: TcxGridDBColumn
        DataBinding.FieldName = 'EMAIL'
      end
      object viewclienteTELEFONE: TcxGridDBColumn
        DataBinding.FieldName = 'TELEFONE'
      end
      object viewclienteDT_NASCIMENTO: TcxGridDBColumn
        DataBinding.FieldName = 'DT_NASCIMENTO'
      end
      object viewclienteESTADO: TcxGridDBColumn
        DataBinding.FieldName = 'ESTADO'
      end
      object viewclienteLOGRADOURO: TcxGridDBColumn
        DataBinding.FieldName = 'LOGRADOURO'
      end
      object viewclienteBAIRRO: TcxGridDBColumn
        DataBinding.FieldName = 'BAIRRO'
      end
      object viewclienteCIDADE: TcxGridDBColumn
        DataBinding.FieldName = 'CIDADE'
      end
      object viewclienteCOMPLEMENTO: TcxGridDBColumn
        DataBinding.FieldName = 'COMPLEMENTO'
      end
      object viewclienteOBSERVACAO: TcxGridDBColumn
        DataBinding.FieldName = 'OBSERVACAO'
      end
    end
    object levelCliente: TcxGridLevel
      GridView = viewcliente
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 583
    Width = 1207
    Height = 41
    Align = alBottom
    TabOrder = 3
    DesignSize = (
      1207
      41)
    object btnAlterar: TcxButton
      Left = 117
      Top = 6
      Width = 85
      Height = 25
      Caption = 'Alterar(F5)'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000000473424954080808087C08648800000009704859730000005C000000
        5C018727CC700000001974455874536F667477617265007777772E696E6B7363
        6170652E6F72679BEE3C1A0000009749444154388DCDD23D0AC2501045E1CF22
        3B08FE6CC585D8B80E2DDC93BD5DB4B6D404415C82E0028458240F4288E12536
        1E9866E0DC3BC5308C19323CB119E84A7041D9986DAC9CD6016BBC1B01AF1879
        8A2BF61D2159AC1C1A43C8AADE2F86C8ED90A44F9EA3E890CB7A9F8E692E711B
        7BF69FCB09F22F72A17ADF5E96639B03BB5F6438B4E43CE6ECC0040FDC71C211
        67D5AF47F101B4A2582947CFEBF80000000049454E44AE426082}
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnExcluir: TcxButton
      Left = 229
      Top = 6
      Width = 85
      Height = 25
      Caption = 'Excluir(F4)'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D4948445200000010000000100403000000EDDDE2
        520000000373424954080808DBE14FE000000009704859730000004B0000004B
        019C777AC50000001974455874536F667477617265007777772E696E6B736361
        70652E6F72679BEE3C1A00000021504C5445FFFFFF0000000000000000000000
        00000000000000000000000000000000000000DD7064570000000A74524E5300
        014044498091A0F2F3BA098FA20000004649444154085B636060609EB5D28001
        04580BD8031840FC55400014635D0506010811048802892C0531162DAFD20233
        162C8DE2229A01D3E5053267099021D6B56AD58A440600DDC52C2A6CBB80B500
        00000049454E44AE426082}
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object btnFechar: TcxButton
      Left = 1059
      Top = 6
      Width = 132
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Fechar(ESC)'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000000473424954080808087C08648800000009704859730000006F000000
        6F01F1A2DC430000001974455874536F667477617265007777772E696E6B7363
        6170652E6F72679BEE3C1A0000007149444154388DD593CB0980400C05E789FD
        D98ECDD8C76E219EBCD8883C0FAB1EC41575453010082199901F4000FC508316
        E3B1D4AB615B77122519A02AA9FE0D40522FA9C906D83E55D29027A03DF01B60
        E4FADABA3DA07806AFB4E0C4C90206A0C980BD5DE27F0FA9F8992A2016E4C719
        85119E2654D1CAB70000000049454E44AE426082}
      TabOrder = 4
      OnClick = btnFecharClick
    end
    object btnIncluir: TcxButton
      Left = 16
      Top = 6
      Width = 81
      Height = 25
      Caption = 'Incluir(F2)'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000000473424954080808087C086488000000097048597300000059000000
        5901AA9DA9860000001974455874536F667477617265007777772E696E6B7363
        6170652E6F72679BEE3C1A000000E649444154388D95D2C14DC3401005D01703
        16173742D2007728810640DC68051411E586E80308670A48688420E540A270D8
        0958B6D7902F7DED7AF6CFCEECF8D3C608632CF0195C446CD4A1FF41892936D8
        66B8C624B4ADE4D79EC42667CD4BA619E12AD875765F7FF33A23BA0CE69E333C
        C4350E32735966279672AE0A9CF588FEC2F9001FA822B0C24DADF25BACA7B156
        D2BC8E771D167B561C7405DFE57FD74530773E2FF0BC6717753C157890DCD785
        CAEF7C9AD8E071F731C9B4D867A471FDB652B2E77FADFC82A3664BA564CF9C2B
        B7F88ACAADE43A86B8C35CF2C332F6B738698ABF01062775A96EA3EBA7000000
        0049454E44AE426082}
      TabOrder = 0
      OnClick = btnIncluirClick
    end
    object DBNavigator: TDBNavigator
      Left = 488
      Top = 6
      Width = 224
      Height = 25
      DataSource = dtsCliente
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 3
    end
  end
  object qryCliente: TUniQuery
    Connection = dtmPrincipal.conexao
    SQL.Strings = (
      'select * from cliente')
    OnFilterRecord = qryClienteFilterRecord
    Left = 928
    Top = 400
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
    Left = 864
    Top = 400
  end
end
