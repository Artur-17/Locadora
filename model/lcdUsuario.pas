unit lcdUsuario;

interface

uses
  SysUtils, Classes, DB;

type
  TUsuarioStatus = (
    usAtivo,
    usInativo
  );

  IUsuario = interface
    procedure SetId(const Value: Integer);
    procedure SetLogin(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetSenha(const Value: string);
    procedure SetStatus(const Value: TUsuarioStatus);
    procedure SetTelefone(const Value: string);

    function GetId: Integer;
    function GetLogin: string;
    function GetNome: string;
    function GetSenha: string;
    function GetStatus: TUsuarioStatus;
    function GetTelefone: string;

    property Id: Integer read GetId write SetId;
    property Nome: string read GetNome write SetNome;
    property Login: string read GetLogin write SetLogin;
    property Telefone: string read GetTelefone write SetTelefone;
    property Status: TUsuarioStatus read GetStatus write SetStatus;
    property Senha: string read GetSenha write SetSenha;
  end;

  TUsuario = class(TInterfacedObject, IUsuario)
  private
    FId: Integer;
    FStatus: TUsuarioStatus;
    FSenha: string;
    FLogin: string;
    FNome: string;
    FTelefone: string;

    procedure SetId(const Value: Integer);
    procedure SetLogin(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetSenha(const Value: string);
    procedure SetStatus(const Value: TUsuarioStatus);
    procedure SetTelefone(const Value: string);

    function GetId: Integer;
    function GetLogin: string;
    function GetNome: string;
    function GetSenha: string;
    function GetStatus: TUsuarioStatus;
    function GetTelefone: string;

  protected

  public
    property Id: Integer read GetId write SetId;
    property Nome: string read GetNome write SetNome;
    property Login: string read GetLogin write SetLogin;
    property Telefone: string read GetTelefone write SetTelefone;
    property Status: TUsuarioStatus read GetStatus write SetStatus;
    property Senha: string read GetSenha write SetSenha;
  end;


implementation

{ TUsuario }

function TUsuario.GetId: Integer;
begin
  Result := FId;
end;

function TUsuario.GetLogin: string;
begin
  Result := FLogin;
end;

function TUsuario.GetNome: string;
begin
  Result := FNome;
end;

function TUsuario.GetSenha: string;
begin
  Result := FSenha;
end;

function TUsuario.GetStatus: TUsuarioStatus;
begin
  Result := FStatus;
end;

function TUsuario.GetTelefone: string;
begin
  Result := FTelefone;
end;

procedure TUsuario.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TUsuario.SetLogin(const Value: string);
begin
  FLogin := Value;
end;

procedure TUsuario.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TUsuario.SetSenha(const Value: string);
begin
  FSenha := Value;
end;

procedure TUsuario.SetStatus(const Value: TUsuarioStatus);
begin
  FStatus := Value;
end;

procedure TUsuario.SetTelefone(const Value: string);
begin
  FTelefone := Value;
end;

end.
