unit lcdCadastroCategoriaUsuario;

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
  dxSkinXmas2008Blue, StdCtrls, cxButtons, ExtCtrls, lcdCadastroPermissoes, lcdDataModule,
  DB, MemDS, DBAccess, Uni;

type
  TCadastroCategoriaUsuario = class(TForm)
    pnlTop: TPanel;
    edtCategoria: TEdit;
    lblCategoria: TLabel;
    lblDescricao: TLabel;
    edtDescricao: TEdit;
    mmObs: TMemo;
    btnPermissoes: TcxButton;
    btnGravar: TcxButton;
    cxButton1: TcxButton;
    qryCategoria: TUniQuery;
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
    procedure gravarCategoriaUsuario();
  public
    { Public declarations }
  class procedure exibirCadastroCategoriaUsuario();
  end;

var
  CadastroCategoriaUsuario: TCadastroCategoriaUsuario;

implementation

{$R *.dfm}

{ TForm1 }

procedure TCadastroCategoriaUsuario.btnGravarClick(Sender: TObject);
begin
  gravarCategoriaUsuario();
end;

procedure TCadastroCategoriaUsuario.cxButton1Click(Sender: TObject);
begin
  close;
end;

class procedure TCadastroCategoriaUsuario.exibirCadastroCategoriaUsuario;
var
  lcadastro : TCadastroCategoriaUsuario;
begin
  lcadastro := TCadastroCategoriaUsuario.Create(nil);
  lcadastro.ShowModal();
  FreeAndNil(lcadastro);
end;

procedure TCadastroCategoriaUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if qryCategoria.Active then
    qryCategoria.Close;

  if qryCategoria.Active then
    qryCategoria.Close;
end;

procedure TCadastroCategoriaUsuario.FormShow(Sender: TObject);
begin
   try
    if not Assigned(qryCategoria.Connection)  then
      qryCategoria.Connection := dtmPrincipal.conexao;

    if not qryCategoria.Connection.Connected then
      qryCategoria.Connection.Connect();

    if not qryCategoria.Active then
      qryCategoria.Open;
  except
    on E: Exception do
      ShowMessage( E.Message );
  end;
end;

procedure TCadastroCategoriaUsuario.gravarCategoriaUsuario;
begin

  try
    qryCategoria.Close;
    qryCategoria.SQL.Clear;

    qryCategoria.SQL.Add('INSERT INTO USUARIO_CATEGORIA');
    qryCategoria.SQL.Add('(CATEGORIA, DESCRICAO, OBSERVACAO, DT_CRIACAO)');
    qryCategoria.SQL.Add('VALUES(:CATEGORIA, :DESCRICAO, :OBSERVACAO, :DT_CRIACAO)');

    qryCategoria.ParamByName('CATEGORIA').AsString := edtCategoria.Text;
    qryCategoria.ParamByName('DESCRICAO').AsString := edtDescricao.Text;
    qryCategoria.ParamByName('OBSERVACAO').AsString := mmObs.Text;
    qryCategoria.ParamByName('DT_CRIACAO').AsDate := now;

    qryCategoria.ExecSQL;

    ShowMessage('Os dados foram inseridos com sucesso');
  except
    on E: Exception do
      ShowMessage( E.Message );

  end;


end;

end.
