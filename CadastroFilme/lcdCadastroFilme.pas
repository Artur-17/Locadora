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
  dxSkinXmas2008Blue, cxButtons, Mask, dxGDIPlusClasses, Uni, DB, MemDS,
  DBAccess, lcdDataModule, cxControls, cxContainer, cxEdit, ComCtrls, dxCore,
  cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxCurrencyEdit;

type
  TCadastroFilme = class(TForm)
    pnlTop: TPanel;
    edtTitulo: TEdit;
    lblTitulo: TLabel;
    lblNomeDiretor: TLabel;
    edtNomeDiretor: TEdit;
    edtNomeEstudio: TEdit;
    lblNomeEstudio: TLabel;
    lblGenero: TLabel;
    mmoSinopse: TMemo;
    lblSinopse: TLabel;
    lblValor: TLabel;
    lblQuantidade: TLabel;
    edtEstoque: TEdit;
    btnGravar: TcxButton;
    btnCancelar: TcxButton;
    imgFoto: TImage;
    edtLancamento: TcxDateEdit;
    lblDataLancamento: TLabel;
    edtValor: TcxCurrencyEdit;
    dlgOpenFoto: TOpenDialog;
    edtGenero: TEdit;
    btnSelecionarCategoriaGenero: TcxButton;
    btnFoto: TcxButton;
    Shape1: TShape;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnGravarClick(Sender: TObject);
//    procedure btnNumCodBarrasClick(Sender: TObject);
    procedure btnGravarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFotoClick(Sender: TObject);
    procedure btnSelecionarCategoriaGeneroClick(Sender: TObject);
  private
    { Private declarations }
    FDataSet: TDataSet;
//    FDataSetEstoque: TDataSet;
//    FDataSetGenero: TDataSet;
//    FIDCliente: integer;
    FGeneroId: Integer;
//    FIDEstoque: Integer;
    FModo: TDataSetState;


    procedure PreencherDados;
    procedure GravarDadosFilme();
    class function Novo(pOwner: TForm; pDataSet: TDataset;
      pIDFilme: integer): TmodalResult; static;
    procedure SetModo(const Value: TDataSetState);
  public
    { Public declarations }
    class procedure Exibir();

    class function CadastrarOuAlterar(pOwner: TForm; pDataSet: TDataset;
      pState: TDataSetState): TmodalResult;

    property Modo : TDataSetState read FModo write SetModo;

  end;

var
  CadastroFilme: TCadastroFilme;

implementation

uses
  jpeg, pngimage, StrUtils, lcdGeneroSelecao, lcdSistemaController;

{$R *.dfm}



procedure TCadastroFilme.PreencherDados;
var
  lQry : TUniQuery;
  lStrem : TBlobStream;
begin
  lQry := TUniQuery.Create(self);
  lQry.Connection := dtmPrincipal.conexao;

  try
    lQry.SQL.Add('SELECT * FROM GENERO WHERE ID = :GENERO_ID' );
    lQry.Prepare();

    lQry.ParamByName('genero_id').AsInteger := FDataSet.FieldByName('GENERO_ID').AsInteger;
    lQry.Open();

    (lQry.FieldByName('ID') as TIntegerField).DisplayFormat := '00000';

     edtGenero.Text := Format('%s - %s', [
          lQry.Fields.FieldByName('id').DisplayText,
          lQry.Fields.FieldByName('nome').DisplayText
        ]);

    edtTitulo.Text := FDataSet.FieldByName('TITULO').AsString;
    edtNomeDiretor.Text := FDataSet.FieldByName('NM_DIRETOR').AsString;
    edtNomeEstudio.Text := FDataSet.FieldByName('NM_ESTUDIO').AsString;
    edtValor.Text := FDataSet.FieldByName('VALOR').AsString;
    edtEstoque.Text := FDataSet.FieldByName('ESTOQUE').AsString;
    mmoSinopse.lines.text := FDataSet.FieldByName('SINOPSE').AsString;

    if not (FDataSet.FieldByName('FOTO').IsNull) and (FDataSet.FieldByName('FOTO').IsBlob) then
    begin
      lStrem := TBlobStream.Create(TBlobField(FDataSet.FieldByName('FOTO')),bmRead);
      imgFoto.Picture.Graphic.LoadFromStream(lStrem);
    end;
  except
    on E: Exception do
      ShowMessage( E.Message );
  End;

  FreeAndNil(lQry);
  FreeAndNil(lStrem);
end;

procedure TCadastroFilme.SetModo(const Value: TDataSetState);
begin
  FModo := Value;
end;

procedure TCadastroFilme.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;


procedure TCadastroFilme.btnFotoClick(Sender: TObject);
var
  lFoto: TGraphic;
  lExtensao: string;
begin
   if (dlgOpenFoto.Execute(Application.Handle)) then
  begin
    lExtensao := ExtractFileExt(dlgOpenFoto.FileName);

    if ((not AnsiSameText(lExtensao, '.jpg')) and (not AnsiSameText(lExtensao, '.png'))) then
    begin
      ShowMessage('A foto selecionada n�o � compat�vel. Selecione uma foto .jpg ou .png.');
      Abort;
    end;

    if (AnsiSameText(lExtensao, '.jpg')) then
      lFoto := TJPEGImage.Create();

    if (AnsiSameText(lExtensao, '.png')) then
      lFoto := TPngImage.Create();

    lFoto.LoadFromFile(dlgOpenFoto.FileName);
    imgFoto.Picture.Bitmap.Assign(lFoto);

    FreeAndNil(lFoto);
  end;
end;

procedure TCadastroFilme.btnGravarClick(Sender: TObject);
begin
  GravarDadosFilme();
end;

procedure TCadastroFilme.btnGravarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  lcadastro : TCadastroFilme;
begin
  if (Key = VK_F10) then
  begin
    GravarDadosFilme();
  end;


end;

//procedure TCadastroFilme.btnNumCodBarrasClick(Sender: TObject);
//var
//  NumCodBarras : integer;
//begin
//  qryFilme.Close;
//  qryFilme.Fields.Clear;
//
//
//  qryFilme.SQL.Add('SELECT GEN_ID( COD_BARRAS_SEQUENCIAL, 1 ) FROM RDB$DATABASE;');
//  qryFilme.Prepare();
//  qryFilme.ExecSQL;
//  qryFilme.Open();
//
//
//  edtCodBarras.Text := IntToStr(NumCodBarras);
//end;

procedure TCadastroFilme.btnSelecionarCategoriaGeneroClick(Sender: TObject);
var
  lQryGenero : TUniQuery;
begin
  FGeneroId := TGeneroSelecao.Selecionar();

  if FGeneroId > 0 then
  begin
    lQryGenero := TUniQuery.Create(nil);

    try
      lQryGenero.Connection := dtmPrincipal.conexao;

      lQryGenero.SQL.Add('SELECT ID, NOME FROM GENERO WHERE ID = :ID');
      lQryGenero.Prepare();
      lQryGenero.ParamByName('ID').AsInteger := FGeneroId;

      lQryGenero.Open();

      (lQryGenero.FieldByName('ID') as TIntegerField).DisplayFormat := '00000';

      edtGenero.Text := Format('%s - %s', [
          lQryGenero.Fields.FieldByName('id').DisplayText,
          lQryGenero.Fields.FieldByName('nome').DisplayText
        ]);



    finally
       if lQryGenero.Active then
          lQryGenero.Close();

        FreeAndNil(lQryGenero);
    end;
  end
  else
    begin
      edtGenero.Clear();
    end;





end;

class procedure TCadastroFilme.Exibir;
var
  lCadastroFilme: TCadastroFilme;
begin
  lCadastroFilme := TCadastroFilme.Create(nil);
  lCadastroFilme.ShowModal;
  FreeAndNil(lCadastroFilme);

end;

class function TCadastroFilme.CadastrarOuAlterar(pOwner: TForm; pDataSet: TDataset; pState : TDataSetState): TmodalResult;
var
  lCadastroFilme : TCadastroFilme;
begin
  lCadastroFilme := TCadastroFilme.Create(pOwner);
  try
    lCadastroFilme.FDataSet := pDataSet;
    lCadastroFilme.Modo := pstate;

    if pState = dsEdit then
      lCadastroFilme.PreencherDados;

    Result := (lCadastroFilme.ShowModal)
  finally
    FreeAndNil(lCadastroFilme);
  end;
end;

procedure TCadastroFilme.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
    ModalResult := mrCancel;
end;


procedure TCadastroFilme.GravarDadosFilme;
var
  lValorEmprestimoDia: string;
  lStream: TStringStream;
  lQry : TUniQuery;
  lTrs : TUniTransaction;
begin
  lQry := TUniQuery.Create(self);
  lTrs := TUniTransaction.Create(self);

  lQry.Transaction := lTrs;

  lQry.Connection := dtmPrincipal.conexao;
  lTrs.DefaultConnection := lQry.Connection;

  lTrs.StartTransaction;

  try
    lQry.SQL.Add(' UPDATE OR INSERT INTO FILME (ID, TITULO, DT_LANCAMENTO, NM_DIRETOR, NM_ESTUDIO, VALOR, GENERO_ID,FOTO, SINOPSE) ');
    lQry.SQL.Add(' VALUES ( :ID, :TITULO, :DT_LANCAMENTO, :NM_DIRETOR, :NM_ESTUDIO, :VALOR, :GENERO_ID,:FOTO, :SINOPSE )');
    lQry.SQL.Add(' MATCHING (ID)');

    if not lQry.Prepared then
      lQry.Prepare;

    if FDataSet.FieldByName('ID').AsInteger > 0 then
      lQry.ParamByName('ID').AsInteger := FDataSet.FieldByName('ID').AsInteger
    else
      lQry.ParamByName('ID').AsInteger := 0;

    lQry.ParamByName('Sinopse').AsMemo := mmoSinopse.Lines.Text;

    FreeAndNil(lStream);
    lStream := TStringStream.Create();
    imgFoto.Picture.Graphic.SaveToStream(lStream);

    lQry.ParamByName('FOTO').LoadFromStream(lStream,ftBlob);


    lQry.ParamByName('TITULO').AsString := edtTitulo.Text;
    lQry.ParamByName('DT_LANCAMENTO').AsDateTime := edtLancamento.Date;
    lQry.ParamByName('NM_DIRETOR').AsString := edtNomeDiretor.Text;
    lQry.ParamByName('NM_ESTUDIO').AsString := edtNomeEstudio.Text;
    lQry.ParamByName('VALOR').AsFloat := edtValor.Value;
    lQry.ParamByName('GENERO_ID').AsInteger := FGeneroID;

    lQry.ExecSQL;



    lQry.SQL.Clear;

    if FModo = dsInsert  then
      begin
        lQry.SQL.Add('INSERT INTO ESTOQUE ( FILME_ID, ESTOQUE, DATA, USUARIO_ID)');
        lQry.SQL.Add('VALUES ( :FILME_ID, :ESTOQUE, :DATA, :USUARIO_ID)');
      end
    else
      begin
        lQry.SQL.Add('UPDATE ESTOQUE E SET E.ESTOQUE = :ESTOQUE , E.USUARIO_ID = :USUARIO_ID WHERE FILME_ID = :FILME_ID');
      end;

    if not lQry.Prepared then
      lQry.Prepare;

    lQry.ParamByName('FILME_ID').AsInteger := FDataSet.FieldByName('ID').AsInteger;
    lQry.ParamByName('ESTOQUE').AsInteger := StrToIntDef(edtEstoque.Text, 0);
    lQry.ParamByName('USUARIO_ID').AsInteger := AcessoController.UsuarioLogado.Id;

    lQry.ExecSQL;

    lTrs.Commit();
    ModalResult := mrOk;

  except
     on E: Exception do
    begin
      lTrs.Rollback();
      ShowMessage('Erro ao gravar os dados.'#13'Detalhes: ' + E.Message);
    end;
  end;

  if Assigned(lStream) then
    FreeAndNil(lStream);
end;

class function TCadastroFilme.Novo(pOwner: TForm; pDataSet: TDataset;
  pIDFilme: integer): TmodalResult;
begin

end;

end.
