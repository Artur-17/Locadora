unit lcdLibStrings;

interface

uses
  SysUtils, Classes, DB;

type
  TLibStrings = class
  private
  public
    class function RemoverCaracteres(texto: string): string; static;
    class function TextoContemPalavras(texto: string; palavras: string; divisor: char = ' '): Boolean; static;
    class function TextoContemAlgumaPalavra(texto, palavras: string; divisor: char = ' '): Boolean; static;
  end;

implementation

{ TLibStrings }

class function TLibStrings.RemoverCaracteres(texto: string): string;
var
  i: integer;
const
  ESPECIAIS    = '�������������������������������Ǻ�';
  EQUIVALENTES = 'aaaaeeeioooouuucAAAAEEEIOOOOUUUCoa';
begin
  for i := 1 to Length(texto) do
    if (Pos(texto[i], ESPECIAIS) <> 0) then
      texto[i] := char(EQUIVALENTES[Pos(texto[i], ESPECIAIS)]);

  Result := texto;
end;

class function TLibStrings.TextoContemPalavras(texto, palavras: string;
  divisor: char = ' '): Boolean;
var
  i: Integer;
  lPalavras: TStringList;
begin
  Result := True;
  lPalavras := TStringList.Create();

  try
    texto := LowerCase(RemoverCaracteres(texto));

    lPalavras.Delimiter := divisor;
    lPalavras.DelimitedText := LowerCase(RemoverCaracteres(palavras));

    for i := 0 to Pred(lPalavras.Count) do
    begin
      if (Trim(lPalavras[i]) = '') then
        continue;

      Result := (Pos(lPalavras[i], texto) > 0);

      if (not Result) then
        break;
    end;
  finally
    FreeAndNil(lPalavras);
  end;
end;

class function TLibStrings.TextoContemAlgumaPalavra(texto, palavras: string;
  divisor: char = ' '): Boolean;
var
  i: Integer;
  lPalavras: TStringList;
begin
  Result := true;
  lPalavras := TStringList.Create();

  try
    texto := LowerCase(RemoverCaracteres(texto));

    lPalavras.Delimiter := divisor;
    lPalavras.DelimitedText := LowerCase(RemoverCaracteres(palavras));

    for i := 0 to Pred(lPalavras.Count) do
    begin
      if (Trim(lPalavras[i]) = '') then
        continue;

      Result := (Pos(lPalavras[i], texto) > 0);

      if Result then
        break;
    end;
  finally
    FreeAndNil(lPalavras);
  end;
end;

end.
