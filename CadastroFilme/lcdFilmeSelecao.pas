unit lcdFilmeSelecao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinXmas2008Blue, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, dxDateRanges, DB, cxDBData, Menus, MemDS, DBAccess, Uni,
  StdCtrls, cxButtons, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,

  lcdDataModule;

type
  TFilmeSelecao = class(TForm)
    pnlTop: TPanel;
    pnlfields: TPanel;
    lblPesquisa: TLabel;
    edtPesquisa: TEdit;
    grdFilmeDBTableView1: TcxGridDBTableView;
    grdFilmeLevel1: TcxGridLevel;
    grdFilme: TcxGrid;
    pnlbottom: TPanel;
    btnCancelar: TcxButton;
    btnSelecionar: TcxButton;
    qryFilme: TUniQuery;
    dtsFilme: TDataSource;
    qryFilmeID: TIntegerField;
    qryFilmeTITULO: TStringField;
    grdFilmeDBTableView1ID: TcxGridDBColumn;
    grdFilmeDBTableView1TITULO: TcxGridDBColumn;
    procedure btnSelecionarClick(Sender: TObject);
  private
    FFilmeID: Integer;
    Function GetFilmeId: Integer;

  public
    class function Selecionar(): Integer;

    property FilmeID: Integer read GetFilmeId;
  end;

var
  FilmeSelecao: TFilmeSelecao;

implementation

{$R *.dfm}

procedure TFilmeSelecao.btnSelecionarClick(Sender: TObject);
begin
  FFilmeID := qryFilme.FieldByName('ID').AsInteger;

  ModalResult := mrOk;
end;

function TFilmeSelecao.GetFilmeId: Integer;
begin
  Result := FFilmeID;
end;

class function TFilmeSelecao.Selecionar: Integer;
var
  lSelecao: TFilmeSelecao;
begin
  Result := 0;
  lSelecao := TFilmeSelecao.Create(nil);

  try
    if (lSelecao.ShowModal() = mrOk) then
      Result := lSelecao.FilmeID;
  finally
    FreeAndNil(lSelecao);
  end;
end;


end.
