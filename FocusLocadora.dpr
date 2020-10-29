program FocusLocadora;

uses
  Forms,
  lcdPrincipal in 'lcdPrincipal.pas' {Principal},
  lcdCadastroFuncionario in 'CadastroUsuario\lcdCadastroFuncionario.pas' {CadastroFuncionario},
  lcdLocalizarFilme in 'lcdLocalizarFilme.pas' {LocalizarFilme},
  lcdDataModule in 'lcdDataModule.pas' {dtmPrincipal: TDataModule},
  Enter in 'terceiros\Enter.pas',
  FuncaoCriptografia in 'Utils\FuncaoCriptografia.pas',
  lcdCadastroCategoriaUsuario in 'CadastroUsuario\lcdCadastroCategoriaUsuario.pas' {CadastroCategoriaUsuario},
  lcdCadastroPermissoes in 'CadastroUsuario\lcdCadastroPermissoes.pas' {CadastroPermissoes},
  lcdLocalizarCategoriaUsuario in 'CadastroUsuario\lcdLocalizarCategoriaUsuario.pas' {LocalizarCategoriaUsuario},
  lcdLogin in 'Login\lcdLogin.pas' {Login};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TdtmPrincipal, dtmPrincipal);
  Application.Run;
end.
