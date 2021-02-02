object Emprestimo: TEmprestimo
  Left = 0
  Top = 0
  Caption = 'Empr'#233'stimo de filme'
  ClientHeight = 675
  ClientWidth = 1000
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyUp = FormKeyUp
  DesignSize = (
    1000
    675)
  PixelsPerInch = 96
  TextHeight = 15
  object pgcPrincipal: TcxPageControl
    Left = 0
    Top = 0
    Width = 1000
    Height = 675
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = pgEmprestimoItens
    Properties.CustomButtons.Buttons = <>
    Properties.TabHeight = 25
    Properties.TabWidth = 200
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2007Silver'
    ClientRectBottom = 669
    ClientRectLeft = 3
    ClientRectRight = 994
    ClientRectTop = 33
    object pgListagemEmprestimo: TcxTabSheet
      Caption = 'Emprestimos'
      ImageIndex = 0
      object pnlClient: TPanel
        Left = 0
        Top = 0
        Width = 991
        Height = 56
        Align = alTop
        TabOrder = 0
        DesignSize = (
          991
          56)
        object lblPesquisa: TLabel
          Left = 16
          Top = 6
          Width = 132
          Height = 15
          Caption = 'NOME / CPF / TELEFONE'
        end
        object edtPesquisa: TEdit
          Left = 16
          Top = 25
          Width = 953
          Height = 23
          Hint = 'Digite o seu texto aqui para pesquisar'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          TextHint = 'Digite o seu texto aqui para pesquisar'
        end
      end
      object gdrListagem: TcxGrid
        Left = 0
        Top = 56
        Width = 991
        Height = 539
        Align = alClient
        TabOrder = 1
        object ViewListagem: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataModeController.SmartRefresh = True
          DataController.DataSource = dtsEmprestimo
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Editing = False
          object ViewListagemID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Width = 70
          end
          object ViewListagemNUM_VENDA: TcxGridDBColumn
            Caption = 'NUMERO DA VENDA'
            DataBinding.FieldName = 'NUM_VENDA'
            Width = 200
          end
          object ViewListagemULTIMAALTERACAO: TcxGridDBColumn
            DataBinding.FieldName = 'ULTIMAALTERACAO'
            Width = 200
          end
          object ViewListagemDELETADO: TcxGridDBColumn
            DataBinding.FieldName = 'DELETADO'
            Width = 200
          end
          object ViewListagemCD_USUARIO: TcxGridDBColumn
            Caption = 'C'#211'DIGO DO USUARIO'
            DataBinding.FieldName = 'CD_USUARIO'
            Options.Editing = False
            Width = 200
          end
        end
        object lvlListagem: TcxGridLevel
          GridView = ViewListagem
        end
      end
      object pnlBottom: TPanel
        Left = 0
        Top = 595
        Width = 991
        Height = 41
        Align = alBottom
        TabOrder = 2
        object btnAlterarEmprestimo: TcxButton
          Left = 125
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
          OnClick = btnAlterarEmprestimoClick
        end
        object btnExcluirEmprestimo: TcxButton
          Left = 237
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
        end
        object btnIncluirEmprestimo: TcxButton
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
          OnClick = btnIncluirEmprestimoClick
        end
        object DBNavigatorEmprestimo: TDBNavigator
          Left = 488
          Top = 6
          Width = 224
          Height = 25
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          TabOrder = 3
        end
      end
    end
    object pgEmprestimoItens: TcxTabSheet
      Caption = 'Itens do Emprestimo'
      ImageIndex = 1
      object pnlBottomEmprestimoItem: TPanel
        Left = 0
        Top = 595
        Width = 991
        Height = 41
        Align = alBottom
        TabOrder = 3
        object btnConcluir: TcxButton
          Left = 703
          Top = 6
          Width = 131
          Height = 25
          Caption = 'Concluir'
          OptionsImage.Glyph.SourceDPI = 96
          OptionsImage.Glyph.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            610000000473424954080808087C086488000000097048597300000094000000
            940179BF0DEF0000001974455874536F667477617265007777772E696E6B7363
            6170652E6F72679BEE3C1A000000C449444154388DADD3416A02411005D0D7A3
            EECC15C453040201AF61EEE022B7105C0572082727C83A1BBD46CC115CEAA2B2
            488F4C463233463F145435FD3F55BFBB608503D611A119982350E67A8F578C23
            4281678C90F4C31D16784F298D8B4C6EC30E6FD834CE1FB194DB3BB5D815B5FB
            817DCAC9BF515C4386612DFFC4474FDE0CD3AAB8C883EC4359F1864DE99452AB
            2711F1EBB9CF04F0D4730CDCD8C40AEB0E4ED92AD09CB10BF58FF4856D4FDE03
            2695C041F73EFC85E3C0CF76DD637029192FDF89D476AD1A1B827F0000000049
            454E44AE426082}
          TabOrder = 0
          OnClick = btnConcluirClick
        end
      end
      object pnlTop: TPanel
        Left = 0
        Top = 0
        Width = 991
        Height = 137
        Align = alTop
        TabOrder = 0
        object lblNumVenda: TLabel
          Left = 19
          Top = 5
          Width = 95
          Height = 15
          Caption = 'N'#250'mero da Venda'
        end
        object lblNomeCliente: TLabel
          Left = 176
          Top = 5
          Width = 90
          Height = 15
          Caption = 'Nome do Cliente'
        end
        object lblDataVenda: TLabel
          Left = 822
          Top = 2
          Width = 75
          Height = 15
          Caption = 'Data da Venda'
        end
        object lblNomeFilme: TLabel
          Left = 16
          Top = 62
          Width = 82
          Height = 15
          Caption = 'Nome do Filme'
        end
        object lblValorUnitario: TLabel
          Left = 388
          Top = 62
          Width = 71
          Height = 15
          Caption = 'Valor Unit'#225'rio'
        end
        object lblQuantidade: TLabel
          Left = 496
          Top = 62
          Width = 62
          Height = 15
          Caption = 'Quantidade'
        end
        object lblTotalProduto: TLabel
          Left = 611
          Top = 62
          Width = 88
          Height = 15
          Caption = 'Total do produto'
        end
        object edtNomeFilme: TEdit
          Left = 19
          Top = 81
          Width = 326
          Height = 23
          TabOrder = 6
        end
        object btnCliente: TcxButton
          Left = 753
          Top = 26
          Width = 22
          Height = 22
          OptionsImage.Glyph.SourceDPI = 96
          OptionsImage.Glyph.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            610000000473424954080808087C086488000000097048597300000076000000
            76014E7B26080000001974455874536F667477617265007777772E696E6B7363
            6170652E6F72679BEE3C1A000001F049444154388D95904B6813511486FF7B67
            8669568AE842504968A52ADAC40751AB2DA90651142CE2BA0B1197C10141A420
            155404A142892062DCE84AEA038AD4D588A843D4843235204E044D8A554884BC
            4C629CB9C785A954D349EBB7BADCFFDCEF9C73199A0C68D1A344A401D8D1BC7A
            438C469F5D8B4CA00D0C0042DAD815103B1BE8F6A267FD5A00806965615A19D8
            F51F775EDC3833E42A68767E746230847DC1CD7F85C6741AD1BB13B0EBF50BC6
            ADE19185049C88B440B7B7E53100ECDCD285C1037B41C289B84DC0016C9F1BBB
            25640CDB3675C2B1EDE5ED04AED8820050BB12700009D3CAB6044440CD118827
            53E0B25C701510A351D3CAC0984EC32102353B977E3A98FD9AC783C73A001A77
            134899F8A4B526B0BFF3F5DBB49FB8048FA703854A15FAF304A2B17BE05CCA95
            F3B3C1151BFCB7BFBD9F2AFF2B607387DE939746483811C7F9FD615C920B008D
            97739F875675F90DCFB2956671E643CC880DA71614B8B1F1D8A9D5BE9E70A451
            2DF695735F7A6545B9F8F2E6B9F37F56584C907F97ACACF3EF4939425C955555
            6ED4AAFDDE60589A49EA4F972400808FAF9E7CF7EE3E926084E3B2AA2A8D5AAD
            DF170C2BD9A4AE2FBAC27C42DAF58310E2214174D44B455214E9F27F090060E0
            F4D86102BB4F24D446A5545AD20AF3F9149F4CFB761D9A02E35B6555EEFB0516
            CCCEC728114BCD0000000049454E44AE426082}
          TabOrder = 3
          OnClick = btnClienteClick
        end
        object btnIncluir: TcxButton
          Left = 735
          Top = 79
          Width = 106
          Height = 25
          Caption = 'Incluir Item'
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
          TabOrder = 4
          OnClick = btnIncluirClick
        end
        object btnRemoverItem: TcxButton
          Left = 870
          Top = 79
          Width = 107
          Height = 25
          Caption = 'Remover Item'
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
          TabOrder = 5
        end
        object edtDataVenda: TcxDateEdit
          Left = 822
          Top = 23
          EditValue = 44228d
          TabOrder = 0
          Width = 155
        end
        object edtNumVenda: TEdit
          Left = 19
          Top = 26
          Width = 121
          Height = 23
          NumbersOnly = True
          ReadOnly = True
          TabOrder = 1
        end
        object edtNomeCliente: TEdit
          Left = 176
          Top = 26
          Width = 577
          Height = 23
          TabOrder = 2
        end
        object btnFilme: TcxButton
          Left = 345
          Top = 81
          Width = 22
          Height = 22
          OptionsImage.Glyph.SourceDPI = 96
          OptionsImage.Glyph.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            610000000473424954080808087C086488000000097048597300000076000000
            76014E7B26080000001974455874536F667477617265007777772E696E6B7363
            6170652E6F72679BEE3C1A000001F049444154388D95904B6813511486FF7B67
            8669568AE842504968A52ADAC40751AB2DA90651142CE2BA0B1197C10141A420
            155404A142892062DCE84AEA038AD4D588A843D4843235204E044D8A554884BC
            4C629CB9C785A954D349EBB7BADCFFDCEF9C73199A0C68D1A344A401D8D1BC7A
            438C469F5D8B4CA00D0C0042DAD815103B1BE8F6A267FD5A00806965615A19D8
            F51F775EDC3833E42A68767E746230847DC1CD7F85C6741AD1BB13B0EBF50BC6
            ADE19185049C88B440B7B7E53100ECDCD285C1037B41C289B84DC0016C9F1BBB
            25640CDB3675C2B1EDE5ED04AED8820050BB12700009D3CAB6044440CD118827
            53E0B25C701510A351D3CAC0984EC32102353B977E3A98FD9AC783C73A001A77
            134899F8A4B526B0BFF3F5DBB49FB8048FA703854A15FAF304A2B17BE05CCA95
            F3B3C1151BFCB7BFBD9F2AFF2B607387DE939746483811C7F9FD615C920B008D
            97739F875675F90DCFB2956671E643CC880DA71614B8B1F1D8A9D5BE9E70A451
            2DF695735F7A6545B9F8F2E6B9F37F56584C907F97ACACF3EF4939425C955555
            6ED4AAFDDE60589A49EA4F972400808FAF9E7CF7EE3E926084E3B2AA2A8D5AAD
            DF170C2BD9A4AE2FBAC27C42DAF58310E2214174D44B455214E9F27F090060E0
            F4D86102BB4F24D446A5545AD20AF3F9149F4CFB761D9A02E35B6555EEFB0516
            CCCEC728114BCD0000000049454E44AE426082}
          TabOrder = 7
          OnClick = btnFilmeClick
        end
        object edtQuantidade: TEdit
          Left = 496
          Top = 83
          Width = 73
          Height = 23
          NumbersOnly = True
          TabOrder = 9
        end
        object edtTotal: TcxCurrencyEdit
          Left = 611
          Top = 83
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 10
          Width = 88
        end
        object edtValorUnitario: TcxCurrencyEdit
          Left = 388
          Top = 83
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 8
          Width = 71
        end
      end
      object gridVenda: TcxGrid
        Left = 0
        Top = 137
        Width = 991
        Height = 419
        Align = alClient
        TabOrder = 1
        object viewVenda: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dtsEmprestimoItem
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Editing = False
          object viewVendaID: TcxGridDBColumn
            Caption = 'C'#211'DIGO'
            DataBinding.FieldName = 'ID'
            Width = 100
          end
          object viewVendaCD_EMPRESTIMO: TcxGridDBColumn
            DataBinding.FieldName = 'CD_EMPRESTIMO'
            Visible = False
            Width = 150
          end
          object viewVendaULTIMAALTERACAO: TcxGridDBColumn
            Caption = 'ULTIMA ALTERA'#199#195'O'
            DataBinding.FieldName = 'ULTIMAALTERACAO'
            Width = 150
          end
          object viewVendaDELETADO: TcxGridDBColumn
            DataBinding.FieldName = 'DELETADO'
            Visible = False
            Width = 150
          end
          object viewVendaCD_CLIENTE: TcxGridDBColumn
            DataBinding.FieldName = 'CD_CLIENTE'
            Visible = False
            Width = 150
          end
          object viewVendaCD_FILME: TcxGridDBColumn
            DataBinding.FieldName = 'CD_FILME'
            Visible = False
            Width = 150
          end
          object viewVendaVALOR: TcxGridDBColumn
            DataBinding.FieldName = 'VALOR'
            Width = 150
          end
          object viewVendaQUANTIDADE: TcxGridDBColumn
            DataBinding.FieldName = 'QUANTIDADE'
            Width = 150
          end
          object viewVendaTOTAL: TcxGridDBColumn
            DataBinding.FieldName = 'TOTAL'
            Width = 150
          end
          object viewVendaDT_VENDA: TcxGridDBColumn
            Caption = 'DATA DA VENDA'
            DataBinding.FieldName = 'DT_VENDA'
            Width = 150
          end
        end
        object lvlVenda: TcxGridLevel
          GridView = viewVenda
        end
      end
      object pnlValorTotal: TPanel
        Left = 0
        Top = 556
        Width = 991
        Height = 39
        Align = alBottom
        BevelEdges = []
        Color = clGrayText
        ParentBackground = False
        TabOrder = 2
        DesignSize = (
          991
          39)
        object lblValorTotalVenda: TLabel
          Left = 723
          Top = 6
          Width = 118
          Height = 21
          Anchors = [akTop, akRight]
          Caption = 'Valor da Venda'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI Black'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtTotalVenda: TcxCurrencyEdit
          Left = 884
          Top = 6
          Anchors = []
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 0
          Width = 93
        end
      end
    end
  end
  object btnFecharEmprestimo: TcxButton
    Left = 851
    Top = 634
    Width = 129
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar(ESC)'
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
    TabOrder = 1
    OnClick = btnFecharEmprestimoClick
  end
  object qryEmprestimo: TUniQuery
    Connection = dtmPrincipal.conexao
    SQL.Strings = (
      'select'
      '    *'
      'from'
      '    Emprestimo E')
    Left = 32
    Top = 488
    object qryEmprestimoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qryEmprestimoNUM_VENDA: TIntegerField
      FieldName = 'NUM_VENDA'
    end
    object qryEmprestimoULTIMAALTERACAO: TDateTimeField
      FieldName = 'ULTIMAALTERACAO'
    end
    object qryEmprestimoDELETADO: TStringField
      FieldName = 'DELETADO'
      FixedChar = True
      Size = 1
    end
    object qryEmprestimoCD_USUARIO: TIntegerField
      FieldName = 'CD_USUARIO'
    end
  end
  object qryEmprestimoItem: TUniQuery
    Connection = dtmPrincipal.conexao
    SQL.Strings = (
      'select'
      '    *'
      'from'
      '    Emprestimo_Item E')
    Left = 208
    Top = 488
    object qryEmprestimoItemID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qryEmprestimoItemCD_EMPRESTIMO: TIntegerField
      FieldName = 'CD_EMPRESTIMO'
    end
    object qryEmprestimoItemULTIMAALTERACAO: TDateTimeField
      FieldName = 'ULTIMAALTERACAO'
    end
    object qryEmprestimoItemDELETADO: TStringField
      FieldName = 'DELETADO'
      FixedChar = True
      Size = 1
    end
    object qryEmprestimoItemCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
    end
    object qryEmprestimoItemCD_FILME: TIntegerField
      FieldName = 'CD_FILME'
    end
    object qryEmprestimoItemVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryEmprestimoItemQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
    object qryEmprestimoItemTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object qryEmprestimoItemDT_VENDA: TDateTimeField
      FieldName = 'DT_VENDA'
    end
  end
  object dtsEmprestimo: TDataSource
    DataSet = qryEmprestimo
    Left = 112
    Top = 488
  end
  object dtsEmprestimoItem: TDataSource
    DataSet = qryEmprestimoItem
    Left = 304
    Top = 488
  end
  object TrsFilme: TUniTransaction
    DefaultConnection = dtmPrincipal.conexao
    Left = 408
    Top = 488
  end
end
