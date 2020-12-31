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
    qryFilme: TUniQuery;
    qryFilmeID: TIntegerField;
    qryFilmeTITULO: TStringField;
    qryFilmeDT_LANCAMENTO: TDateField;
    qryFilmeNM_DIRETOR: TStringField;
    qryFilmeNM_ESTUDIO: TStringField;
    qryFilmeVALOR: TFloatField;
    edtLancamento: TcxDateEdit;
    lblDataLancamento: TLabel;
    edtValor: TcxCurrencyEdit;
    dlgOpenFoto: TOpenDialog;
    edtGenero: TEdit;
    btnSelecionarCategoriaGenero: TcxButton;
    btnFoto: TcxButton;
    qryFilmeGENERO_ID: TIntegerField;
    qryFilmeFOTO: TBlobField;
    qryFilmeSINOPSE: TBlobField;
    qryEstoque: TUniQuery;
    qryEstoqueID: TIntegerField;
    qryEstoqueFILME_ID: TIntegerField;
    qryEstoqueESTOQUE: TIntegerField;
    qryEstoqueDATA: TDateTimeField;
    qryEstoqueUSUARIO_ID: TIntegerField;
    Shape1: TShape;
    trsCadastro: TUniTransaction;
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
    FModo : string;
    FFilmeId: Integer;
    FDataSet: TDataSet;
    FDataSetEstoque: TDataSet;
    FDataSetGenero: TDataSet;
    FIDCliente: integer;
    FGeneroId: Integer;
    FIDEstoque: Integer;


    procedure PreencherDados;
    procedure GravarDadosFilme();
    function GetFilmeId: Integer;
    procedure SetFilmeId(const Value: Integer);
  public
    { Public declarations }
    class procedure Exibir();

    class function Novo(pOwner: TForm; pDataSet: TDataset;  pIDCliente: integer): TmodalResult;
    class function Alterar(pOwner: TForm; pDataSet: TDataset;  pIDCliente: integer; pDataSetEstoque: TDataSet; pIDEstoque:integer; pDataSetGenero: TDataSet): TmodalResult;

    property FilmeId: Integer read GetFilmeId write SetFilmeId;
  end;

var
  CadastroFilme: TCadastroFilme;

implementation

uses
  jpeg, pngimage, StrUtils, lcdGeneroSelecao, lcdSistemaController;

{$R *.dfm}



class function TCadastroFilme.Alterar(pOwner: TForm; pDataSet: TDataset;
  pIDCliente: integer; pDataSetEstoque: TDataSet; pIDEstoque: integer; pDataSetGenero: TDataSet): TmodalResult;
var
  lCadastroFilme : TCadastroFilme;
begin
  lCadastroFilme := TCadastroFilme.Create(pOwner);
  try
    lCadastroFilme.FDataSet := pDataSet;
    lCadastroFilme.FDataSetEstoque := pDataSetEstoque;
    lCadastroFilme.FDataSetGenero := pDataSetGenero;
    lCadastroFilme.PreencherDados;
    lCadastroFilme.FIDCliente := pIDCliente;
    lCadastroFilme.FIDEstoque := pIDEstoque;
    lCadastroFilme.FModo := 'alterar';

    Result := lCadastroFilme.ShowModal
  finally
    FreeAndNil(lCadastroFilme);
  end;
end;

procedure TCadastroFilme.PreencherDados;
begin
  Try
    ShowMessage(FDataSetEstoque.FieldByName('FILME_ID').AsString);
    ShowMessage(FDataSetEstoque.FieldByName('ESTOQUE').AsString);
    ShowMessage(FDataSet.FieldByName('TITULO').AsString);

    edtTitulo.Text := FDataSet.FieldByName('TITULO').AsString;
    edtNomeDiretor.Text := FDataSet.FieldByName('NM_DIRETOR').AsString;
    edtNomeEstudio.Text := FDataSet.FieldByName('NM_ESTUDIO').AsString;
    edtValor.Text := FDataSet.FieldByName('VALOR').AsString;
    edtEstoque.Text := FDataSetEstoque.FieldByName('ESTOQUE').AsString;
//    edtGenero.Text :=
    mmoSinopse.Text := FDataSet.FieldByName('SINOPSE').AsString;


  except
    on E: Exception do
      ShowMessage( E.Message );
  End;


end;

procedure TCadastroFilme.SetFilmeId(const Value: Integer);
begin
  FFilmeId := Value;
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

class function TCadastroFilme.Novo(pOwner :TForm; pDataSet :TDataset; pIDCliente: integer) : TmodalResult;
var
  lcadastro : TCadastroFilme;
begin
   lcadastro := TCadastroFilme.Create(nil);
   lcadastro.FModo := 'novo';
   lcadastro.ShowModal();
   FreeAndNil(lcadastro);
end;

procedure TCadastroFilme.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
    ModalResult := mrCancel;
end;

function TCadastroFilme.GetFilmeId: Integer;
begin
   Result := FFilmeId;
end;

procedure TCadastroFilme.GravarDadosFilme;
var
  lValorEmprestimoDia: string;
  lSinopseStream: TStringStream;
begin
//  Titulo := UpperCase(edtTitulo.Text);
//  Valor := edtValor.value;


//   try
   //FILME ERA GRAVADO DESSA MANEIRA, PRECISEI ALTERAR PARA SALVAR NA TABELA DE ESTOQUE TAMB�M
//    qryFilme.Close;
//    qryFilme.SQL.Clear;
//
//       if FModo = 'novo' then
//       begin
//         qryFilme.SQL.Add('INSERT INTO FILME');
//         qryFilme.SQL.Add('(TITULO, SINOPSE, DT_LANCAMENTO, NM_DIRETOR, NM_ESTUDIO, GENERO_ID, VALOR, QUANTIDADE, COD_BARRAS)');
//         qryFilme.SQL.Add('values ( :TITULO, :SINOPSE, :DT_LANCAMENTO, :NM_DIRETOR, :NM_ESTUDIO, :GENERO_ID, :VALOR, :QUANTIDADE, :COD_BARRAS)')
//       end
//       else
//       begin
//        qryFilme.SQL.Add('UPDATE OR INSERT INTO FILME');
//        qryFilme.SQL.Add('(ID, TITULO, SINOPSE, DT_LANCAMENTO, NM_DIRETOR, NM_ESTUDIO, GENERO_ID, VALOR, QUANTIDADE, COD_BARRAS)');
//        qryFilme.SQL.Add('values (:ID, :TITULO, :SINOPSE, :DT_LANCAMENTO, :NM_DIRETOR, :NM_ESTUDIO, :GENERO_ID, :VALOR, :QUANTIDADE, :COD_BARRAS)');
//        qryFilme.SQL.Add('MATCHING (ID);');
//
//        qryFilme.ParamByName('ID').AsInteger := FIDCliente;
//       end;
//
//
//      qryFilme.ParamByName('TITULO').AsString := Titulo;
//      qryFilme.ParamByName('SINOPSE').AsString := mmSinopse.Text;

//    qryFilme.ParamByName('DT_LANCAMENTO').AsDate := dtpDataLancamento.Date;
//      qryFilme.ParamByName('NM_DIRETOR').AsString := edtNomeDiretor.Text;
//      qryFilme.ParamByName('NM_ESTUDIO').AsString := edtNomeEstudio.Text;
//      qryFilme.ParamByName('GENERO_ID').AsInteger := FGeneroId;
//      qryFilme.ParamByName('VALOR').AsFloat := Valor;
//      qryFilme.ParamByName('QUANTIDADE').AsString := edtQuantidade.Text;
//      qryFilme.ParamByName('COD_BARRAS').AsString := edtCodBarras.Text;
//
//
//      qryFilme.ExecSQL;
//
//      if FModo = 'novo' then
//      begin
//         ShowMessage('Os dados foram inseridos com sucesso');
//      end
//      else
//        ShowMessage('Os dados foram alterados com sucesso');
//
//      ModalResult := mrOk;

//
//  except
//    on E: Exception do
//
//    ShowMessage( E.Message )
//  end;

    trsCadastro.StartTransaction();
  try
    if not qryFilme.Prepared then
      qryFilme.Prepare();

    qryFilme.ParamByName('ID').AsInteger := FFilmeId;
    qryFilme.Open();

     if qryFilme.IsEmpty then
      qryFilme.Append()
    else
      qryFilme.Edit();

    qryFilmeTITULO.Value := edtTitulo.Text;

    lSinopseStream := TStringStream.Create();
    mmoSinopse.Lines.SaveToStream(lSinopseStream, TEncoding.UTF8);
    lSinopseStream.Position := 0;

    qryFilmeSINOPSE.LoadFromStream(lSinopseStream);
    qryFilmeFOTO.Assign(imgFoto.Picture.Bitmap);

    qryFilmeDT_LANCAMENTO.Value := edtLancamento.Date;
    qryFilmeNM_DIRETOR.Value := edtNomeDiretor.Text;
    qryFilmeNM_ESTUDIO.Value := edtNomeEstudio.Text;

    lValorEmprestimoDia := AnsiReplaceStr(edtValor.Text, ' ', '0');
    lValorEmprestimoDia := Trim(lValorEmprestimoDia);
    qryFilmeVALOR.Value := StrToFloatDef(lValorEmprestimoDia, 0);
    qryFilmeGENERO_ID.Value := FGeneroId;

    qryFilme.Post();

    if not qryEstoque.Prepared then
      qryEstoque.Prepare();

    qryEstoque.ParamByName('filme_id').AsInteger := 0;
    qryEstoque.Open();
    qryEstoque.Append();
    qryEstoqueFILME_ID.Value := qryFilmeID.Value;
    qryEstoqueESTOQUE.Value := StrToIntDef(edtEstoque.Text, 0);
    qryEstoqueDATA.Value := Now;
    qryEstoqueUSUARIO_ID.AsInteger := AcessoController.UsuarioLogado.Id;
    qryEstoque.Post();

    trsCadastro.Commit();
    ModalResult := mrOk;

  except
     on E: Exception do
    begin
      trsCadastro.Rollback();
      ShowMessage('Erro ao gravar os dados.'#13'Detalhes: ' + E.Message);
    end;
  end;

  if Assigned(lSinopseStream) then
    FreeAndNil(lSinopseStream);

end;

end.
