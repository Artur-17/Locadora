program FocusLocadora;

uses
  Forms,
  lcdPrincipal in 'lcdPrincipal.pas' {Principal},
  lcdCadastroFuncionario in 'CadastroUsuario\lcdCadastroFuncionario.pas' {CadastroFuncionario},
  lcdDataModule in 'lcdDataModule.pas' {dtmPrincipal: TDataModule},
  Enter in 'terceiros\Enter.pas',
  FuncaoCriptografia in 'Utils\FuncaoCriptografia.pas',
  lcdCadastroCategoriaUsuario in 'CadastroUsuario\lcdCadastroCategoriaUsuario.pas' {CadastroCategoriaUsuario},
  lcdCadastroPermissoes in 'CadastroUsuario\lcdCadastroPermissoes.pas' {CadastroPermissoes},
  lcdLocalizarCategoriaUsuario in 'CadastroUsuario\lcdLocalizarCategoriaUsuario.pas' {LocalizarCategoriaUsuario},
  lcdLogin in 'Login\lcdLogin.pas' {Login},
  lcdLocalizarFilme in 'CadastroFilme\lcdLocalizarFilme.pas' {LocalizarFilme},
  lcdCadastroCliente in 'CadastroCliente\lcdCadastroCliente.pas' {CadastroCliente},
  lcdCaminhoBancoDados in 'CaminhoBancoDados\lcdCaminhoBancoDados.pas' {CaminhoBancoDados},
  lcdLocalizarCliente in 'CadastroCliente\lcdLocalizarCliente.pas' {LocalizarCliente},
  lcdLocalizarUsuario in 'CadastroUsuario\lcdLocalizarUsuario.pas' {LocalizarUsuario},
  lcdLocalizarProduto in 'CadastroProduto\lcdLocalizarProduto.pas' {LocalizarProduto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TdtmPrincipal, dtmPrincipal);
  Application.CreateForm(TCaminhoBancoDados, CaminhoBancoDados);
  Application.CreateForm(TLocalizarCliente, LocalizarCliente);
  Application.CreateForm(TLocalizarUsuario, LocalizarUsuario);
  Application.CreateForm(TLocalizarProduto, LocalizarProduto);
  Application.Run;
end.
