unit lcdAcessoController;

interface

uses
  SysUtils, Classes,

  lcdInterfaces, lcdUsuario;

type
  TAcessoController = class(TInterfacedObject, IAcessoController)
  private
    FUsuarioLogado: IUsuario;
    FUsuarioAdministrador: Boolean;

    procedure SetUsuarioLogado(const Value: IUsuario);

    function GetUsuarioLogado: IUsuario;
    function GetUsuarioAdministrador: Boolean;

  public
    property UsuarioLogado: IUsuario read GetUsuarioLogado write SetUsuarioLogado;
    property UsuarioAdministrador: Boolean read GetUsuarioAdministrador;
  end;

implementation

{ TAcessoController }

function TAcessoController.GetUsuarioAdministrador: Boolean;
begin
  Result := FUsuarioAdministrador;
end;

function TAcessoController.GetUsuarioLogado: IUsuario;
begin
  Result := FUsuarioLogado;
end;

procedure TAcessoController.SetUsuarioLogado(const Value: IUsuario);
begin
  FUsuarioLogado := Value;
  FUsuarioAdministrador := FUsuarioLogado.Login = 'ADMIN';
end;

end.
