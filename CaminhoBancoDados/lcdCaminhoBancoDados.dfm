object CaminhoBancoDados: TCaminhoBancoDados
  Left = 0
  Top = 0
  Caption = 'Localizar base de dados'
  ClientHeight = 161
  ClientWidth = 470
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 17
    Top = 51
    Width = 153
    Height = 15
    Caption = 'Caminho do banco de dados'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtBancoDados: TEdit
    Left = 17
    Top = 72
    Width = 393
    Height = 23
    TabOrder = 0
  end
  object btnLocalizarBancoDados: TcxButton
    Left = 416
    Top = 70
    Width = 34
    Height = 25
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
    TabOrder = 1
    OnClick = btnLocalizarBancoDadosClick
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 470
    Height = 41
    Align = alTop
    Caption = 'CAMINHO DO BANCO DE DADOS'
    Color = 4605510
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 15790320
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
  end
  object btnGravar: TcxButton
    Left = 288
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Gravar'
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
    TabOrder = 3
    OnClick = btnGravarClick
  end
  object btnFechar: TcxButton
    Left = 375
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Fechar'
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
  object dlgBancoDados: TOpenDialog
    FileName = '*.FDB'
    InitialDir = 'C:\Users\pdvfo\Desktop\OficinaDelphi\FocusLocadora\BaseDados'
    Left = 40
    Top = 112
  end
end