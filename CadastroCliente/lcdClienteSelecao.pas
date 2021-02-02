unit lcdClienteSelecao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
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
  dxSkinXmas2008Blue, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, dxDateRanges, DB, cxDBData, Menus, MemDS, DBAccess, Uni,
  StdCtrls, cxButtons, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls,

  lcdDataModule;

type
  TClienteSelecao = class(TForm)
    pnlTop: TPanel;
    pnlfields: TPanel;
    lblPesquisa: TLabel;
    edtPesquisa: TEdit;
    grdClienteDBTableView1: TcxGridDBTableView;
    grdClienteLevel1: TcxGridLevel;
    grdCliente: TcxGrid;
    pnlbottom: TPanel;
    btnCancelar: TcxButton;
    btnSelecionar: TcxButton;
    qryCliente: TUniQuery;
    dtsCliente: TDataSource;
    qryClienteID: TIntegerField;
    qryClienteNOME: TStringField;
    qryClienteCPF: TStringField;
    qryClienteEMAIL: TStringField;
    qryClienteTELEFONE: TStringField;
    qryClienteDT_NASCIMENTO: TDateField;
    qryClienteESTADO: TStringField;
    qryClienteLOGRADOURO: TStringField;
    qryClienteBAIRRO: TStringField;
    qryClienteCIDADE: TStringField;
    qryClienteCOMPLEMENTO: TStringField;
    qryClienteOBSERVACAO: TStringField;
    grdClienteDBTableView1ID: TcxGridDBColumn;
    grdClienteDBTableView1NOME: TcxGridDBColumn;
    grdClienteDBTableView1CPF: TcxGridDBColumn;
    grdClienteDBTableView1EMAIL: TcxGridDBColumn;
    grdClienteDBTableView1TELEFONE: TcxGridDBColumn;
    grdClienteDBTableView1DT_NASCIMENTO: TcxGridDBColumn;
    grdClienteDBTableView1ESTADO: TcxGridDBColumn;
    grdClienteDBTableView1LOGRADOURO: TcxGridDBColumn;
    grdClienteDBTableView1BAIRRO: TcxGridDBColumn;
    grdClienteDBTableView1CIDADE: TcxGridDBColumn;
    grdClienteDBTableView1COMPLEMENTO: TcxGridDBColumn;
    grdClienteDBTableView1OBSERVACAO: TcxGridDBColumn;
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FClienteID : Integer;

    function GetClienteId: Integer;
  public
    class function Selecionar(): Integer;

    property ClienteId: Integer read GetClienteId;
  end;

var
  ClienteSelecao: TClienteSelecao;

implementation

{$R *.dfm}

procedure TClienteSelecao.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrClose;
end;

procedure TClienteSelecao.btnSelecionarClick(Sender: TObject);
begin
  FClienteID := qryCliente.FieldByName('ID').AsInteger;

  ModalResult := mrOk;
end;

function TClienteSelecao.GetClienteId: Integer;
begin
  Result := FClienteId;
end;

class function TClienteSelecao.Selecionar: Integer;
var
  lSelecao: TClienteSelecao;
begin
  Result := 0;
  lSelecao := TClienteSelecao.Create(nil);

  try
    if (lSelecao.ShowModal() = mrOk) then
      Result := lSelecao.FClienteID;
  finally
    FreeAndNil(lSelecao);
  end;
end;

end.
