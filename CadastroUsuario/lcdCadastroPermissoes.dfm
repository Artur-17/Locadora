object CadastroPermissoes: TCadastroPermissoes
  Left = 0
  Top = 0
  Caption = 'Cadastro de permiss'#245'es'
  ClientHeight = 459
  ClientWidth = 437
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 15
  object lblGeral: TLabel
    Left = 24
    Top = 47
    Width = 37
    Height = 15
    Caption = 'GERAL'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 437
    Height = 41
    Align = alTop
    Caption = 'PERMISS'#213'ES DO USU'#193'RIO'
    Color = 4605510
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 15790320
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = -137
    ExplicitWidth = 806
  end
  object cbVender: TcxCheckBox
    Left = 24
    Top = 66
    Caption = 'Permitir o usu'#225'rio a relizar venda'
    TabOrder = 1
  end
  object btnCancelar: TcxButton
    Left = 332
    Top = 425
    Width = 97
    Height = 25
    Caption = 'Cancelar'
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2010Silver'
    OptionsImage.Glyph.SourceDPI = 96
    OptionsImage.Glyph.Data = {
      89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
      610000000473424954080808087C086488000000097048597300000059000000
      5901AA9DA9860000001974455874536F667477617265007777772E696E6B7363
      6170652E6F72679BEE3C1A000000CB49444154388DADD25D4EC3301004E08F16
      F2CE35486F05D7695351F534C0295A2ED2F48D54E5A11B646D928ABF9146B6C6
      3BB6676D8658608D3D8EC17D688B91FA2F54D8E284F3043B6CA276607EBB62CC
      7CCD9B6C7F60EEF95C66EED2623B62C85A877A8627CC8BDBB4B84753684D68C7
      429BE311DE474E5BE126C6729EEB767098C8D81BA7CC671C66FE017F8ED0E46B
      E1361956A1E5975842EDF7CFF8D0C7D84C34E91AD7651F2A97EFF95DF30BEE72
      332B97EF99E394FC889307E61275346D17B9DB982FCBCC3D3E01CE9C9E84BC00
      CBCA0000000049454E44AE426082}
    TabOrder = 2
    OnClick = btnCancelarClick
  end
  object btnGravar: TcxButton
    Left = 219
    Top = 425
    Width = 97
    Height = 25
    Caption = 'OK'
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2010Silver'
    OptionsImage.Glyph.SourceDPI = 96
    OptionsImage.Glyph.Data = {
      89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
      610000000473424954080808087C086488000000097048597300000059000000
      5901AA9DA9860000001974455874536F667477617265007777772E696E6B7363
      6170652E6F72679BEE3C1A000000E849444154388D9DD2314EC3401404D0A758
      B8A2E00274D0E04834141C817B844B7008504494032051D250939CC2A10B1D3D
      52401460140AAF236BED98E091A6D8D59FF93B7F3F4D0C31C6021F818B70376C
      A9DF20C5143F586F618149A86D88E71DC298B3D864FA0F71C5DB7AE6A2874181
      6C804B245DC30978C1055EC339C1089E77E8B6C421CEF059BBCF611515CF955F
      D6267E8B6A576D068F18E0EA0FF1C6A02DC25D30D9EF10AF912738C67934B053
      1CE10B0F38D832D87BC8F4FFC693CA69D2C3605C7F4AAA5CCF5DC54FD88BF3A4
      CAF5EC8AF31D3A37C47564B8512EC97B608EEB7AE60ABFBEECA3748BBA647900
      00000049454E44AE426082}
    TabOrder = 3
  end
end
