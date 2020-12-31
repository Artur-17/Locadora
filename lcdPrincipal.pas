unit lcdPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxRibbonSkins, dxSkinsCore, dxSkinsDefaultPainters, dxRibbonCustomizationForm,
  dxBar, cxClasses, dxRibbon, ExtCtrls, ComCtrls, lcdDataModule, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinsForm, Menus, dxBarCode, cxBarEditItem,

  lcdSistemaController, Enter;

type
  TPrincipal = class(TForm)
    Início: TdxRibbonTab;
    dxRibbon1: TdxRibbon;
    dxbrmngr1: TdxBarManager;
    dxbrCadastro: TdxBar;
    btnFilme: TdxBarLargeButton;
    btnCliente: TdxBarLargeButton;
    btnUsuario: TdxBarLargeButton;
    sttPrincipal: TStatusBar;
    Timer: TTimer;
    dxSkinController1: TdxSkinController;
    MainMenu1: TMainMenu;
    CADASTRO1: TMenuItem;
    UsuriosFuncionrios1: TMenuItem;
    Funcionrio1: TMenuItem;
    Ca1: TMenuItem;
    dxBarLargeButton1: TdxBarLargeButton;
    cxBarEditItem1: TcxBarEditItem;
    dxbrVenda: TdxBar;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    procedure TimerTimer(Sender: TObject);
    procedure btnFilmeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnUsuarioClick(Sender: TObject);
    procedure Ca1Click(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
  private
    { Private declarations }

    TeclaEnter : TMREnter;
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation


{$R *.dfm}

uses
   lcdAcessoController, lcdLocalizarCategoriaUsuario, locEmprestimo,
   lcdLocalizarFilme, lcdCadastroFuncionario, lcdLogin, lcdCadastroCategoriaUsuario,
   lcdCadastroCliente, lcdLocalizarCliente, lcdLocalizarUsuario, lcdlocalizarGenero;



procedure TPrincipal.btnClienteClick(Sender: TObject);
begin
// Comenteo porque o cadasro de cliente já está pronto, só falta fazer a tela de localizar
//  TCadastroCliente.ExibirCadastroCliente();
  TLocalizarCliente.ExibirLocalizarCliente();
end;

procedure TPrincipal.btnFilmeClick(Sender: TObject);
begin
  TLocalizarFilme.exibirLocalizarFilme();
end;

procedure TPrincipal.btnUsuarioClick(Sender: TObject);
begin
  TLocalizarUsuario.Exibir();
end;

procedure TPrincipal.Ca1Click(Sender: TObject);
begin
// Comentei para verificar que o cadastro de categoria está inserindo no bd
  TLocalizarCategoriaUsuario.exibirCategoriaUsuario();
//  TCadastroCategoriaUsuario.exibirCadastroCategoriaUsuario();
end;

procedure TPrincipal.dxBarLargeButton3Click(Sender: TObject);
begin
  TEmprestimo.Exibir();
end;

procedure TPrincipal.dxBarLargeButton4Click(Sender: TObject);
begin
  TLocalizarGenero.Exibir();
end;

procedure TPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(TeclaEnter);
end;

procedure TPrincipal.FormCreate(Sender: TObject);
begin
  TeclaEnter := TMREnter.Create(self);
  TeclaEnter.FocusEnabled := true;
  TeclaEnter.FocusColor := clInfoBk;
end;

procedure TPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
  Close;
end;

procedure TPrincipal.FormShow(Sender: TObject);
begin
  Tlogin.exibirLogin();

  if AcessoController.UsuarioLogado <> nil then
  begin
    sttPrincipal.Panels [3].Text := ' '+ AcessoController.UsuarioLogado.Nome;
  end;

end;

procedure TPrincipal.TimerTimer(Sender: TObject);
begin
  sttPrincipal.Panels [1].Text := ' '+formatdatetime ('dddd","dd" de "mmmm" de "yyyy',now);// para data
  sttPrincipal.Panels [2].Text := ' '+formatdatetime ('hh:mm:ss',now);//para hora
End;

initialization
  lcdSistemaController.AcessoController := TAcessoController.Create();

end.
