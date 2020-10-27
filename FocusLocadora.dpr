program FocusLocadora;

uses
  Forms,
  lcdPrincipal in 'lcdPrincipal.pas' {Principal},
  lcdCadastroFuncionario in 'CadastroUsuario\lcdCadastroFuncionario.pas' {CadastroFuncionario},
  lcdLocalizarFilme in 'lcdLocalizarFilme.pas' {LocalizarFilme},
  lcdDataModule in 'lcdDataModule.pas' {dtmPrincipal: TDataModule},
  Enter in 'terceiros\Enter.pas',
  FuncaoCriptografia in 'Utils\FuncaoCriptografia.pas',
  lcdCadastroCategoriaUsuario in 'CadastroUsuario\lcdCadastroCategoriaUsuario.pas' {Form1},
  lcdCadastroPermissoes in 'CadastroUsuario\lcdCadastroPermissoes.pas' {CadastroPermissoes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TdtmPrincipal, dtmPrincipal);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TCadastroPermissoes, CadastroPermissoes);
  Application.Run;
end.
