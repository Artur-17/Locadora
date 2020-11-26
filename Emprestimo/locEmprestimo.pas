unit locEmprestimo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
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
  dxSkinXmas2008Blue, dxBarBuiltInMenu, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, DB, cxDBData, cxContainer,
  ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, DBCtrls, StdCtrls, cxButtons,
  ExtCtrls, cxPC, MemDS, DBAccess, Uni;

type
  TEmprestimo = class(TForm)
    pgCadastro: TcxPageControl;
    pgListagem: TcxTabSheet;
    pgEmprestimo: TcxTabSheet;
    pnlClient: TPanel;
    lblPesquisa: TLabel;
    edtPesquisa: TEdit;
    pnlBottom: TPanel;
    btnAlterarEmprestimo: TcxButton;
    btnExcluirEmprestimo: TcxButton;
    btnFecharEmprestimo: TcxButton;
    btnIncluirEmprestimo: TcxButton;
    DBNavigatorEmprestimo: TDBNavigator;
    ViewListagem: TcxGridDBTableView;
    lvlListagem: TcxGridLevel;
    gdrListagem: TcxGrid;
    pnlBottomEmprestimoItem: TPanel;
    btnAlterarItem: TcxButton;
    btnExcluirItem: TcxButton;
    btnIncluirItem: TcxButton;
    DBNavigator1: TDBNavigator;
    edtNumVenda: TEdit;
    edtNomeCliente: TEdit;
    btnCliente: TcxButton;
    dtpDataVenda: TcxDateEdit;
    edtNomeFilme: TEdit;
    edtValorUnitario: TEdit;
    btnIncluir: TcxButton;
    btnRemoverItem: TcxButton;
    pnlTop: TPanel;
    viewVenda: TcxGridDBTableView;
    lvlVenda: TcxGridLevel;
    gridVenda: TcxGrid;
    lblNumVenda: TLabel;
    lblNomeCliente: TLabel;
    lblDataVenda: TLabel;
    lblNomeFilme: TLabel;
    btnProduto: TcxButton;
    lblValorUnitario: TLabel;
    lblQuantidade: TLabel;
    edtQuantidade: TEdit;
    lblTotalProduto: TLabel;
    edtTotalProduto: TEdit;
    pnlValorTotal: TPanel;
    edtValorTotalVenda: TEdit;
    lblValorTotalVenda: TLabel;
    qryEmprestimo: TUniQuery;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    DBNavigator2: TDBNavigator;
    cxTabSheet2: TcxTabSheet;
    Panel3: TPanel;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    DBNavigator3: TDBNavigator;
    Panel4: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit2: TEdit;
    cxButton7: TcxButton;
    cxButton8: TcxButton;
    cxButton9: TcxButton;
    cxDateEdit1: TcxDateEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    cxButton10: TcxButton;
    Edit6: TEdit;
    Edit7: TEdit;
    cxGrid2: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    Panel5: TPanel;
    Label9: TLabel;
    Edit8: TEdit;
    qryEmprestimoItem: TUniQuery;
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure Exibir();
  end;

var
  Emprestimo: TEmprestimo;

implementation

{$R *.dfm}

{ TForm1 }

class procedure TEmprestimo.Exibir;
var
  lEmprestimo : TEmprestimo;
begin
  lEmprestimo := TEmprestimo.Create(nil);
  lEmprestimo.ShowModal();
  FreeAndNil(lEmprestimo);

end;

procedure TEmprestimo.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
    ModalResult := mrCancel;
end;

end.