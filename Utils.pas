unit Utils;

interface

uses
  windows,Classes, Registry,DB;

type
  TUtils = class
    private

    public
      class function LerValorRegistro(pChave :string; pTipo : TFieldType) :variant;
      class procedure GravarValorRegistro(pChave: string; pValor: variant;pTipo: TFieldType);
  end;
implementation


{ TUtils }

class function TUtils.LerValorRegistro(pChave: string; pTipo: TFieldType) : variant;
var
  lReg: TRegistry;
begin
  lReg := TRegistry.Create;
  try
    lReg.RootKey := HKEY_LOCAL_MACHINE;

    lReg.OpenKey('Software\Locadora', True);

    case pTipo of
      ftString : begin
                   Result  := lReg.ReadString(pChave);
                 end;

      ftBoolean : Result  := lReg.ReadBool(pChave);
      ftInteger : Result  := lReg.ReadInteger(pChave);
      ftDateTime : Result  := lReg.ReadDateTime(pChave);
    end;
  finally
    lReg.CloseKey;
    lReg.Free;
  end;
end;



class procedure TUtils.GravarValorRegistro(pChave: string; pValor : variant; pTipo: TFieldType);
var
  lReg: TRegistry;
begin
  lReg := TRegistry.Create;
  try
    lReg.RootKey := HKEY_LOCAL_MACHINE;

    lReg.OpenKey('Software\Locadora', True);

    case pTipo of
      ftString   : lReg.writeString(pChave, pValor);
      ftBoolean  : lReg.writeBool(pChave, pValor );
      ftInteger :  lReg.writeInteger(pChave, pValor);
      ftDateTime : lReg.writeDateTime(pChave, pValor);
    end;
  finally
    lReg.CloseKey;
    lReg.Free;
  end;
end;

end.
