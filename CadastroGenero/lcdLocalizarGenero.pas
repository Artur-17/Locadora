unit lcdLocalizarGenero;

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
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxControls, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, DB, cxDBData, MemDS,
  DBAccess, Uni, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, StdCtrls,
  cxButtons, DBCtrls, ExtCtrls, lcdDataModule, lcdCadastroGenero;

type
  TLocalizarGenero = class(TForm)
    pnlTop: TPanel;
    pnlfields: TPanel;
    lblPesquisa: TLabel;
    edtPesquisa: TEdit;
    pnlbottom: TPanel;
    btnNavigator: TDBNavigator;
    btnIncluir: TcxButton;
    btnAlterar: TcxButton;
    btnExcluir: TcxButton;
    btnFechar: TcxButton;
    gridGeneroDBTableView: TcxGridDBTableView;
    gridGeneroLevel: TcxGridLevel;
    gridGenero: TcxGrid;
    qryGenero: TUniQuery;
    dtsGenero: TDataSource;
    gridGeneroDBTableViewID: TcxGridDBColumn;
    gridGeneroDBTableViewNOME: TcxGridDBColumn;
    gridGeneroDBTableViewIDADE_MINIMA: TcxGridDBColumn;
    gridGeneroDBTableViewDT_CADASTRO: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
  private
    { Private declarations }

  public
  class procedure  Exibir();

  end;

var
  LocalizarGenero: TLocalizarGenero;

implementation


{$R *.dfm}

procedure TLocalizarGenero.btnAlterarClick(Sender: TObject);
begin
  TCadastroGenero.Editar(qryGenero);
end;

procedure TLocalizarGenero.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('AVISO: Deseja realmente excluir esse registro ?','ATEN��O ',MB_YESNO + MB_ICONWARNING)=MRYES then
   begin
    qryGenero.Delete;
   end;
end;

procedure TLocalizarGenero.btnFecharClick(Sender: TObject);
begin
  ModalResult := MrClose;
end;

procedure TLocalizarGenero.btnIncluirClick(Sender: TObject);
begin
 if TCadastroGenero.Cadastrar() then
    qryGenero.Refresh();
end;

class procedure TLocalizarGenero.Exibir;
var
  lGeneroLista : TLocalizarGenero;
begin
  lGeneroLista := TLocalizarGenero.Create(nil);
  lGeneroLista.ShowModal();
  FreeAndNil(lGeneroLista);
end;

procedure TLocalizarGenero.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if qryGenero.Active then
    qryGenero.Close;
end;

procedure TLocalizarGenero.FormShow(Sender: TObject);
begin
  if not Assigned(qryGenero.Connection)  then
    qryGenero.Connection := dtmPrincipal.conexao;

  if not qryGenero.Connection.Connected then
    qryGenero.Connection.Connect();

  if not qryGenero.Active then
    qryGenero.Open;
end;

end.
