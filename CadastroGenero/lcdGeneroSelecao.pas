unit lcdGeneroSelecao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinXmas2008Blue, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, dxDateRanges, DB, cxDBData, Menus, MemDS, DBAccess, Uni,
  StdCtrls, cxButtons, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls,

  lcdDataModule;

type
  TGeneroSelecao = class(TForm)
    pnlTop: TPanel;
    pnlfields: TPanel;
    lblPesquisa: TLabel;
    edtPesquisa: TEdit;
    gridGenero: TcxGrid;
    gridGeneroDBTableView: TcxGridDBTableView;
    gridGeneroLevel: TcxGridLevel;
    pnlbottom: TPanel;
    btnCancelar: TcxButton;
    btnSelecionar: TcxButton;
    qryGenero: TUniQuery;
    dtsGenero: TDataSource;
    gridGeneroDBTableViewID: TcxGridDBColumn;
    gridGeneroDBTableViewNOME: TcxGridDBColumn;
    gridGeneroDBTableViewIDADE_MINIMA: TcxGridDBColumn;
    gridGeneroDBTableViewDT_CADASTRO: TcxGridDBColumn;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
  private

    FGeneroID: Integer;

    Function GetGeneroId: Integer;
  public
    class function Selecionar(): Integer;

    property GeneroId: Integer read GetGeneroId;
  end;

var
  GeneroSelecao: TGeneroSelecao;

implementation

{$R *.dfm}

procedure TGeneroSelecao.btnCancelarClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TGeneroSelecao.btnSelecionarClick(Sender: TObject);
begin
  FGeneroID := qryGenero.FieldByName('ID').AsInteger;

  ModalResult := mrOk;
end;

procedure TGeneroSelecao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if qryGenero.Active then
    qryGenero.Close();
end;

procedure TGeneroSelecao.FormCreate(Sender: TObject);
begin
  qryGenero.Connection := dtmPrincipal.conexao;
end;

procedure TGeneroSelecao.FormShow(Sender: TObject);
begin
  qryGenero.Open();
end;

function TGeneroSelecao.GetGeneroId: Integer;
begin
   Result := FGeneroID;
end;

class function TGeneroSelecao.Selecionar: Integer;
var
  lSelecao: TGeneroSelecao;
begin
  Result := 0;
  lSelecao := TGeneroSelecao.Create(nil);

  try
    if (lSelecao.ShowModal() = mrOk) then
      Result := lSelecao.GeneroId;
  finally
    FreeAndNil(lSelecao);
  end;
end;

end.
