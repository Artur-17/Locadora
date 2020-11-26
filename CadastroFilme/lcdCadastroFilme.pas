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
    edtCodBarras: TEdit;
    lblCodBarras: TLabel;
    edtTitulo: TEdit;
    lblTitulo: TLabel;
    lblNomeDiretor: TLabel;
    edtNomeDiretor: TEdit;
    edtNomeEstudio: TEdit;
    lblNomeEstudio: TLabel;
    lblGenero: TLabel;
    cbbGenero: TComboBox;
    mmSinopse: TMemo;
    lblSinopse: TLabel;
    lblValor: TLabel;
    lblQuantidade: TLabel;
    edtQuantidade: TEdit;
    btnGravar: TcxButton;
    btnCancelar: TcxButton;
    imgProduto: TImage;
    btnFoto: TcxButton;
    qryFilme: TUniQuery;
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
    dtpDataLancamento: TcxDateEdit;
    lblDataLancamento: TLabel;
    edtValor: TEdit;
    Label1: TLabel;
    btnNumCodBarras: TcxButton;
    qryFilmeCOD_BARRAS: TStringField;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnGravarClick(Sender: TObject);
    procedure btnNumCodBarrasClick(Sender: TObject);
    procedure btnGravarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FModo : string;
    FDataSet: TDataSet;
    FIDCliente: integer;
    procedure PreencherDados;
    procedure GravarDadosFilme();
  public
    { Public declarations }
    class procedure Exibir();

    class function Novo(pOwner: TForm; pDataSet: TDataset;  pIDCliente: integer): TmodalResult;
    class function Alterar(pOwner: TForm; pDataSet: TDataset;  pIDCliente: integer): TmodalResult;
  end;

var
  CadastroFilme: TCadastroFilme;

implementation

{$R *.dfm}

class function TCadastroFilme.Alterar(pOwner: TForm; pDataSet: TDataset;
  pIDCliente: integer): TmodalResult;
var
  lCadastroFilme : TCadastroFilme;
begin
  lCadastroFilme := TCadastroFilme.Create(pOwner);
  try
    lCadastroFilme.FDataSet := pDataSet;
    lCadastroFilme.PreencherDados;
    lCadastroFilme.FIDCliente := pIDCliente;
    lCadastroFilme.FModo := 'alterar';

    Result := lCadastroFilme.ShowModal
  finally
    FreeAndNil(lCadastroFilme);
  end;
end;

procedure TCadastroFilme.PreencherDados;
begin
  Try
    edtTitulo.Text := FDataSet.FieldByName('TITULO').AsString;
    edtCodBarras.Text := FDataSet.FieldByName('COD_BARRAS').AsString;
    edtNomeDiretor.Text := FDataSet.FieldByName('NM_DIRETOR').AsString;
    edtNomeEstudio.Text := FDataSet.FieldByName('NM_ESTUDIO').AsString;
    cbbGenero.Text := FDataSet.FieldByName('GENERO').AsString;
    edtValor.Text := FDataSet.FieldByName('VALOR').AsString;
    edtQuantidade.Text := FDataSet.FieldByName('QUANTIDADE').AsString;
    mmSinopse.Text := FDataSet.FieldByName('SINOPSE').AsString;
    cbbGenero.Text := FDataSet.FieldByName('GENERO').AsString;


  except
    on E: Exception do
      ShowMessage( E.Message );
  End;


end;

procedure TCadastroFilme.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
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

procedure TCadastroFilme.btnNumCodBarrasClick(Sender: TObject);
var
  NumCodBarras : integer;
begin
  qryFilme.Close;
  qryFilme.Fields.Clear;


  NumCodBarras := qryFilme.SQL.Add('SELECT GEN_ID( COD_BARRAS_SEQUENCIAL, 1 ) FROM RDB$DATABASE;');

  edtCodBarras.Text := IntToStr(NumCodBarras);
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

procedure TCadastroFilme.GravarDadosFilme;
var
  Titulo: String;
begin
  Titulo := UpperCase(edtTitulo.Text);


   try
    qryFilme.Close;
    qryFilme.SQL.Clear;

       if FModo = 'novo' then
       begin
         qryFilme.SQL.Add('INSERT INTO FILME');
         qryFilme.SQL.Add('(TITULO, SINOPSE, DT_LANCAMENTO, NM_DIRETOR, NM_ESTUDIO, GENERO, VALOR, QUANTIDADE, COD_BARRAS)');
         qryFilme.SQL.Add('values ( :TITULO, :SINOPSE, :DT_LANCAMENTO, :NM_DIRETOR, :NM_ESTUDIO, :GENERO, :VALOR, :QUANTIDADE, :COD_BARRAS)')
       end
       else
       begin
        qryFilme.SQL.Add('UPDATE OR INSERT INTO FILME');
        qryFilme.SQL.Add('(ID, TITULO, SINOPSE, DT_LANCAMENTO, NM_DIRETOR, NM_ESTUDIO, GENERO, VALOR, QUANTIDADE, COD_BARRAS)');
        qryFilme.SQL.Add('values (:ID, :TITULO, :SINOPSE, :DT_LANCAMENTO, :NM_DIRETOR, :NM_ESTUDIO, :GENERO, :VALOR, :QUANTIDADE, :COD_BARRAS)');
        qryFilme.SQL.Add('MATCHING (ID);');

        qryFilme.ParamByName('ID').AsInteger := FIDCliente;
       end;


      qryFilme.ParamByName('TITULO').AsString := Titulo;
      qryFilme.ParamByName('SINOPSE').AsString := mmSinopse.Text;
      qryFilme.ParamByName('DT_LANCAMENTO').AsDate := dtpDataLancamento.Date;
      qryFilme.ParamByName('NM_DIRETOR').AsString := edtNomeDiretor.Text;
      qryFilme.ParamByName('NM_ESTUDIO').AsString := edtNomeEstudio.Text;
      qryFilme.ParamByName('GENERO').AsString := cbbGenero.Text;
      qryFilme.ParamByName('VALOR').AsString := edtValor.Text;
      qryFilme.ParamByName('QUANTIDADE').AsString := edtQuantidade.Text;
      qryFilme.ParamByName('COD_BARRAS').AsString := edtCodBarras.Text;


      qryFilme.ExecSQL;

      if FModo = 'novo' then
      begin
         ShowMessage('Os dados foram inseridos com sucesso');
      end
      else
        ShowMessage('Os dados foram alterados com sucesso');

      ModalResult := mrOk;


  except
    on E: Exception do

    ShowMessage( E.Message )
  end;

end;

end.
