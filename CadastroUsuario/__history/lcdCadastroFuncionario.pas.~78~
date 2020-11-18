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
    pgFuncionario: TcxTabSheet;
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
    pgUsuario: TcxTabSheet;
    lblLogin: TLabel;
    edtLogin: TEdit;
    Image1: TImage;
    lblSenha: TLabel;
    lblConfirmarSenha: TLabel;
    edtCodigoCategoria: TEdit;
    edtNomeCategoria: TEdit;
    btnLocalizarCategoria: TSpeedButton;
    dtpDataNascimento: TcxDateEdit;
    edtSenha: TMaskEdit;
    edtConfirmacaoSenha: TMaskEdit;
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
    procedure btnLocalizarCategoriaClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    FDataSet: TDataSet;
    FIDCliente: integer;
    FModo : string;
    procedure gravarDadosFuncionario();
    procedure carregarEstados();
    procedure PreencherDados();
//    procedure gravarDadosUsuario();
    function Validar(): Boolean;


  public
    { Public declarations }
    class procedure exibirCadastroFuncionario();
    class function ConverterData(pDateTime: TDateTime) : String;
    function logarUsuario(aUsuario, aSenha: String): Boolean;

     class function Novo(pOwner: TForm; pDataSet: TDataset;
      pIDCliente: integer): TmodalResult; static;

     class function Alterar(pOwner: TForm; pDataSet: TDataset;  pIDCliente: integer): TmodalResult;
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

procedure TCadastroFuncionario.cxButton1Click(Sender: TObject);
begin
  gravarDadosFuncionario();
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
  pgCadastro.ActivePage := pgFuncionario;
  carregarEstados();

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

procedure TCadastroFuncionario.gravarDadosFuncionario();
var
  SenhaCriptografada: String;
  Nome: String;
begin
  if (not Validar()) then
    Exit;

  SenhaCriptografada := Criptografar(edtSenha.Text);
  Nome := UpperCase(edtNome.Text);
  try

    if FModo = 'novo' then
       begin
         qryUsuario.SQL.Add('INSERT INTO USUARIO');
         qryUsuario.SQL.Add('(NOME, CPF, EMAIL, TELEFONE, DT_NASCIMENTO, ESTADO, LOGRADOURO, BAIRRO, CIDADE, COMPLEMENTO, OBSERVACAO, LOGIN, SENHA)');
         qryUsuario.SQL.Add('values ( :pNOME, :pCPF, :pEMAIL, :pTELEFONE, :pDT_NASCIMENTO, :pESTADO, :pLOGRADOURO, :pBAIRRO, :pCIDADE, :pCOMPLEMENTO, :pOBSERVACAO, :pLOGIN, :pSENHA)')
       end
       else
       begin
        qryUsuario.SQL.Add('UPDATE OR INSERT INTO USUARIO');
        qryUsuario.SQL.Add('(ID, NOME, CPF, EMAIL, TELEFONE, DT_NASCIMENTO, ESTADO, LOGRADOURO, BAIRRO, CIDADE, COMPLEMENTO, OBSERVACAO, LOGIN, SENHA)');
        qryUsuario.SQL.Add('values (:ID, :pNOME, :pCPF, :pEMAIL, :pTELEFONE, :pDT_NASCIMENTO, :pESTADO, :pLOGRADOURO, :pBAIRRO, :pCIDADE, :pCOMPLEMENTO, :pOBSERVACAO, :pLOGIN, :pSENHA))');
        qryUsuario.SQL.Add('MATCHING (ID);');

        qryUsuario.ParamByName('ID').AsInteger := FIDCliente;
       end;


      qryUsuario.ParamByName('pNOME').AsString := Nome;
      qryUsuario.ParamByName('pCPF').AsString := edtCpf.Text;
      qryUsuario.ParamByName('pEMAIL').AsString := edtEmail.Text;
      qryUsuario.ParamByName('pTELEFONE').AsString := edtTelefone.Text;
      qryUsuario.ParamByName('pDT_NASCIMENTO').AsDate := dtpDataNascimento.Date;
      qryUsuario.ParamByName('pESTADO').AsString := cbxEstado.Text;
      qryUsuario.ParamByName('pLOGRADOURO').AsString := edtEndereco.Text;
      qryUsuario.ParamByName('pBAIRRO').AsString := edtBairro.Text;
      qryUsuario.ParamByName('pCIDADE').AsString := edtCidade.Text;
      qryUsuario.ParamByName('pCOMPLEMENTO').AsString := edtComplemento.Text;
      qryUsuario.ParamByName('pOBSERVACAO').AsString := mmObservacao.Text;
      qryUsuario.ParamByName('pLOGIN').AsString := edtLogin.Text;
      qryUsuario.ParamByName('pSENHA').AsString := edtSenha.Text;



    qryUsuario.ExecSQL;

    ShowMessage('Os dados foram inseridos com sucesso');

    ModalResult := mrOk;


  except
    on E: Exception do

    ShowMessage( E.Message )
  end;

  ModalResult := mrOk;



end;

//procedure TCadastroFuncionario.gravarDadosUsuario;
//var
//  SenhaCriptografada: String;
//begin
//  SenhaCriptografada := Criptografar(edtSenha.Text);
//
//  try
//
//    qryUsuario.Close;
//    qryUsuario.SQL.Clear;
//
//    qryUsuario.SQL.Add(' INSERT INTO USUARIO ');
//    qryUsuario.SQL.Add('( LOGIN, SENHA, DT_CRIACAO )');
//    qryUsuario.SQL.Add(' VALUES( :pLOGIN, :pSenha, :pDT_CRIACAO) ');
//
//    qryUsuario.ParamByName('pLOGIN').AsString := edtLogin.Text;
//    qryUsuario.ParamByName('pSENHA').AsString := SenhaCriptografada;
//    qryUsuario.ParamByName('pDT_CRIACAO').AsDate := now;
//
//    qryUsuario.ExecSQL;
//
//    ShowMessage('Usuário gravado com sucesso');
//
//
//  except
//    on E: Exception do
//      ShowMessage( E.Message );
//
//  end;
//end;

Function TCadastroFuncionario.Validar: Boolean;
const
  MIN_LENGHT: Integer = 3;
begin

  if (Length(Trim(edtNome.Text)) < MIN_LENGHT) then
  begin
    ShowMessage('O campo de nome precisa de, pelo menos, ' + IntToStr(MIN_LENGHT) + '   digitos. Verifique.');
    edtNome.SetFocus;
    Result := False;
    Exit;
  end;


    if (Length(Trim(edtLogin.Text)) < MIN_LENGHT) then
    begin
     ShowMessage('O campo de Login precisa de, pelo menos, ' + IntToStr(MIN_LENGHT) +
      ' digitos. Verifique.');
     pgCadastro.ActivePage := pgUsuario;
     edtLogin.SetFocus;
     Result := False;
     Exit;
    end;


  if (Length(edtSenha.Text) < MIN_LENGHT) then
  begin
    ShowMessage('O campo de Senha precisa de, pelo menos, ' + IntToStr(MIN_LENGHT) +
      ' digitos. Verifique.');
    pgCadastro.ActivePage := pgUsuario;
    edtSenha.SetFocus;
    Result := False;
    Exit;
  end;


  if (edtSenha.Text <> edtConfirmacaoSenha.Text) then
  begin
    ShowMessage('As senhas não coincidem. Verifique.');
    pgCadastro.ActivePage := pgUsuario;
    edtConfirmacaoSenha.SetFocus;
    Result := False;
    Exit;
  end;

//  if (cbxEstado.Text = ' ') then
//    ShowMessage('Preencha o estado e tente novamente');
//    Result := False;
//    Exit;
//
//  if (dtpDataNascimento.Text = ' ') then
//    ShowMessage('Preencha a data e tente novamente');
//    Result := False;
//    Exit;

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

class function TCadastroFuncionario.Novo(pOwner :TForm; pDataSet :TDataset; pIDCliente: integer) : TmodalResult;
var
  lcadastro : TCadastroFuncionario;
begin
   lcadastro := TCadastroFuncionario.Create(nil);
   lcadastro.FModo := 'novo';
   lcadastro.ShowModal();
   FreeAndNil(lcadastro);
end;

class function TCadastroFuncionario.Alterar(pOwner :TForm; pDataSet :TDataset; pIDCliente: integer) : TmodalResult;
var
  lCadastroCliente : TCadastroFuncionario;
begin
  lCadastroCliente := TCadastroFuncionario.Create(pOwner);
  try
    lCadastroCliente.FDataSet := pDataSet;
    lCadastroCliente.PreencherDados;
    lCadastroCliente.FIDCliente := pIDCliente;
    lCadastroCliente.FModo := 'alterar';

    Result := lCadastroCliente.ShowModal
  finally
    FreeAndNil(lCadastroCliente);
  end;
end;

procedure TCadastroFuncionario.PreencherDados;
begin
  Try
    edtNome.Text := FDataSet.FieldByName('NOME').AsString;
    edtCpf.Text := FDataSet.FieldByName('CPF').AsString;
    edtEmail.Text := FDataSet.FieldByName('EMAIL').AsString;
    edtTelefone.Text := FDataSet.FieldByName('TELEFONE').AsString;
    edtEndereco.Text := FDataSet.FieldByName('LOGRADOURO').AsString;
    edtBairro.Text := FDataSet.FieldByName('BAIRRO').AsString;
    edtCidade.Text := FDataSet.FieldByName('CIDADE').AsString;
    edtComplemento.Text := FDataSet.FieldByName('COMPLEMENTO').AsString;
    cbxEstado.Text := FDataSet.FieldByName('ESTADO').AsString;
    mmObservacao.Text := FDataSet.FieldByName('OBSERVACAO').AsString;
    dtpDataNascimento.Date := FDataSet.FieldByName('DT_NASCIMENTO').AsDateTime;
    edtLogin.Text := FDataSet.FieldByName('LOGIN').AsString;
    edtSenha.Text := FDataSet.FieldByName('SENHA').AsString;
    edtConfirmacaoSenha.Text := FDataSet.FieldByName('SENHA').AsString;
  except
    on E: Exception do
      ShowMessage( E.Message );
  End;


end;

end.
