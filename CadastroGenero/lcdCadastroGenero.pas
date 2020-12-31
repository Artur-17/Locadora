unit lcdCadastroGenero;

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
  dxSkinXmas2008Blue, StdCtrls, cxButtons, ExtCtrls,

  Uni;

type
  TCadastroGenero = class(TForm)
    pnlTop: TPanel;
    lblGenero: TLabel;
    edtGenero: TEdit;
    lblIdadeMinima: TLabel;
    edtIdadeMinima: TEdit;
    btnSalvar: TcxButton;
    btnCancelar: TcxButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FModo : string;
    FDataset: TUniQuery;

    function Validar(): Boolean;
    procedure Salvar();

    procedure Inserir;
    procedure Atualizar;

    function GetDataset: TUniQuery;
    procedure SetDataset(const Value: TUniQuery);

    procedure PreencherCamposForm;
  public
    { Public declarations }
    class function Cadastrar(): Boolean;
    class function Editar(ADataset: TUniQuery): Boolean;


    property Dataset: TUniQuery read GetDataset write SetDataset;
  end;

var
  CadastroGenero: TCadastroGenero;

implementation

uses
  lcdDataModule, DB;

{$R *.dfm}

class function TCadastroGenero.Cadastrar: Boolean;
var
  lCadastroGenero: TCadastroGenero;
begin
  lCadastroGenero := TCadastroGenero.Create(nil);

  try
    lCadastroGenero.FModo := 'novo';
    Result := (lCadastroGenero.ShowModal() = mrOk);
  finally
    FreeAndNil(lCadastroGenero);
  end;
end;

class function TCadastroGenero.Editar(ADataset: TUniQuery): Boolean;
var
  lCadastroGenero: TCadastroGenero;
begin
  lCadastroGenero := TCadastroGenero.Create(nil);

  try
    lCadastroGenero.Dataset := ADataset;
    lCadastroGenero.FModo := 'alterar';
    Result := (lCadastroGenero.ShowModal() = mrOk);
  finally
    FreeAndNil(lCadastroGenero);
  end;
end;

procedure TCadastroGenero.FormShow(Sender: TObject);
begin
  PreencherCamposForm();
end;

procedure TCadastroGenero.PreencherCamposForm();
begin
  if not Assigned(FDataset) then
    Exit;

  edtGenero.Text := FDataset.FieldByName('NOME').AsString;
  edtIdadeMinima.Text := FDataset.FieldByName('IDADE_MINIMA').AsString;

end;


function TCadastroGenero.GetDataset: TUniQuery;
begin
  Result := FDataSet;
end;

procedure TCadastroGenero.Atualizar;
begin
  try

    FDataset.Edit();
    FDataset.FieldByName('NOME').AsString := edtGenero.Text;
    FDataset.FieldByName('IDADE_MINIMA').AsString := edtIdadeMinima.Text;
    FDataset.FieldByName('DT_CADASTRO').AsDateTime := now;

    FDataset.Post();

    ModalResult := mrOk;

  except
    if (FDataset.State = dsEdit) then
      FDataset.Cancel;

  end;

end;

procedure TCadastroGenero.Inserir;
var
  lQuery : TUniQuery;
begin
  lQuery := TUniQuery.Create(nil);
  lQuery.Connection := dtmPrincipal.conexao;

  try
    lQuery.SQL.Add('INSERT INTO GENERO');
    lQuery.SQL.Add('(NOME, IDADE_MINIMA, DT_CADASTRO)');
    lQuery.SQL.Add('VALUES(:NOME, :IDADE_MINIMA, :DT_CADASTRO)');

    lQuery.Prepare;

    lQuery.ParamByName('NOME').AsString := edtGenero.Text;
    lQuery.ParamByName('IDADE_MINIMA').AsInteger := StrToIntDef(edtIdadeMinima.Text, 0);
    lQuery.ParamByName('DT_CADASTRO').AsDateTime := now;

    lQuery.ExecSQL();

    ModalResult := mrOk;

  except
    On E: Exception do
      showmessage(E.Message);
  end;

  FreeAndNil(lQuery);

end;

procedure TCadastroGenero.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrClose;
end;

procedure TCadastroGenero.btnSalvarClick(Sender: TObject);
begin
  Salvar();

end;

procedure TCadastroGenero.Salvar();

begin
  if (not Validar()) then
    Exit;

  if FModo = 'alterar' then
    Atualizar()
  else
    Inserir();
end;


procedure TCadastroGenero.SetDataset(const Value: TUniQuery);
begin
  FDataset := Value;
end;

function TCadastroGenero.Validar: Boolean;
begin
  if (Length(Trim(edtGenero.Text)) < 2) then
  begin
    ShowMessage('O nome do g�nero deve ter, pelo menos, 2 d�gitos.');
    edtGenero.SetFocus();
    abort;
  end;

  if (StrToIntDef(edtIdadeMinima.Text, -1) < 0) then
  begin
    ShowMessage('A idade m�nima deve ser 0, caso n�o tenha restri��o por idade.');
    edtIdadeMinima.SetFocus();
    abort;
  end;
end;


end.
