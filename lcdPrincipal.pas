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
  dxSkinWhiteprint, dxSkinXmas2008Blue, Enter, lcdCadastroFuncionario;

type
  TPrincipal = class(TForm)
    In�cio: TdxRibbonTab;
    dxRibbon1: TdxRibbon;
    dxbrmngr1: TdxBarManager;
    dxbrCadastro: TdxBar;
    btnFilme: TdxBarLargeButton;
    btnCliente: TdxBarLargeButton;
    btnUsuario: TdxBarLargeButton;
    sttPrincipal: TStatusBar;
    Timer: TTimer;
    procedure TimerTimer(Sender: TObject);
    procedure btnFilmeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnUsuarioClick(Sender: TObject);
  private
    { Private declarations }

    TeclaEnter : TMREnter;
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

uses
  lcdLocalizarFilme;

{$R *.dfm}



procedure TPrincipal.btnFilmeClick(Sender: TObject);
begin
  TLocalizarFilme.exibirLocalizarFilme();
end;

procedure TPrincipal.btnUsuarioClick(Sender: TObject);
begin
  TCadastroFuncionario.exibirCadastroFuncionario();
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

procedure TPrincipal.TimerTimer(Sender: TObject);
begin
  sttPrincipal.Panels [1].Text := ' '+formatdatetime ('dddd","dd" de "mmmm" de "yyyy',now);// para data
  sttPrincipal.Panels [2].Text := ' '+formatdatetime ('hh:mm:ss',now);//para hora
End;

end.
