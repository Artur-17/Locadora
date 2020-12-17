unit lcdInterfaces;

interface

uses
  SysUtils, Classes, DB,

  lcdUsuario;

type
  IAcessoController = interface
    procedure SetUsuarioLogado(const Value: IUsuario);

    function GetUsuarioLogado: IUsuario;
    function GetUsuarioAdministrador: Boolean;

    property UsuarioLogado: IUsuario read GetUsuarioLogado write SetUsuarioLogado;
    property UsuarioAdministrador: Boolean read GetUsuarioAdministrador;
  end;

implementation

end.
