unit lcdLocalizarCliente;

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
  dxSkinXmas2008Blue, cxControls, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, DB, cxDBData, DBCtrls,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, StdCtrls, cxButtons, ExtCtrls, MemDS,
  DBAccess, Uni, lcdDataModule, lcdCadastroCliente;

type
  TLocalizarCliente = class(TForm)
    pnlTop: TPanel;
    edtPesquisa: TEdit;
    pnlClient: TPanel;
    grid: TcxGrid;
    viewcliente: TcxGridDBTableView;
    levelCliente: TcxGridLevel;
    pnlBottom: TPanel;
    btnAlterar: TcxButton;
    btnExcluir: TcxButton;
    btnFechar: TcxButton;
    btnIncluir: TcxButton;
    DBNavigator: TDBNavigator;
    qryCliente: TUniQuery;
    qryClienteID: TIntegerField;
    qryClienteNOME: TStringField;
    qryClienteCPF: TStringField;
    qryClienteEMAIL: TStringField;
    qryClienteTELEFONE: TStringField;
    qryClienteDT_NASCIMENTO: TDateField;
    qryClienteESTADO: TStringField;
    qryClienteLOGRADOURO: TStringField;
    qryClienteBAIRRO: TStringField;
    qryClienteCIDADE: TStringField;
    qryClienteCOMPLEMENTO: TStringField;
    qryClienteOBSERVACAO: TStringField;
    dtsCliente: TDataSource;
    viewclienteID: TcxGridDBColumn;
    viewclienteNOME: TcxGridDBColumn;
    viewclienteCPF: TcxGridDBColumn;
    viewclienteEMAIL: TcxGridDBColumn;
    viewclienteTELEFONE: TcxGridDBColumn;
    viewclienteDT_NASCIMENTO: TcxGridDBColumn;
    viewclienteESTADO: TcxGridDBColumn;
    viewclienteLOGRADOURO: TcxGridDBColumn;
    viewclienteBAIRRO: TcxGridDBColumn;
    viewclienteCIDADE: TcxGridDBColumn;
    viewclienteCOMPLEMENTO: TcxGridDBColumn;
    viewclienteOBSERVACAO: TcxGridDBColumn;
    lblPesquisa: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure qryClienteFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure edtPesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Pesquisar;
    procedure Filtrar();

    { Private declarations }
  public
    { Public declarations }
    class procedure ExibirLocalizarCliente();
  end;

var
  LocalizarCliente: TLocalizarCliente;

implementation

uses
  StrUtils;

{$R *.dfm}

procedure TLocalizarCliente.btnAlterarClick(Sender: TObject);
begin
  TCadastroCliente.Alterar(Self,qryCliente, qryCliente.FieldByName('ID').AsInteger);
  viewcliente.DataController.DataSet.Refresh;
end;

procedure TLocalizarCliente.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('AVISO: Deseja realmente excluir esse registro ?','ATEN��O ',MB_YESNO + MB_ICONWARNING)=MRYES then
  begin
    qryCliente.Delete;
  end;

end;

procedure TLocalizarCliente.btnFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TLocalizarCliente.btnIncluirClick(Sender: TObject);
begin
  TCadastroCliente.Novo(Self, qrycliente, qryCliente.FieldByName('ID').AsInteger);
  viewcliente.DataController.DataSet.Refresh;
end;

procedure TLocalizarCliente.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;


procedure TLocalizarCliente.edtPesquisaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Filtrar();
end;

procedure TLocalizarCliente.Pesquisar();
var
  selectOriginal : string;
  Nome: String;
begin

    selectOriginal := 'SELECT * FROM CLIENTE';
    Nome := UpperCase(edtPesquisa.Text);

    if (Nome = '') then
      begin
        ShowMessage('Insira o nome do Cliente ou C�digo para pesquisar');
        edtPesquisa.SetFocus;
      end;

      if StrToIntDef(Nome, 0) = 0  then
          //Tem letras
        try
          if qryCliente.Active then
          begin
            qryCliente.Close;
            qryCliente.SQL.Clear;
            qryCliente.SQL.Add('Select * from cliente');
            qryCliente.SQL.Add('Where nome LIKE :Texto');
            qryCliente.ParamByName('Texto').AsString := '%'+Nome+'%';
            qryCliente.Open;


          end;
        except
          on E: Exception do
            ShowMessage( E.Message );
        end
      else
        //� n�mero
        try
          if qryCliente.Active then
          begin
            qryCliente.Close;
            qryCliente.SQL.Clear;
            qryCliente.SQL.Add('Select * from cliente');
            qryCliente.SQL.Add('Where id LIKE :id');
            qryCliente.ParamByName('id').AsString := '%'+edtPesquisa.Text+'%';
            qryCliente.Open;


          end;
        except
          on E: Exception do
            ShowMessage( E.Message );
        end
end;

procedure TLocalizarCliente.qryClienteFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  i: Integer;
  lPalavra,
  lTextoPesquisado,
  lTextoAvaliado: string;
  lPalavrasPesquisadas: TStringList;
begin
   Accept := True;
  lPalavrasPesquisadas := TStringList.Create();

  try
    lTextoPesquisado := AnsiReplaceStr(UpperCase(edtPesquisa.Text), ' ', ',');
    lTextoPesquisado := AnsiReplaceStr(lTextoPesquisado, '�', 'A');
    lTextoPesquisado := AnsiReplaceStr(lTextoPesquisado, '�', 'O');

    lPalavrasPesquisadas.Delimiter := ',';
    lPalavrasPesquisadas.DelimitedText := lTextoPesquisado;

    lTextoAvaliado := DataSet.Fields.FieldByName('NOME').AsString;
    lTextoAvaliado := lTextoAvaliado + ' ' + DataSet.Fields.FieldByName('CPF').AsString;
    lTextoAvaliado := lTextoAvaliado + ' ' + DataSet.Fields.FieldByName('TELEFONE').AsString;
    lTextoAvaliado := UpperCase(lTextoAvaliado);
    lTextoAvaliado := AnsiReplaceStr(lTextoAvaliado, '�', 'A');
    lTextoAvaliado := AnsiReplaceStr(lTextoAvaliado, '�', 'O');

    for i := 0 to lPalavrasPesquisadas.Count - 1 do
    begin
      lPalavra := lPalavrasPesquisadas[i];

      if (Trim(lPalavra) = '') then
        Continue;

      Accept := (AnsiContainsText(lTextoAvaliado, lPalavra));

      if (not Accept) then
        Break;
    end;
  finally
    FreeAndNil(lPalavrasPesquisadas);
  end;
end;

class procedure TLocalizarCliente.ExibirLocalizarCliente;
var
  lcadastro : TLocalizarCliente;
begin
  lcadastro := TLocalizarCliente.Create(nil);;
  lcadastro.ShowModal();
  FreeAndNil(lcadastro);
end;


procedure TLocalizarCliente.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_ESCAPE) then
    ModalResult := mrCancel;

  if (key = VK_F2) then
    TCadastroCliente.Novo(Self, qrycliente, qryCliente.FieldByName('ID').AsInteger);

  if (Key = VK_F4) then
     if Application.MessageBox('AVISO: Deseja realmente excluir esse registro ?','ATEN��O ',MB_YESNO + MB_ICONWARNING)=MRYES then
      begin
        qryCliente.Delete;
      end;

  if (Key = VK_F5) then
    begin
     TCadastroCliente.Alterar(Self,qryCliente, qryCliente.FieldByName('ID').AsInteger);
     viewcliente.DataController.DataSet.Refresh;
    end;

end;

procedure TLocalizarCliente.FormShow(Sender: TObject);
begin

   try
    if not Assigned(qryCliente.Connection)  then
      qryCliente.Connection := dtmPrincipal.conexao;

    if not qryCliente.Connection.Connected then
      qryCliente.Connection.Connect();

    if not qryCliente.Active then
      qryCliente.Open;
  except
    on E: Exception do
      ShowMessage( E.Message );
  end;

end;

procedure TLocalizarCliente.Filtrar;
var
  lTextoPesquisado: string;
begin
  if (Trim(edtPesquisa.Text) = '') then
  begin
    qryCliente.Filtered := False;
    Exit;
  end;

  qryCliente.Filtered := False;
  qryCliente.Filter := '(1 = 1)';
  qryCliente.Filtered := True;
end;

procedure TLocalizarCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if qryCliente.Active then
    qryCliente.Close;

  if qryCliente.Active then
    qryCliente.Close;
end;

end.
