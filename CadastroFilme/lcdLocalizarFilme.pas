unit lcdLocalizarFilme;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, DB, cxDBData, DBCtrls, StdCtrls, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, MemDS, DBAccess, Uni, dxSkinBlack, dxSkinBlue,
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
  dxSkinTheAsphaltWorld, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Menus, cxButtons,
  lcdDataModule, lcdCadastroFilme;


type
  TLocalizarFilme = class(TForm)
    edtPesquisar: TEdit;
    pnlbottom: TPanel;
    btnNavigator: TDBNavigator;
    pnlTop: TPanel;
    pnlfields: TPanel;
    qryFilme: TUniQuery;
    dtsFilme: TDataSource;
    btnIncluir: TcxButton;
    btnPesquisar: TcxButton;
    btnAlterar: TcxButton;
    btnExcluir: TcxButton;
    btnFechar: TcxButton;
    gridFilmeDBTableView1: TcxGridDBTableView;
    gridFilmeLevel1: TcxGridLevel;
    gridFilme: TcxGrid;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   class procedure exibirLocalizarFilme();

  end;

var
  LocalizarFilme: TLocalizarFilme;

implementation

{$R *.dfm}

{ TuLocalizarFilme }

procedure TLocalizarFilme.btnFecharClick(Sender: TObject);
begin
  Close;
end;


class procedure TLocalizarFilme.exibirLocalizarFilme;
var
  lcadastro : TLocalizarFilme;
begin
  lcadastro := TLocalizarFilme.Create(nil);

  lcadastro.ShowModal();
  FreeAndNil(lcadastro);
end;

procedure TLocalizarFilme.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if qryFilme.Active then
    qryFilme.Close;
end;

procedure TLocalizarFilme.FormCreate(Sender: TObject);
begin
  qryFilme.Connection := dtmPrincipal.conexao;
end;

procedure TLocalizarFilme.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
  Close;

end;

procedure TLocalizarFilme.FormShow(Sender: TObject);
begin
  if not Assigned(qryFilme.Connection)  then
    qryFilme.Connection := dtmPrincipal.conexao;

  if not qryFilme.Connection.Connected then
    qryFilme.Connection.Connect();

  if not qryFilme.Active then
    qryFilme.Open;
end;


end.
