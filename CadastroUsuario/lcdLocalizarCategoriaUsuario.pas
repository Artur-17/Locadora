unit lcdLocalizarCategoriaUsuario;

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
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, DB, cxDBData, DBCtrls,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, StdCtrls, cxButtons, ExtCtrls,
  MemDS, DBAccess, Uni, lcdDataModule;

type
  TLocalizarCategoriaUsuario = class(TForm)
    edtPesquisa: TEdit;
    pnlTop: TPanel;
    btnPesquisar: TcxButton;
    pnlBottom: TPanel;
    gridTbv: TcxGridDBTableView;
    gridLvl: TcxGridLevel;
    grid: TcxGrid;
    btnFechar: TcxButton;
    btnIncluir: TcxButton;
    btnAlterar: TcxButton;
    btnExcluir: TcxButton;
    DBNavigator: TDBNavigator;
    qryCategoriaUsuario: TUniQuery;
    qryCategoriaUsuarioID: TIntegerField;
    qryCategoriaUsuarioCATEGORIA: TStringField;
    qryCategoriaUsuarioDESCRICAO: TStringField;
    qryCategoriaUsuarioOBSERVACAO: TStringField;
    qryCategoriaUsuarioDT_CRIACAO: TDateField;
    qryCategoriaUsuarioINATIVO: TStringField;
    qryCategoriaUsuarioDELETADO: TStringField;
    dtsCategoriaUsuario: TDataSource;
    gridTbvID: TcxGridDBColumn;
    gridTbvCATEGORIA: TcxGridDBColumn;
    gridTbvDESCRICAO: TcxGridDBColumn;
    gridTbvDT_CRIACAO: TcxGridDBColumn;
    pnlClient: TPanel;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  class procedure exibirCategoriaUsuario();
  end;

var
  LocalizarCategoriaUsuario: TLocalizarCategoriaUsuario;

implementation

{$R *.dfm}

{ TLocalizarCatUsuario }

procedure TLocalizarCategoriaUsuario.btnAlterarClick(Sender: TObject);
begin
  ShowMessage( qryCategoriaUsuario.FieldByName('id').AsString );
end;

procedure TLocalizarCategoriaUsuario.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TLocalizarCategoriaUsuario.btnPesquisarClick(Sender: TObject);
var
  selectOriginal : string;
  lQRY : TuniQuery;
begin

    lQRY := qryCategoriaUsuario;
    selectOriginal := 'SELECT * FROM USUARIO_CATEGORIA' ;


    try

      try
        if lQRY.Active then
        begin
          lQRY.Close;
          lQRY.SQL.Add('SELECT * FROM USUARIO_CATEGORIA WHERE ID = :ID ');
          lQRY.ParamByName('ID').AsString := edtPesquisa.Text;

          lQRY.Open;

        end;
      except
        on E: Exception do
          ShowMessage( E.Message );
      end;





    finally
       if Assigned(lQRY) then
      FreeAndNil(lQRY);
    end;
end;

class procedure TLocalizarCategoriaUsuario.exibirCategoriaUsuario;
var
  lcadastro : TLocalizarCategoriaUsuario;
begin
  lcadastro := TLocalizarCategoriaUsuario.Create(nil);
  lcadastro.ShowModal();
  FreeAndNil(lcadastro);
end;

procedure TLocalizarCategoriaUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if qryCategoriaUsuario.Active then
    qryCategoriaUsuario.Close;

  if qryCategoriaUsuario.Active then
    qryCategoriaUsuario.Close;
end;

procedure TLocalizarCategoriaUsuario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
    Close;
end;

procedure TLocalizarCategoriaUsuario.FormShow(Sender: TObject);
begin

    try
    if not Assigned(qryCategoriaUsuario.Connection)  then
      qryCategoriaUsuario.Connection := dtmPrincipal.conexao;

    if not qryCategoriaUsuario.Connection.Connected then
      qryCategoriaUsuario.Connection.Connect();

    if not qryCategoriaUsuario.Active then
      qryCategoriaUsuario.Open;
  except
    on E: Exception do
      ShowMessage( E.Message );
  end;
end;

end.
