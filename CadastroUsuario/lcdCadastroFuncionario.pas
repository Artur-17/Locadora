unit lcdCadastroFuncionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinXmas2008Blue, dxBarBuiltInMenu, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons, ComCtrls, Mask, dxGDIPlusClasses,
  cxPC, Buttons, lcdDataModule, DB, MemDS, DBAccess, Uni, cxContainer, cxEdit,
  dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, lcdLocalizarCategoriaUsuario;

type
  TCadastroFuncionario = class(TForm)
    pnlTop: TPanel;
    lblNome: TLabel;
    edtNome: TEdit;
    pgCadastro: TcxPageControl;
    Funcionário: TcxTabSheet;
    imgFoto: TImage;
    edtCpf: TMaskEdit;
    lblCPF: TLabel;
    edtEmail: TEdit;
    lblEmail: TLabel;
    lblTelefone: TLabel;
    edtTelefone: TEdit;
    edtEndereco: TEdit;
    lblEndereco: TLabel;
    edtBairro: TEdit;
    lblBairro: TLabel;
    edtCidade: TEdit;
    lblCidade: TLabel;
    edtComplemento: TEdit;
    lblComplemento: TLabel;
    cbxEstado: TComboBox;
    edtEstado: TLabel;
    lblDataNascimento: TLabel;
    mmObservacao: TMemo;
    lblObservacao: TLabel;
    btnGravar: TcxButton;
    btnCancelar: TcxButton;
    btnFoto: TcxButton;
    usuario: TcxTabSheet;
    btnGravarUsuario: TcxButton;
    lblLogin: TLabel;
    edtLogin: TEdit;
    Image1: TImage;
    lblSenha: TLabel;
    lblConfirmarSenha: TLabel;
    btnFechar: TcxButton;
    edtCodigoCategoria: TEdit;
    edtNomeCategoria: TEdit;
    btnLocalizarCategoria: TSpeedButton;
    qryFuncionario: TUniQuery;
    qryFuncionarioID: TIntegerField;
    qryFuncionarioNOME: TStringField;
    qryFuncionarioCPF: TStringField;
    qryFuncionarioEMAIL: TStringField;
    qryFuncionarioTELEFONE: TStringField;
    qryFuncionarioDT_NASCIMENTO: TDateField;
    dtpDataNascimento: TcxDateEdit;
    edtSenha: TMaskEdit;
    edtConfirmarSenha: TMaskEdit;
    qryUsuario: TUniQuery;
    qryUsuarioID: TIntegerField;
    qryUsuarioLOGIN: TStringField;
    qryUsuarioSENHA: TStringField;
    lblCategoria: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGravarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnGravarUsuarioClick(Sender: TObject);
    procedure btnLocalizarCategoriaClick(Sender: TObject);
  private
    { Private declarations }
    procedure gravarDadosFuncionario();
    procedure carregarEstados();
    procedure validarDados();
    procedure validarCamposObgUsuario();
    procedure gravarDadosUsuario();

  public
    { Public declarations }
    class procedure exibirCadastroFuncionario();
    class function ConverterData(pDateTime: TDateTime) : String;
    function logarUsuario(aUsuario, aSenha: String): Boolean;
  end;

var
  CadastroFuncionario: TCadastroFuncionario;
  CategoriaUsuario : TLocalizarCategoriaUsuario;

implementation

{$R *.dfm}

uses
  FuncaoCriptografia;

procedure TCadastroFuncionario.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TCadastroFuncionario.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TCadastroFuncionario.btnGravarClick(Sender: TObject);
begin
  gravarDadosFuncionario();
end;

procedure TCadastroFuncionario.btnGravarUsuarioClick(Sender: TObject);
begin

  validarCamposObgUsuario();
  
  gravarDadosUsuario();
end;

procedure TCadastroFuncionario.btnLocalizarCategoriaClick(Sender: TObject);
begin
  TLocalizarCategoriaUsuario.exibirCategoriaUsuario();
end;

procedure TCadastroFuncionario.carregarEstados;
var
  lQry: TUniQuery;
begin
  cbxEstado.ItemIndex := -1;
  cbxEstado.Text := 'RJ';
  cbxEstado.Items.Clear;
  lQry := TUniQuery.Create(nil);

  lQry.Connection := dtmPrincipal.conexao;

  lQry.SQL.Add('select * from estados');

  try
    lQry.Open();
    lQry.First;

    while not lQry.Eof do
    begin
      cbxEstado.Items.Add( lQry.FieldByName('SIGLA').AsString );
      lQry.Next;
    end;

  finally
    if Assigned(lQry) then
      FreeAndNil(lQry);
  end;

end;

class function TCadastroFuncionario.ConverterData(pDateTime: TDateTime): String;
begin
  result := FormatDateTime('dd.mm.yyyy',pDateTime);
end;

class procedure TCadastroFuncionario.exibirCadastroFuncionario;
var
  lcadastro : TCadastroFuncionario;
begin
  lcadastro := TCadastroFuncionario.Create(nil);
  lcadastro.ShowModal();
  FreeAndNil(lcadastro);
end;

procedure TCadastroFuncionario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if qryFuncionario.Active then
    qryFuncionario.Close;

  if qryUsuario.Active then
    qryUsuario.Close;
end;

procedure TCadastroFuncionario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
    close;
end;

procedure TCadastroFuncionario.FormShow(Sender: TObject);
begin
  carregarEstados();

  try
    if not Assigned(qryFuncionario.Connection)  then
      qryFuncionario.Connection := dtmPrincipal.conexao;

    if not qryFuncionario.Connection.Connected then
      qryFuncionario.Connection.Connect();

    if not qryFuncionario.Active then
      qryFuncionario.Open;
  except
    on E: Exception do
      ShowMessage( E.Message );
  end;

  try
    if not Assigned(qryUsuario.Connection)  then
      qryUsuario.Connection := dtmPrincipal.conexao;

    if not qryUsuario.Connection.Connected then
      qryUsuario.Connection.Connect();

    if not qryUsuario.Active then
      qryUsuario.Open;
  except
    on E: Exception do
      ShowMessage( E.Message );
  end;

end;

procedure TCadastroFuncionario.gravarDadosFuncionario;
var
  dataConvertida: string;
begin
  dataConvertida := ConverterData(dtpDataNascimento.Date);

  try
    qryFuncionario.Close;
    qryfuncionario.SQL.Clear;
    qryfuncionario.SQL.Add('INSERT INTO FUNCIONARIO');
    qryfuncionario.SQL.Add('(NOME, CPF, EMAIL, TELEFONE, DT_NASCIMENTO, ESTADO, LOGRADOURO, BAIRRO, CIDADE, COMPLEMENTO, OBSERVACAO)');
    qryfuncionario.SQL.Add('values ( :pNOME, :pCPF, :pEMAIL, :pTELEFONE, :pDT_NASCIMENTO, :pESTADO, :pLOGRADOURO, :pBAIRRO, :pCIDADE, :pCOMPLEMENTO, :pOBSERVACAO)');

    // Exemplo para inserir do tipo int
    //Query1.ParamByName('pCodigo').AsInteger := StrToInt(edtCodigo.Text);

    qryfuncionario.ParamByName('pNOME').AsString := edtNome.Text;
    qryfuncionario.ParamByName('pCPF').AsString := edtCpf.Text;
    qryfuncionario.ParamByName('pEMAIL').AsString := edtEmail.Text;
    qryfuncionario.ParamByName('pTELEFONE').AsString := edtTelefone.Text;
    qryfuncionario.ParamByName('pDT_NASCIMENTO').AsDate := dtpDataNascimento.Date;
    qryfuncionario.ParamByName('pESTADO').AsString := cbxEstado.Text;
    qryfuncionario.ParamByName('pLOGRADOURO').AsString := edtEndereco.Text;
    qryfuncionario.ParamByName('pBAIRRO').AsString := edtBairro.Text;
    qryfuncionario.ParamByName('pCIDADE').AsString := edtCidade.Text;
    qryfuncionario.ParamByName('pCOMPLEMENTO').AsString := edtComplemento.Text;
    qryfuncionario.ParamByName('pOBSERVACAO').AsString := mmObservacao.Text;



    qryfuncionario.ExecSQL;

    validarDados();

    ShowMessage('Os dados foram inseridos com sucesso');

  except
    on E: Exception do

    ShowMessage( E.Message )
  end;



end;

procedure TCadastroFuncionario.gravarDadosUsuario;
var
  SenhaCriptografada: String;
begin
  SenhaCriptografada := Criptografar(edtSenha.Text);

  try

    qryUsuario.Close;
    qryUsuario.SQL.Clear;

    qryUsuario.SQL.Add(' INSERT INTO USUARIO ');
    qryUsuario.SQL.Add('( LOGIN, SENHA, DT_CRIACAO )');
    qryUsuario.SQL.Add(' VALUES( :pLOGIN, :pSenha, :pDT_CRIACAO) ');

    qryUsuario.ParamByName('pLOGIN').AsString := edtLogin.Text;
    qryUsuario.ParamByName('pSENHA').AsString := SenhaCriptografada;
    qryUsuario.ParamByName('pDT_CRIACAO').AsDate := now;

    qryUsuario.ExecSQL;

    ShowMessage('Usuário gravado com sucesso');


  except
    on E: Exception do
      ShowMessage( E.Message );

  end;
end;

procedure TCadastroFuncionario.validarCamposObgUsuario;
begin
//   if ( edtLogin.Text = EmptyStr  ) then
//    ShowMessage( 'Insira o login para gravar' );
//    edtLogin.SetFocus;
//    abort;
//
//    if ( edtSenha.Text = EmptyStr  ) then
//    ShowMessage( 'Insira a senha para gravar' );
//    edtLogin.SetFocus;
//    abort;
//
//     if ( edtConfirmarSenha.Text = EmptyStr  ) then
//    ShowMessage( 'Insira a senha para gravar' );
//    edtLogin.SetFocus;
//    abort;
end;

procedure TCadastroFuncionario.validarDados;
begin
  if (cbxEstado.Text = ' ') then
    ShowMessage('Preencha o estado e tente novamente');

  if (dtpDataNascimento.Text = ' ') then
    ShowMessage('Preencha a data e tente novamente');
end;

function TCadastroFuncionario.logarUsuario(aUsuario, aSenha: String): Boolean;
var
  LQRY : TUniQuery;
begin
  try
    LQRY := TUniQuery.Create(nil);
    LQRY.Connection := dtmPrincipal.conexao;
    LQRY.Close;
    LQRY.SQL.Clear;

    LQRY.SQL.Add('SELECT COUNT(id) AS Qtde ' +
                 'FROM USUARIO ' +
                 'WHERE LOGIN=:LOGIN AND SENHA=:SENHA');
    LQRY.ParamByName('LOGIN').AsString := aUsuario;
    aSenha := Criptografar(aSenha);
    LQRY.ParamByName('SENHA').AsString := aSenha;
    LQRY.Active := true;

    try
//      LQRY.Open;

      if LQRY.FieldByName('Qtde').AsInteger>0 then
        result := true
      else
        result := false;
    except
      Result := false;

    end;
  finally
    if Assigned(LQRY) then
      FreeAndNil(LQRY);
  end;


end;

end.
