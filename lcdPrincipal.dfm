﻿object Principal: TPrincipal
  Left = 0
  Top = 0
  Caption = 'Focus Locadora'
  ClientHeight = 522
  ClientWidth = 981
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxRibbon1: TdxRibbon
    Left = 0
    Top = 0
    Width = 981
    Height = 126
    BarManager = dxbrmngr1
    ColorSchemeName = 'Black'
    Contexts = <>
    TabOrder = 0
    TabStop = False
    object Início: TdxRibbonTab
      Active = True
      Caption = 'In'#237'cio'
      Groups = <
        item
          ToolbarName = 'dxbrCadastro'
        end
        item
          ToolbarName = 'dxbrVenda'
        end>
      Index = 0
    end
  end
  object sttPrincipal: TStatusBar
    Left = 0
    Top = 503
    Width = 981
    Height = 19
    Panels = <
      item
        Text = 'Criado por: Artur'
        Width = 500
      end
      item
        Text = 'data'
        Width = 500
      end
      item
        Text = 'hora'
        Width = 50
      end>
  end
  object dxbrmngr1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 856
    Top = 448
    PixelsPerInch = 96
    object dxbrCadastro: TdxBar
      Caption = 'Cadastro'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1015
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnFilme'
        end
        item
          Visible = True
          ItemName = 'btnCliente'
        end
        item
          Visible = True
          ItemName = 'btnUsuario'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbrVenda: TdxBar
      Caption = 'Venda'
      CaptionButtons = <>
      DockedLeft = 159
      DockedTop = 0
      FloatLeft = 1015
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarLargeButton3'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object btnFilme: TdxBarLargeButton
      Caption = 'Filme'
      Category = 0
      Hint = 'Filme'
      Visible = ivAlways
      LargeGlyph.SourceDPI = 96
      LargeGlyph.Data = {
        89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
        F40000000473424954080808087C0864880000000970485973000000EC000000
        EC01792871BD0000001974455874536F667477617265007777772E696E6B7363
        6170652E6F72679BEE3C1A00000426494441545885D5966D681C451CC69FDDD9
        DC5BF66ECF4B5A0BAD829524A78D15AA56347E6834B4D6D8268AA6412DC68068
        D38A2552B05FAC7E880AC1A69A6A4168C552B0A5352D35B418FC10442C493001
        49E0AED8569B04D734F7B677B9CBDDCDECF8C1DE796FC9DEE1E5830F2CCCEE3C
        33FFDFECBCFC07F89FC8AC28E62F4D2612B598A58843361F03605EC9804F2876
        B35710A03B1D66AFD52A0D3637AD8FCE4E74F1D9892EFECC93EBA38AC3FCF94A
        05BFCB66952217BE7A8E476F74F381E3AD5CB19B9333135D9CCD1EE06CF6009F
        1EDFC3CD26B200E07500F7DC6EF7148083001A4B0926649457016803D0D8B1AB
        BEF9F8E1ED965485AE7388A290D5B0F78B517AED8F003B7BD19B8C2DD2E155D5
        955BDA76D4DACE5CF44683C158CF428C7E5C0A80ABD22679766EAB913904DEBA
        ED5EEB8B3BDCC2A9735338F8E18FE8EF6942EBF69A821DFC3E1DC2D32F9D4D0C
        9D6E33DDBDD6811B374378A0F14438B6481DA500EC7BF9F9FB7B4FF6375B720D
        C357A6B17BEF20A6C7F70000EAB79CC02F43AF02001EDAFA3526873BB3FC94EA
        70D67D4A2D968ACB8160EC050089E500C45481E93A2F86F8BEDA2AB4740CA0A5
        63001BEAAAF3EA2549C4DCE43EA9DE5DD508A0DDA8BF14C037DF0D5D0F9EBF74
        35ABF2D4B929ECDE3B88FE9EA67FBF1D7D16BB76BAD1DEE2C6C9FEE6829DDAAC
        1530551001806E0490B9B2DE7FAFFBF14387DE69306A5394C8DA5E00B000881B
        9A2B45B14F0428005ECE4796A41EA3D8020088003DE6761399905206B9AC228C
        A1CBEB4D32CE4D86662208219479F400F8ED7E97557A0D988814FB7EE3468B22
        4900804D63A3D8B0FF74DA3875A41DE38F6C4EBF2F577F3D1643E76FD77CDA62
        347F9BE428BD0D25515AD01835F217258D311081448AF1A60188288442B43C00
        614A01510894040041F085282B0F0063E03A7C2501309DAB65FB038C8271F667
        4900719A982E178046196289F84C49004C67B7FC45E6032305741D54A7F32501
        00F0FB5959E223A8731D40898B10F00728354C1EC528441907102CC62B65947D
        415AF81784C7CF03F8E7F0C9D4D491EC6C7BF42F151CC015DF1C01F0ED524189
        2832BB5CF959500B776702F8359A2C08A08E5C80EA1981CBA92C3912756E1E0F
        3EB6150070F3D79FB066F5D287A02F1024EBEA1BDE029003902C7C7949C4E370
        391554D76E86A66979F58AA2E09677049DAFB40100D6ACAEC69D350F2310CE3F
        0C5D0E3BD4AB63608C4940F614F8176852CC6B91214DD3B2CEFF945253F1D107
        EFA6BF05C291ACDC9152EE3466020429D7139BC646ADB91DAFA43201589231DB
        12BEF2ECCFFF209E503D5C519482795F51149E503DFCED373A16F7BFF9DA6242
        F57097C35ED0EB72D87942F5A4DE21140C972342443A33F933A9BAC3B9A4479D
        9B47DDA34D3100F08EFC6035D8055857DF40196315C5C487D3613F4C88687867
        9465B94F96E53E231F2122753AEC9F14157CA5F537D971EE3DAD5B6FCB000000
        0049454E44AE426082}
      OnClick = btnFilmeClick
      Width = 50
    end
    object btnCliente: TdxBarLargeButton
      Caption = 'Clientes'
      Category = 0
      Hint = 'Clientes'
      Visible = ivAlways
      LargeGlyph.SourceDPI = 96
      LargeGlyph.Data = {
        89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
        F40000000473424954080808087C0864880000000970485973000000EC000000
        EC01792871BD0000001974455874536F667477617265007777772E696E6B7363
        6170652E6F72679BEE3C1A00000720494441545885ED576B6C14D7193D775EBB
        33B3EB7D7B1FF6B27E815D3B501B4C1C93D83C120A6A5C55B4B491A20AB54D5A
        556D8484940442AAE2FEC99F2051A9A5491B51D1A8216D450B2D244490286E44
        214684A7891D83CD2EC6DE5D3FF73D33BB3B73FBC3A90398D8AB56ED9FF6FBF9
        E99CEF9CB9F7BBDFBD03FCAF07F957489BD73F5FEFF688BB4D66CE225B64C210
        3E15B939F5D291B7BB07FFA306D6ADEBB62CF1154F393DFC171B9A7CA220F000
        0096E5904972CA482479E9C2A9A18D27AFECCD965A932D15D8DEBE43AC0D7183
        F54D5263DDB20A9E653FA3526A80178A7C436320C888E66D845BF94A38DC532C
        A52E53AA81DA90E5F78120ADF0077C9F8B99981CC7DAC7EA2A57B7780E955AB7
        54034410F40D9E72D7A2C064721A5E9FED3194B8BD2519E86879C1CD72454914
        4500C0CC945AB8173335AEE601405114B85D16B9A3E5057729B5B9524086A4AB
        864E8CCC748E49CC0CA1C575991FBA518314BCA00685159358E91A143EBCD68A
        40631372B9BCCEDA4CCABF6B803CB27A57B5D321D4AAB1DC19E842627A78D4BD
        A7EB2F008075189E4768AB89E0B58100D2AA34D3D3D39D0180356B9E2DAFA974
        756452DA4747DFE90E9764E0C927BABF663615F7FB025687CB6565C39763335E
        2D6C8F179C984A8B98CE9A21703A42EE1400203259867C9185535631319E87CD
        E8737E6FEBB37F64AC2ED15F21B795FB2D1E8EB1E6EB1A7EF987BD3FFBE1B63B
        B5E61DC38D1B9F0FB81CFADF9A5B7D769FDFC18912C7709351F911FE2AB3C5D1
        071A20E81D0AC067CFC0216B008099AC0997223E547992680F5E84C4E6982C1F
        6CAA5F55B5CCE610648E07642BCB4A62595336D7B82F1CEEC9FF536F5E137A6C
        A69DAE726A16780994CEE6AC8D75782BD50200705915041C69045D6964351E59
        8D47D09546C09186CB3ABBEDC7AEAD8414A8BDAB2EA51466334FF2F98CB4E016
        302C316929422D919344E5CC98D02B51561182BFA51A9988003BD5D0BE746C76
        E9133200A0D69B98CB6554811688445C33273116AD822E0750E672A2A0500C5D
        1F3D79E6CCDEF1050D7853B7F269D586802F067F45060EF93CDEFC7005D2F0E2
        13CDA55766D22CAC9F626DB97BE9B83A523EF99D55EF7AE229099BBED08FC198
        03D7E37E10593524C37969DE07DF9BB09082F2B8FD1A95F822FCB60C40085657
        8D607BE73B381EAB99D26FCFCE97F1A4840F062A114DCA735CDD20387AAE2E11
        2A4F41128A2852068D8149D4FBA2B0C91A40E93CBD79899FBEFDC64ECA10A5D9
        1787C01BE8BFED446B4D0C599543CA30ED393CD09030A204E5B61C362E0FC326
        CEF69341097ED3B3E26281927D3995476B4D0CFDB79D107803CD4BE328EA44E9
        FEF9EF76DDAB77DF63389A97AF14A3A4BD2FE38189370000A7AE547D3C9CE27F
        7B58AB3F3C92B50E3E5839665ADA3023C10CF4F42F197FAF2F347921EEDF9848
        989477FB42CF7CF3A181C644D68C785282DBA32016932FDF4FEBBE060E85976D
        5275BEFFC1E098C71A2890FD2757DE1A9E28DB7EF6EC3E0580F2EDEF6ED29B43
        E3D270CEAE2007AC0CC5CAC7A62D432F1F3A380500BDD54F6D9F4849BF7A7445
        64C96DCD4AFF7CA47EE2D885A64DC0D1C50D3CDAB6DBBB4A66BF1ECF050C1F7B
        4328CA045AD6C66BA6B61FBDD855FF0BA78548D7D393E6462D59686E18170160
        28EE536F46DB96BDFC74672451A4B911AB3792CAF69A4CEC106FF11610FF7BD0
        68F173DBD8B6DD7F7AAFF7A5F89D7A7337D64F3A763E5E4DC9FEA0C570A7AC9C
        DCEFB7A33FCAEA7C791D356A2B39B6C107F1E301B49FE8C157AC2A4E5B65FDA6
        3D3945196254CDD83C9DD60C7B5C33E3FC031D483635411F8F03D1B1227FAE8F
        743269762CE401EF2ECBA413C6643C967EE695033BDE9A33F0E3CE5D1B3AF2F4
        C4C355860009500D60275AA0373F04B649BCEB62A53905CB5E3F82358909BC51
        29C152E6C096C218CE1A4E0C746D0544F35D2B6AB02AF2A73FC25A6F121C4720
        8A2252338276F1DCF0E6570F3ED7C30040B5415F7DD8362B4E01BC8866D0556B
        C13E20CEBBD58924E2FA0F9EC481D6E560C4147C21330EF8DA30F08D6FCD1307
        00463743FCD21A7C306E03A5148AA26049B564F2059DAF0100FBC49AE76A37E7
        C91E7F2525E08023451F6EF8368069352DF85A606AAA51BC7A0D59C601BD73DD
        E70301A040C02EF540E91F855B3690CFE7E1B0BB1CC8D7BFC9D5B1CCF7C30C9D
        1C48312348013D9E9AE562834558ECB5488B3A485183C414A01475106E010205
        584E4604B6BC7A7EF02A0078DC5AA5C76B7DEAAE05FEF2D65F77B92ADAFF2A6C
        7613F00B1BD06E8DC2D27B08B575F5B852DE06A1C2BB308101742469FCF5D35F
        3D71F0E96377A43F0BC1E6DE2D841617070026720326B301BB9D03A2D1C50906
        20B89D44AC72DD350DEF9C03444F67AA5253D78671CE58FC5D1F8E064D82C5FA
        C988AEA8B1919C6AB0F1C5288C99958B33996ACCB6365DDCF57F21E67AA0BD7D
        8728E8A62EC62063EF9F379D5DDFA66E3168E9FF0D0B054360BCDF6B3EB2BE55
        6B37181AC8B3DAF14FC7FAFF03FF005BF4C8A5A60CD3C70000000049454E44AE
        426082}
      OnClick = btnClienteClick
      Width = 50
    end
    object btnUsuario: TdxBarLargeButton
      Caption = 'Usu'#225'rio'
      Category = 0
      Hint = 'Usu'#225'rio'
      Visible = ivAlways
      LargeGlyph.SourceDPI = 96
      LargeGlyph.Data = {
        89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
        F40000000473424954080808087C0864880000000970485973000000EC000000
        EC01792871BD0000001974455874536F667477617265007777772E696E6B7363
        6170652E6F72679BEE3C1A0000059F494441545885A5976B6C5C571585BFFB9E
        B1673C33763376FD6A6227719ACA55286AD3361048A2C46A489F08A450B52A2A
        D007428D100244513591458268554048080A4806D1AA89A52221D1A655A2B64A
        5311E2246AE3A48E0B09B1637BFCF67866EE9D3BF771F8D1B4B1E37939AC9FF7
        ACBDF6D2DEE7EC738F4485489050F5F5DEDE58DCFABC6EE017E2E46DE4D9C9E0
        89D3673B13BD7CDDAB4457ADD440A033FFE2377EF09FA71A57654BC68C5EA8DE
        26BF20C2BDFDECA94457AE84F44CB8BB2316CF6F2E971CA0B12DABC6EA735F7E
        26DCDD5189B6548EF0877B9FFD63FB86CCEEDB6E1FAA0A459D4A34C9CC69BCF7
        46B539F4D10DAF3CFDCEAFBE5D8A5BB2027BF865B4699DF3C8E65D97AB425107
        DF2FEB178050D461CB43E355758DD38F7C879F474A714B96D4D1EDA6789BAB21
        04C31F8739F4E7361A5AA0BA26C5A60786308205F72200B22411AB9FD3359D66
        F2A4AECB8050B4F9EC9CEC232BCAE8BF63ECDC1DA33532C9DCB8C1913FDD4C5D
        FB2C77748D2215A8A399D1B1B2862F2B52D1E4650D98567A32332D7B28B23279
        A99EBB37BB90B48946E1DE7B3C46466A38F4BB285AB5CD8A556962F526B9ACCA
        A97756D0D83E8D95166EDAB2A64AE528B9077A48E41C4B725C4F413774B0ED45
        EB4D4D2EBBBAF2ECD8241117B59803ADB84321344BD0F9C5615C47757B48E4AE
        BB020093FF0D487F7B612DB223835FB8E79204CDCD2ECDCD303F9FE7D4896AFE
        FE9B4E4CABFC292B59819F363DBF75DDFAB0FE85ED359819492044393D007296
        22D6AF4EB1B2C1D67F52BF77DB751BA80A8BED9FBB5B5201844465D901AE503B
        3A6655DDF0BAAEDB406A567DE5F06BFE58E58917E3F83F1B92F3B9AA974B7194
        528BC7B26F4EAC99D9DE77FE43BFB6B1953537DFE2C8D76EC46B61E76C2E5CD4
        C4E9132BFE319A0C7FFFF9F1678F97E297BD0BBA2FFFF05DEB8CF95555157994
        927E01703D0F4D91F2C3975A1EDA9F7CEEDD72FC8A2EA30409373DE38F130C50
        EEFAB07316A669245FE2898A2E8E8A0C004C8D897DFD27654155B028C7344DCE
        0FD488B919755FA5BAE56B7A058792474E6DC87F69EB8D1DA1D67020275D3B13
        1CD765E05C56F4F5351EDDD3FFB3EF55AA5BF10F09C0D851674BAFA91D6B5E5D
        7F67D7F639424A16104C8CE7387C38C2E858BC2F7BD6DFB21CCDA20D7D8C44C0
        D0436DB2703EABB911D05A3A76B4FE56366868F1CF499E075EDE46512486D54E
        14B48981B7869ECC65EDA14F637C49B3EC7CE642B191BCA4020912F2E8EA788F
        D2187A3017911547B8BEEF7F3258EAD29EBE6BEF462D5417E4AF4F677872E719
        007EFFFAAD3CFCEB6D64A6AD78FFD8DC815458C90320047933274B93B2F768EA
        C5DEB691F96F25482CEADD1203C9D5F1578DAFB47F6D4233711C07D03F5B9B9C
        C833FCC114B7EE5CC903DDDBE879CE42D124EEEFDE8A165018FA608A89E680E6
        C475EDAA6208C771981A487E5322146484DD0BF32D3A05DF655F9DBC2A765F36
        2A5D49BE184EADCAF993E300289AC2B9F7F2F4BF9D470F7C926FF0E4386EEDD2
        6DA5691A524B8874ADFCE053EC8F1535E0D6A8B7AB6D11C32E32ED842A33336D
        72E2C020BFB8F320913551C26BA3ECDF7880BE83834C4F9B08B5F0C9360C8354
        8D67B8D5DA1D0BBF2FB2EB07ABA20435046E411180E4D959DE1F9CE7A6BB1A30
        8540F8D07CDB0D1CED1920E5B8B0A9C82FA024E1EAE0EB728C6C910A7C0A6D30
        5DD4C0E8BA206B77AEE4F1BFEC20A2ABD4860C9E78F51E3ABA5A4876048AC615
        43C139A04CDBD0A2155AC2AAD3397AFC322DED11D2691BDFF539F3E625DE3F3D
        86B9D258B6818215B0375CDD27B2B9F48535B2CAE0E08F8E21421A7254A7F7C7
        C718BA6969F242B1151910C1AB13BAEAECD27608592279578CD44733CCF6CF32
        BE315A70A4158ABD16CB1AC50B91BBD120FBB18AAF40AE71F9BDFFBF0D008C6E
        8E95272DC780847BD1F9D7E591A0E58CE88E6B0128192F527364AAE4E3A21816
        C686F082B6A734F9B2777121E77FBD59312AA7CE40DF0000000049454E44AE42
        6082}
      OnClick = btnUsuarioClick
      Width = 50
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object cxBarEditItem1: TcxBarEditItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      PropertiesClassName = 'TdxBarCodeProperties'
      Properties.BarCodeSymbologyClassName = 'TdxBarCodeEAN13Symbology'
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Caption = 'Venda'
      Category = 0
      Hint = 'Venda'
      Visible = ivAlways
      LargeGlyph.SourceDPI = 96
      LargeGlyph.Data = {
        89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
        F40000000473424954080808087C0864880000000970485973000000EC000000
        EC01792871BD0000001974455874536F667477617265007777772E696E6B7363
        6170652E6F72679BEE3C1A000004CC494441545885D5565B4C5457145DF7396F
        66648482A15291166C798412BF4089A536D158A225B416AA1F0D29ADA9246D4A
        68ED571F1F25DA54636CC554ACD1C4688C985A2769D1B6428955690546688B0A
        C8A33C06986166EEBCEE3DF7F683019938C00C81A65DC9F938FBECBBF63A679F
        BDCF05FEA74802701A802D384E076D51835EC4373A008D00FA003C1D1C7D419B
        6E3122A24519802B61EC570094464BB69813480170338CFD66706DD905300002
        61EC0100EC22F82203C5B04E004A248362D8C98879A3D0A06C38D6870797BE00
        0024BFF84EC8E26C7BD31BAB23E68EFAC88CA9EB17B4C7666F6E9E686B88882F
        6A01A675F973DA87AE9D82FB81159CC6E005503D07C52480A3D393A85330171C
        6E0FACEFA6A3FA49D3BC2435771D217197FCD67EF68C19BF8CFB0000F9663500
        84CC830266B098325C104DE35E58463C3373CB88074DE3DEB0BECB2260835983
        FA21377A3D127A3D12EA87DCD868D684F55D96C6916F5663CF1A23F21A070100
        1F3C65425E301DFF8A0000D89B62C4DE14E39272CEDBFDDE3AD5F9E7423EB3C6
        0C223E019AA6C94FD71A1993297C99897E7FDAD71C87D6B676AC58B122AC8FDD
        6E4756668644088934EC43180C86CF699A9630C7AE6E5BAD074B5E7E65806559
        792E1F866144A3D1B83FFAE8CB88683A2130F5143FAF51B19BF55A3E4F260A4D
        D1D4A8C3EDFB5D92E476006D00BA01C84B254007E02586E1159A96743CCB7C9A
        B2CAC4976C4AD3E7A625D03CC76064C2833BDD3672EB8F21C1DA6DA3ED2E1F6F
        D0F2BD12917F750A811A009D412E3D801DB131EA0A42942724991C16BC524D38
        010C8042566BA890C5C0D698945C69B2EBBA2E2B354E38FEFE167D6E5AC2BC8A
        9D821F1D3D63686CEB973F3ED1ECF0F8A45D46BDEA755F806CCDCB4A922A8AB2
        0D89663D8A3FBCE0B139BCF9210258B5FE2359962B35E6243AA1A0CC10B7BE88
        E20C66DCD95F2CD4EE5EA52BD994FE48C0865BBD68BF3F8AACB5F1C848598944
        B31E00A028C0E33B8E88069DCABB677B8E61E7E675549C490B0010251919BB8F
        3BBBFA268A584C95E20BBC36A642F4BAB7AD2DFD844E2CD81512243EBF5477E8
        E25742C9A6F447FE7AD53C8BFE11172CD7BBD17E6F140090951A0F5122484F36
        730D07777254709B1D3D63F8C6620D9CB0B44B4456AE0268A2F4FA84386EA5B9
        2BB5F035A314F052FD6DCDC2BAB74F8404227E012D55CF4A03E7CBD9E95DCC85
        E10901D6FB36484446616E32265C3E9CF9A15339F66DAB6770CC159009EA04BF
        5887E0DD60DDEE615B695DEBCF80B25DF4BA603D7740250A7670BA87CD8451E9
        60CA2C14CF5CFD8BAE2CCE99F7014B88D5C1A457E152F33D6CA93AEF6A6EEBE7
        553C7BC529F86B0158008474A1A94E48C9A7A050DB398D0109591BC5B1160B93
        585016723FE2F3766A0ED5577B2A8B73B41D3D63686CED87D3E307CF32888DD1
        40AB6631E9F6E3FB1B3DC2E5EBF71935CFB6D85DBE2F015CF48B24FC5B8C6019
        969CEBE039C4FE0DC03CF85B036E9F3D2064EFFB2E240D8A4C70AB2A27B0524D
        024EC1E76169E6AACB171850738C8E67D9C7289AD24B44B64FBA7D3F02B80460
        78DE5CCD1600006567878F2A945221131117CA33C5EC7D973975DCEA19474970
        A0B3F64DC975F7C6499990F248C823C1CC632433CA614A81836639AC79EED574
        FFF8804D13973C3EBDDE75F2BD5CA1EF8E5726E4C85205FF4FE01F7603FF2215
        E582B50000000049454E44AE426082}
      Width = 80
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Caption = 'Emprestimo'
      Category = 0
      Hint = 'Emprestimo'
      Visible = ivAlways
      LargeGlyph.SourceDPI = 96
      LargeGlyph.Data = {
        89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
        F40000000473424954080808087C0864880000000970485973000000EC000000
        EC01792871BD0000001974455874536F667477617265007777772E696E6B7363
        6170652E6F72679BEE3C1A000004B1494441545885CD577F4C55551CFFDC7BEE
        BD701FE67DA06668C033B421FADE0CC819B0E467448BE604C5CC5801731A3897
        C15A65D996B29C90C3B50C74D21CB0586D914C71608A131188A810142AF00FE2
        BD67399C483E817BEFE90F78FCF2F1B837CAF5D9BEBB3BE7DC73BE9FF339DFEF
        F901FCCF11200A5C13CB303200EACE58869145816B04E0AFC701E3AE5114B8A6
        8820DFB0736DBD6CC5DE0D6E074ADD5F8958B39FDAD0656B760CCBCFE8213123
        588691F3B686BB9DF964CBDB1A4EC7D4D20CCE5DA34A29E139D65974AB1600CA
        732C544A891E0200002F0FFEB09675FEA7C6328CECE5C117B8F2CD00A3521FDB
        9348E689826EF25A70D7318CED87AB6555A5BC4B02634C1F061E58C6F118D012
        E587D222757BCC3D598F436991C83D59EFB29D7559FB1031250B52F757BAFCC9
        A98EA2521076B6649880ACA8FA084C97D8299F13751D7D885AB5541309595151
        D7D1A78F80BFFFC2298DD3E3A2B77F10EF95374051678F59C23258E9B7401F81
        F2F31D38DDD43D2E1D475824AD5B8E2DD1C100804F739371FFBE03AA06022CC3
        C0D320223AAB483B81D34DDD783F652D0C1EA3D5F786647CF47533B64407E3D4
        81972FF202BF9E171E48654D58E5E773B9A3B7FF41A2930BB2A28E3B07008307
        87B83501B0F50F22A7B82E3426BB083BF34FC1FAE7806E0231AB1FFF5E92A416
        8EE38624C9D88CB15373D634DC18BE02C567AFE1C59457E65DBA7C05CF256DC6
        C1F24B9A1D7F7B60DB4500F8A6D59A9A91991972F94AA3909199112649D257C0
        A49DB062EF06979B8D2419F0C6D1EFD0D8DC029EE731323282B090A73413988C
        96D61FC7C7581B16AAA8AACAB93D0D9D9065053C3FBAF6CEAFD566D7E57C89EF
        6353C650559500FFD24E585B5B8BCDC9CF637570209607FA63D3C604D4D6D468
        EAAB490177F838EF43545596A220C70B71EB16816180B3F576BCBB2F0BAD3F6C
        C3DBEFEC73DB7F4E0A5CB8701E5595A568F97221563E2160D39E9B4879F326D6
        0409B852EA8333556538575B3B3B01966194BB8E61DD048E1D2D40418E177C24
        16893B6C08F4E3B16C298F1776DAB1C04890B74B44D167F96EC7E0004014B8C2
        ED9F54EF0640A61F9BC7772756004875D5B9A5B51D71F9BEE3654F0F06BE8B38
        EC7E550200443DED89F40F3AA128CA8C045800F86B68E42D95520EA36939C532
        0BABB7B89B011DDB95AB3FF785F111163DBD2348DC610300F03C039EE7A0C833
        DF53E714036121AB51D3E000002465D9717B4085A7C7C44979B6FE1E82835660
        F6FBECECA066B379501004C56C360F02A0569B9D969695D32797CDA7B7EA03E8
        AF67FC684284481322447ABDCA8FDEAA0FA04B168BB4B8E838EDFDBD8F02A016
        8B65501004C562B10C62EC1AA85981989858B1ED6A3B1B171F2F4ED4C5E0A58D
        AF213CED367EEA1C46D9C1475151B0183F770DC192FC079253D2101B1B034246
        6FEA71F1F186B6ABED6C5454B441D7F409217267D72FD46AB3D3EE9E1BD46432
        A9569B9D3AADB4AC9C3E1B19428DF345EA6D34D0F591A1F4C4892F68F76F3DB4
        CF6AA3569B9D9A4C26B5BBE706B5DAECF4DAF54E4A081901342E8ED1686C7A3D
        3D3D2C3B7B172B8AE28CFF298A02451E8D78C291F1994F86C3E1C09123856A49
        4949F3C09D3B9A9F7001DEDEDE8D8490393F5E0821B224490DD0F988FDCFF037
        9590EC57B070EC110000000049454E44AE426082}
      OnClick = dxBarLargeButton3Click
      Width = 80
    end
  end
  object Timer: TTimer
    OnTimer = timerTimer
    Left = 824
    Top = 448
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    SkinName = 'Office2010Silver'
    Left = 768
    Top = 448
  end
  object MainMenu1: TMainMenu
    Left = 696
    Top = 440
    object CADASTRO1: TMenuItem
      Caption = 'Cadastro'
      object UsuriosFuncionrios1: TMenuItem
        Caption = 'Usu'#225'rios / Funcion'#225'rios'
        object Funcionrio1: TMenuItem
          Caption = 'Usu'#225'rio e Funcion'#225'rio'
        end
        object Ca1: TMenuItem
          Caption = 'Categoria de usu'#225'rio'
          OnClick = Ca1Click
        end
      end
    end
  end
end
