object CadastroGenero: TCadastroGenero
  Left = 0
  Top = 0
  Caption = 'Cadastro de G'#234'nero'
  ClientHeight = 170
  ClientWidth = 615
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblGenero: TLabel
    Left = 8
    Top = 57
    Width = 35
    Height = 13
    Caption = 'Genero'
  end
  object lblIdadeMinima: TLabel
    Left = 494
    Top = 57
    Width = 63
    Height = 13
    Caption = 'Idade Minima'
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 615
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'CADASTRO DE G'#202'NEROS'
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
  object edtGenero: TEdit
    Left = 8
    Top = 76
    Width = 465
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object edtIdadeMinima: TEdit
    Left = 494
    Top = 76
    Width = 113
    Height = 21
    CharCase = ecUpperCase
    NumbersOnly = True
    TabOrder = 2
  end
  object btnSalvar: TcxButton
    Left = 392
    Top = 137
    Width = 99
    Height = 25
    Caption = 'Salvar'
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
    OnClick = btnSalvarClick
  end
  object btnCancelar: TcxButton
    Left = 508
    Top = 137
    Width = 99
    Height = 25
    Caption = 'Cancelar'
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
    TabOrder = 4
    OnClick = btnCancelarClick
  end
end
