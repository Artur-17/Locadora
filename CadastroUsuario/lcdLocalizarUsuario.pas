unit lcdLocalizarUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  DBAccess, Uni, DBCtrls, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, StdCtrls,
  cxButtons, ExtCtrls,
  lcdDataModule, lcdCadastroFuncionario;

type
  TLocalizarUsuario = class(TForm)
    pnlTop: TPanel;
    pnlClient: TPanel;
    btnPesquisar: TcxButton;
    edtPesquisa: TEdit;
    gridUsuario: TcxGrid;
    viewUsuario: TcxGridDBTableView;
    levelUsuario: TcxGridLevel;
    pnlBottom: TPanel;
    btnAlterar: TcxButton;
    btnExcluir: TcxButton;
    btnFechar: TcxButton;
    btnIncluir: TcxButton;
    DBNavigator: TDBNavigator;
    qryUsuario: TUniQuery;
    dtsUsuario: TDataSource;
    qryUsuarioID: TIntegerField;
    qryUsuarioLOGIN: TStringField;
    qryUsuarioSENHA: TStringField;
    qryUsuarioDT_CRIACAO: TDateField;
    qryUsuarioDELETADO: TStringField;
    qryUsuarioINATIVO: TStringField;
    qryUsuarioNOME: TStringField;
    qryUsuarioCPF: TStringField;
    qryUsuarioEMAIL: TStringField;
    qryUsuarioTELEFONE: TStringField;
    qryUsuarioDT_NASCIMENTO: TDateField;
    qryUsuarioOBSERVACAO: TStringField;
    qryUsuarioLOGRADOURO: TStringField;
    qryUsuarioBAIRRO: TStringField;
    qryUsuarioCIDADE: TStringField;
    qryUsuarioCOMPLEMENTO: TStringField;
    qryUsuarioESTADO: TStringField;
    viewUsuarioID: TcxGridDBColumn;
    viewUsuarioLOGIN: TcxGridDBColumn;
    viewUsuarioDT_CRIACAO: TcxGridDBColumn;
    viewUsuarioNOME: TcxGridDBColumn;
    viewUsuarioCPF: TcxGridDBColumn;
    viewUsuarioEMAIL: TcxGridDBColumn;
    viewUsuarioTELEFONE: TcxGridDBColumn;
    viewUsuarioDT_NASCIMENTO: TcxGridDBColumn;
    viewUsuarioOBSERVACAO: TcxGridDBColumn;
    viewUsuarioLOGRADOURO: TcxGridDBColumn;
    viewUsuarioBAIRRO: TcxGridDBColumn;
    viewUsuarioCIDADE: TcxGridDBColumn;
    viewUsuarioCOMPLEMENTO: TcxGridDBColumn;
    viewUsuarioESTADO: TcxGridDBColumn;
    procedure btnFecharClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure Exibir();
  end;

var
  LocalizarUsuario: TLocalizarUsuario;

implementation

{$R *.dfm}

procedure TLocalizarUsuario.btnFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TLocalizarUsuario.btnIncluirClick(Sender: TObject);
begin
  TCadastroFuncionario.Novo(Self, qryUsuario, qryUsuario.FieldByName('ID').AsInteger);
  viewUsuario.DataController.DataSet.Refresh;
end;

class procedure TLocalizarUsuario.Exibir;
var
  lListaUsuario : TLocalizarUsuario;
begin
  lListaUsuario := TLocalizarUsuario.Create(nil);
  lListaUsuario.ShowModal();
  FreeAndNil(lListaUsuario);

end;

end.