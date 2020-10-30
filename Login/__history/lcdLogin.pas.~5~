unit lcdLogin;

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
  dxSkinXmas2008Blue, ExtCtrls, StdCtrls, cxButtons, dxGDIPlusClasses;

type
  TLogin = class(TForm)
    lblLogin: TLabel;
    btnOk: TcxButton;
    edtLogin: TEdit;
    imgLogin: TImage;
    edtSenha: TEdit;
    lblSenha: TLabel;
    btnFechar: TcxButton;
    procedure btnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    fFechar : boolean;
  public
    { Public declarations }
    class procedure exibirLogin();
  end;

var
  Login: TLogin;

implementation

{$R *.dfm}

{ TLogin }

procedure TLogin.btnFecharClick(Sender: TObject);
begin
  fFechar:= true;
  Application.Terminate;
end;

procedure TLogin.btnOkClick(Sender: TObject);
begin
  fFechar := true;
  Close;
end;

class procedure TLogin.exibirLogin;
var
  lcadastro : TLogin;
begin
  lcadastro := TLogin.Create(nil);
  lcadastro.ShowModal();
  FreeAndNil(lcadastro);
end;

procedure TLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := fFechar;
end;

procedure TLogin.FormShow(Sender: TObject);
begin
  fFechar := false;
end;

end.
