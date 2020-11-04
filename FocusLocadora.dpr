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
  lcdLocalizarFilme in 'CadastroFilme\lcdLocalizarFilme.pas' {LocalizarFilme};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TdtmPrincipal, dtmPrincipal);
  Application.CreateForm(TLocalizarFilme, LocalizarFilme);
  Application.Run;
end.
