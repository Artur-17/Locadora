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
    edtPesquisa: TEdit;
    pnlbottom: TPanel;
    btnNavigator: TDBNavigator;
    pnlTop: TPanel;
    pnlfields: TPanel;
    qryFilme: TUniQuery;
    dtsFilme: TDataSource;
    btnIncluir: TcxButton;
    btnAlterar: TcxButton;
    btnExcluir: TcxButton;
    btnFechar: TcxButton;
    viewFilme: TcxGridDBTableView;
    levelFilme: TcxGridLevel;
    gridFilme: TcxGrid;
    qryFilmeID: TIntegerField;
    qryFilmeTITULO: TStringField;
    qryFilmeSINOPSE: TStringField;
    qryFilmeDT_LANCAMENTO: TDateField;
    qryFilmeNM_DIRETOR: TStringField;
    qryFilmeNM_ESTUDIO: TStringField;
    qryFilmeGENERO: TStringField;
    qryFilmeVALOR: TFloatField;
    qryFilmeJUROS: TFloatField;
    qryFilmeQUANTIDADE: TIntegerField;
    viewFilmeID: TcxGridDBColumn;
    viewFilmeTITULO: TcxGridDBColumn;
    viewFilmeSINOPSE: TcxGridDBColumn;
    viewFilmeDT_LANCAMENTO: TcxGridDBColumn;
    viewFilmeNM_DIRETOR: TcxGridDBColumn;
    viewFilmeNM_ESTUDIO: TcxGridDBColumn;
    viewFilmeGENERO: TcxGridDBColumn;
    viewFilmeVALOR: TcxGridDBColumn;
    viewFilmeQUANTIDADE: TcxGridDBColumn;
    viewFilmeJUROS: TcxGridDBColumn;
    lblPesquisa: TLabel;
    viewFilmeCOD_BARRAS: TcxGridDBColumn;
    qryFilmeCOD_BARRAS: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure qryFilmeFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  private
    { Private declarations }
   procedure Filtrar();
  public
    { Public declarations }
   class procedure exibirLocalizarFilme();

  end;

var
  LocalizarFilme: TLocalizarFilme;

implementation

uses
  StrUtils;

{$R *.dfm}

{ TuLocalizarFilme }

procedure TLocalizarFilme.btnAlterarClick(Sender: TObject);
begin
  TCadastroFilme.Alterar(Self, qryFilme, qryFilme.FieldByName('ID').AsInteger);
  viewFilme.DataController.DataSet.Refresh;
end;

procedure TLocalizarFilme.btnExcluirClick(Sender: TObject);
begin
   if Application.MessageBox('AVISO: Deseja realmente excluir esse registro ?','ATEN��O ',MB_YESNO + MB_ICONWARNING)=MRYES then
   begin
    qryFilme.Delete;
   end;
end;

procedure TLocalizarFilme.btnFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;


procedure TLocalizarFilme.btnIncluirClick(Sender: TObject);
begin
  TCadastroFilme.Novo(Self, qryFilme, qryFilme.FieldByName('ID').AsInteger);
  viewfilme.DataController.DataSet.Refresh;
end;

procedure TLocalizarFilme.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  Filtrar();
end;

class procedure TLocalizarFilme.exibirLocalizarFilme;
var
  lcadastro : TLocalizarFilme;
begin
  lcadastro := TLocalizarFilme.Create(nil);

  lcadastro.ShowModal();
  FreeAndNil(lcadastro);
end;

procedure TLocalizarFilme.Filtrar;
begin
  if (Trim(edtPesquisa.Text) = '') then
    begin
      qryFilme.Filtered := False;
      Exit;
    end;

    qryFilme.Filtered := False;
    qryFilme.Filter := '(1 = 1)';
    qryFilme.Filtered := True;
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

procedure TLocalizarFilme.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F2) then
     begin
      TCadastroFilme.Novo(Self, qryFilme, qryFilme.FieldByName('ID').AsInteger);
      viewfilme.DataController.DataSet.Refresh;
     end;

  if (Key = VK_F5) then
    begin
      TCadastroFilme.Alterar(Self, qryFilme, qryFilme.FieldByName('ID').AsInteger);
      viewFilme.DataController.DataSet.Refresh;
    end;

  if (Key = VK_F4) then
    begin
        if Application.MessageBox('AVISO: Deseja realmente excluir esse registro ?','ATEN��O ',MB_YESNO + MB_ICONWARNING)=MRYES then
      begin
        qryFilme.Delete;
      end;
    end;

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


procedure TLocalizarFilme.qryFilmeFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  i: Integer;
  lPalavra,
  lTextoPesquisado,
  lTextoAvaliado: string;
  lPalavrasPesquisadas: TStringList;
begin
  Accept := true;
  lPalavrasPesquisadas := TStringList.Create();

     try
      lTextoPesquisado := AnsiReplaceStr(UpperCase(edtPesquisa.Text), ' ', ',');
      lTextoPesquisado := AnsiReplaceStr(lTextoPesquisado, '�', 'A');
      lTextoPesquisado := AnsiReplaceStr(lTextoPesquisado, '�', 'O');

      lPalavrasPesquisadas.Delimiter := ',';
      lPalavrasPesquisadas.DelimitedText := lTextoPesquisado;

      lTextoAvaliado := DataSet.Fields.FieldByName('TITULO').AsString;
      lTextoAvaliado := lTextoAvaliado + ' ' + DataSet.Fields.FieldByName('COD_BARRAS').AsString;
      lTextoAvaliado := lTextoAvaliado + ' ' + DataSet.Fields.FieldByName('GENERO').AsString;
      lTextoAvaliado := UpperCase(lTextoAvaliado);
      lTextoAvaliado := AnsiReplaceStr(lTextoAvaliado, '�', 'A');
      lTextoAvaliado := AnsiReplaceStr(lTextoAvaliado, '�', 'O');

    for i := 0 to lPalavrasPesquisadas.Count - 1 do
    begin
      lPalavra := lPalavrasPesquisadas[i];

      if (Trim(lPalavra) = '') then
        Continue;

      Accept := (AnsiContainsText(lTextoAvaliado, lPalavra));

      if (not Accept) then
        Break;
    end;
  finally
    FreeAndNil(lPalavrasPesquisadas);
     end;
end;

end.
