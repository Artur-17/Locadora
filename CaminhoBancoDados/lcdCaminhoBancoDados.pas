unit lcdCaminhoBancoDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,db,
  dxSkinXmas2008Blue, StdCtrls, cxButtons, ExtCtrls, lcdDataModule,Utils;

type
  TCaminhoBancoDados = class(TForm)
    edtBancoDados: TEdit;
    btnLocalizarBancoDados: TcxButton;
    dlgBancoDados: TOpenDialog;
    Label1: TLabel;
    pnlTop: TPanel;
    btnGravar: TcxButton;
    btnFechar: TcxButton;
    procedure btnLocalizarBancoDadosClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure ExibirCaminhoBancoDados();
  end;

var
  CaminhoBancoDados: TCaminhoBancoDados;

implementation

{$R *.dfm}

procedure TCaminhoBancoDados.btnFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TCaminhoBancoDados.btnGravarClick(Sender: TObject);
begin
  dtmPrincipal.conexao.Database := edtBancoDados.Text;

  dtmPrincipal.conexao.Connect();
  TUtils.GravarValorRegistro('BancoDeDados',edtBancoDados.Text, ftstring);

  ModalResult := mrOk;

end;

procedure TCaminhoBancoDados.btnLocalizarBancoDadosClick(Sender: TObject);
begin
   if (dlgBancoDados.Execute(self.Handle)) then
   begin
    edtBancoDados.Text := dlgBancoDados.FileName;
   end;
end;

class procedure TCaminhoBancoDados.ExibirCaminhoBancoDados;
var
  lcadastro : TCaminhoBancoDados;
begin
  lcadastro := TCaminhoBancoDados.Create(nil);
  lcadastro.ShowModal();
  FreeAndNil(lcadastro);

end;

procedure TCaminhoBancoDados.FormShow(Sender: TObject);
begin
  edtBancoDados.Text := TUtils.LerValorRegistro('BancoDeDados',ftstring);
end;


end.
