unit lcdLocalizarUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue, cxControls, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, DB, cxDBData, MemDS,
  DBAccess, Uni, DBCtrls, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, StdCtrls,
  cxButtons, ExtCtrls,
  lcdDataModule, lcdCadastroFuncionario;

type
  TLocalizarUsuario = class(TForm)
    pnlTop: TPanel;
    pnlClient: TPanel;
    edtPesquisa: TEdit;
    gridUsuario: TcxGrid;
    viewUsuario: TcxGridDBTableView;
    levelUsuario: TcxGridLevel;
    pnlBottom: TPanel;
    btnAlterar: TcxButton;
    btnExcluir: TcxButton;
    btnFechar: TcxButton;
    btnIncluir: TcxButton;
    DBNavigator: TDBNavigator;
    qryUsuario: TUniQuery;
    dtsUsuario: TDataSource;
    qryUsuarioID: TIntegerField;
    qryUsuarioLOGIN: TStringField;
    qryUsuarioSENHA: TStringField;
    qryUsuarioDT_CRIACAO: TDateField;
    qryUsuarioDELETADO: TStringField;
    qryUsuarioINATIVO: TStringField;
    qryUsuarioNOME: TStringField;
    qryUsuarioCPF: TStringField;
    qryUsuarioEMAIL: TStringField;
    qryUsuarioTELEFONE: TStringField;
    qryUsuarioDT_NASCIMENTO: TDateField;
    qryUsuarioOBSERVACAO: TStringField;
    qryUsuarioLOGRADOURO: TStringField;
    qryUsuarioBAIRRO: TStringField;
    qryUsuarioCIDADE: TStringField;
    qryUsuarioCOMPLEMENTO: TStringField;
    qryUsuarioESTADO: TStringField;
    viewUsuarioID: TcxGridDBColumn;
    viewUsuarioLOGIN: TcxGridDBColumn;
    viewUsuarioDT_CRIACAO: TcxGridDBColumn;
    viewUsuarioNOME: TcxGridDBColumn;
    viewUsuarioCPF: TcxGridDBColumn;
    viewUsuarioEMAIL: TcxGridDBColumn;
    viewUsuarioTELEFONE: TcxGridDBColumn;
    viewUsuarioDT_NASCIMENTO: TcxGridDBColumn;
    viewUsuarioOBSERVACAO: TcxGridDBColumn;
    viewUsuarioLOGRADOURO: TcxGridDBColumn;
    viewUsuarioBAIRRO: TcxGridDBColumn;
    viewUsuarioCIDADE: TcxGridDBColumn;
    viewUsuarioCOMPLEMENTO: TcxGridDBColumn;
    viewUsuarioESTADO: TcxGridDBColumn;
    lblPesquisa: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure qryUsuarioFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure edtPesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure FormClose(Sender: TObject);
    procedure Pesquisar();
    procedure Filtrar();
    procedure ValidarPermissaoUsuario();
    { Private declarations }
  public
    { Public declarations }
    class procedure Exibir();
  end;

var


  LocalizarUsuario: TLocalizarUsuario;

implementation

uses
  lcdSistemaController, lcdAcessoController, StrUtils, lcdLibStrings;

{$R *.dfm}

procedure TLocalizarUsuario.btnAlterarClick(Sender: TObject);
begin
  ValidarPermissaoUsuario();

  TCadastroFuncionario.Alterar(Self,qryUsuario, qryUsuario.FieldByName('ID').AsInteger);
  viewUsuario.DataController.DataSet.Refresh;
end;

procedure TLocalizarUsuario.btnExcluirClick(Sender: TObject);
begin
  ValidarPermissaoUsuario();

  if Application.MessageBox('AVISO: Deseja realmente excluir esse registro ?','ATEN��O ',MB_YESNO + MB_ICONWARNING)=MRYES then
  begin
    qryUsuario.Delete;
  end;
end;

procedure TLocalizarUsuario.btnFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TLocalizarUsuario.btnIncluirClick(Sender: TObject);
begin
  ValidarPermissaoUsuario();

  TCadastroFuncionario.Novo(Self, qryUsuario, qryUsuario.FieldByName('ID').AsInteger);
  viewUsuario.DataController.DataSet.Refresh;
end;

procedure TLocalizarUsuario.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TLocalizarUsuario.edtPesquisaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Filtrar();
end;

class procedure TLocalizarUsuario.Exibir;
var
  lListaUsuario : TLocalizarUsuario;
begin
  lListaUsuario := TLocalizarUsuario.Create(nil);
  lListaUsuario.ShowModal();
  FreeAndNil(lListaUsuario);

end;

procedure TLocalizarUsuario.FormShow(Sender: TObject);
begin
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

procedure TLocalizarUsuario.Filtrar;
var
  lTextoPesquisado: string;
begin
    if (Trim(edtPesquisa.Text) = '') then
  begin
    qryUsuario.Filtered := False;
    Exit;
  end;

  qryUsuario.Filtered := False;
  qryUsuario.Filter := '(1 = 1)';
  qryUsuario.Filtered := True;
end;

procedure TLocalizarUsuario.FormClose(Sender: TObject);
begin

   if qryUsuario.Active then
    qryUsuario.Close;

end;

procedure TLocalizarUsuario.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
    ModalResult := mrCancel;

  if (Key = VK_F2) then
    begin
      TCadastroFuncionario.Novo(Self, qryUsuario, qryUsuario.FieldByName('ID').AsInteger);
      viewUsuario.DataController.DataSet.Refresh;
    end;

  if (Key = VK_F4) then
    begin
      if Application.MessageBox('AVISO: Deseja realmente excluir esse registro ?','ATEN��O ',MB_YESNO + MB_ICONWARNING)=MRYES then
    begin
      qryUsuario.Delete;
    end;
    end;

  if (Key = VK_F5) then
    begin
      TCadastroFuncionario.Alterar(Self,qryUsuario, qryUsuario.FieldByName('ID').AsInteger);
      viewUsuario.DataController.DataSet.Refresh;
    end;

end;

procedure TLocalizarUsuario.Pesquisar();
var
  selectOriginal : string;
  Nome: string;
begin

    selectOriginal := 'SELECT * FROM USUARIO' ;
    Nome := UpperCase(edtPesquisa.Text);

    if (Nome = '') then
      begin
        ShowMessage('Insira o nome do Cliente ou C�digo para pesquisar');
        edtPesquisa.SetFocus;
        exit;
      end;




      if StrToIntDef(Nome, 0) = 0  then
          //Tem letras
        try
          if qryUsuario.Active then
          begin
            qryUsuario.Close;
            qryUsuario.SQL.Clear;
            qryUsuario.SQL.Add('SELECT * FROM USUARIO');
            qryUsuario.SQL.Add('WHERE nome LIKE :Texto');
            qryUsuario.ParamByName('Texto').AsString := '%'+Nome+'%';

            qryUsuario.Open;


          end;
        except
          on E: Exception do
            ShowMessage( E.Message );
        end
      else
        //� n�mero
        try
          if qryUsuario.Active then
          begin
            qryUsuario.Close;
            qryUsuario.SQL.Clear;
            qryUsuario.SQL.Add('SELECT * FROM USUARIO');
            qryUsuario.SQL.Add('Where id LIKE :id');
            qryUsuario.ParamByName('id').AsString := '%'+edtPesquisa.Text+'%';
            qryUsuario.Open;


          end;
        except
          on E: Exception do
            ShowMessage( E.Message );
        end
end;

procedure TLocalizarUsuario.qryUsuarioFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  lTextoAvaliado: string;
begin

  Accept := True;

  lTextoAvaliado := DataSet.Fields.FieldByName('NOME').AsString;
  lTextoAvaliado := lTextoAvaliado + ' ' + DataSet.Fields.FieldByName('LOGIN').AsString;
  lTextoAvaliado := lTextoAvaliado + ' ' + DataSet.Fields.FieldByName('TELEFONE').AsString;
  lTextoAvaliado := lTextoAvaliado + ' ' + DataSet.Fields.FieldByName('CPF').AsString;

  Accept := TLibStrings.TextoContemPalavras(lTextoAvaliado, edtPesquisa.Text);

end;

procedure TLocalizarUsuario.ValidarPermissaoUsuario();
begin
  if ( lcdSistemaController.AcessoController.UsuarioLogado.Login <> 'ADMIN') then
  begin
    ShowMessage('Aten��o: apenas o administrador pode cadastrar / editar / excluir usu�rios.');
    Abort;
  end;
end;

end.
