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
  ExtCtrls, cxPC, MemDS, DBAccess, Uni, cxCurrencyEdit,


  lcdEnum;

type
  TEmprestimo = class(TForm)
    pgcPrincipal: TcxPageControl;
    pgListagemEmprestimo: TcxTabSheet;
    pgEmprestimoItens: TcxTabSheet;
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
    pnlValorTotal: TPanel;
    lblValorTotalVenda: TLabel;
    qryEmprestimo: TUniQuery;
    qryEmprestimoItem: TUniQuery;
    edtValorUnitario: TcxCurrencyEdit;
    edtTotal: TcxCurrencyEdit;
    edtTotalVenda: TcxCurrencyEdit;
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnFecharEmprestimoClick(Sender: TObject);
  private
    { Private declarations }
    procedure ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
      btnApagar: TcxButton; btnNavigator: TDBNavigator;
      pgcPrincipal: TcxPageControl; Flag: Boolean);
  public
    { Public declarations }
    EstadoDoCadastro:TEstadoDoCadastro;
    class procedure Exibir();
    //function Gravar(EstadoDoCadastro:TEstadoDoCadastro):boolean; virtual;
  end;

var
  Emprestimo: TEmprestimo;

implementation

{$R *.dfm}

{ TForm1 }

procedure TEmprestimo.btnFecharEmprestimoClick(Sender: TObject);
begin
  ModalResult := MrClose;
end;

procedure TEmprestimo.ControlarBotoes(btnNovo, btnAlterar, btnCancelar,
  btnGravar, btnApagar: TcxButton; btnNavigator: TDBNavigator;
  pgcPrincipal: TcxPageControl; Flag: Boolean);
begin
  btnNovo.Enabled      :=Flag;
  btnApagar.Enabled    :=Flag;
  btnAlterar.Enabled   :=Flag;
  btnNavigator.Enabled :=Flag;
  pgcPrincipal.Pages[0].TabVisible:=Flag;

  btnCancelar.Enabled  :=not(Flag);
  btnGravar.Enabled    :=not(Flag);
end;

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
