unit lcdDataModule;

interface

uses
  SysUtils, Classes, DB, MemDS, DBAccess, Uni, UniProvider, InterBaseUniProvider;

type
  TdtmPrincipal = class(TDataModule)
    conexao: TUniConnection;
    tblFilme: TUniTable;
    InterBaseUniProvider1: TInterBaseUniProvider;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmPrincipal: TdtmPrincipal;

implementation

{$R *.dfm}

end.
