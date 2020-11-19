unit lcdCadastroFilme;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxButtons, Mask, dxGDIPlusClasses;

type
  TCadastroProduto = class(TForm)
    pnlTop: TPanel;
    edtCodBarras: TEdit;
    lblCodBarras: TLabel;
    edtTitulo: TEdit;
    lblTitulo: TLabel;
    lblNomeDiretor: TLabel;
    edtNomeDiretor: TEdit;
    edtNomeEstudio: TEdit;
    lblNomeEstudio: TLabel;
    lblGenero: TLabel;
    cbbGenero: TComboBox;
    mmSinopse: TMemo;
    lblSinopse: TLabel;
    lblValor: TLabel;
    lblQuantidade: TLabel;
    edtValor: TMaskEdit;
    edtQuantidade: TEdit;
    btnGravar: TcxButton;
    btnCancelar: TcxButton;
    imgProduto: TImage;
    btnFoto: TcxButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure Exibir();
  end;

var
  CadastroProduto: TCadastroProduto;

implementation

{$R *.dfm}

procedure TCadastroProduto.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

class procedure TCadastroProduto.Exibir;
var
  lCadastroProduto: TLocalizarProduto;
begin
  lCadastroProduto := TLocalizarProduto.Create(nil);
  lCadastroProduto.ShowModal;
  FreeAndNil(lCadastroProduto);

end;

procedure TCadastroProduto.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
    ModalResult := mrCancel;
end;

end.
