unit LO_ListaParcialDobleEnlace;

{
  Esta Libreria Operacional cuenta solo con un archivo de datos,
  donde el control (primero, ultimo borrado) de dicho archivo es parametrizado
}

interface

USES
  Lib_Auxiliar, SysUtils;

TYPE
    TipoRegControl= Record
                    Primero:TPos;
                    Ultimo:TPos;
                    Borrado: TPos;
                  end;

    TipoRegDatos = Record
                    Ant,Sig:TPos;
                    Clave: TClave;
                    PosEnDatos:tPos;
                  end;


    TipoArchivoDatos = File Of TipoRegDatos;
    TipoArchivoControl = File Of TipoRegControl;

    //'Lista doble parcial' cuenta solo con un archivo de datos
    tLdParcial = Record
                    D:TipoArchivoDatos;
                  End;

Procedure CrearLdParcial (var Me:tLdParcial; Nombre:String; Ruta:String); {1}
procedure AbrirLdParcial (var Me: tLdParcial); {2}
procedure CerrarLdParcial (var Me: tLdParcial); {3}
procedure DestruirLdParcial (var Me: tLdParcial); {4}
Procedure InsertarInfo_LdParcial (var Me:tLdParcial; Reg :TipoRegDatos; Pos:TPos; var RegControl:tipoRegControl); {5}
procedure EliminarInfo_LdParcial (var Me:tLdParcial; Pos:TPos; var RegControl:TipoRegControl); {6}
procedure ModificarInfo_LdParcial (var Me:tLdParcial; Pos:TPos; Reg:TipoRegDatos); {7}
Function BuscarInfo_LdParcial(var Me:tLdParcial;Clave:TClave;Var pos:TPos;var RegControl:TipoRegControl):Boolean; {8}
procedure CapturarInfo_LdParcial (var Me:tLdParcial; Pos:TPos; var Reg:TipoRegDatos); {9}
function Primero (var Me:tLdParcial; RegControl:TipoRegControl): TPos; {10}
function Ultimo (var Me:tLdParcial; RegControl:TipoRegControl): TPos; {11}
Function Anterior (var Me:tLdParcial; Pos:TPos):TPos; {12}
function Proximo (var Me:tLdParcial; Pos:TPos):TPos; {13}
function LdParcialVacia (var Me:tLdParcial; RegControl:TipoRegControl):boolean; {14}
function PosNula (var Me:tLdParcial): TPos; {15}
function ClaveNula (var Me:tLdParcial): TClave; {16}
procedure InicializarCabecera (var regControl: TipoRegControl); {17}

Implementation

{----------------------------------------(1)----------------------------------------}

Procedure CrearLdParcial (var Me:tLdParcial; Nombre:String; Ruta:String);
Var
	FaltaDatos:Boolean;
Begin
	AssignFile(Me.D,Ruta+Nombre);
  AssignFile(Me.D,Ruta+Nombre);
	{$i-}
 	Reset(Me.D); FaltaDatos:=(ioResult<>0);
  if (FaltaDatos) then
    begin
		  Rewrite(Me.D);
		  Close(Me.D);
    end;
	{$i+}
End;

{----------------------------------------(2)----------------------------------------}

Procedure AbrirLdParcial (var Me: tLdParcial);
begin
  reset (Me.D);
end;

{----------------------------------------(3)----------------------------------------}

Procedure CerrarLDParcial (var Me: tLdParcial);
begin
  Close (Me.D);
end;

{----------------------------------------(4)----------------------------------------}

Procedure DestruirLdParcial (var Me: tLdParcial);
begin
  Erase (Me.D);
end;

{----------------------------------------(5)----------------------------------------}

Procedure InsertarInfo_LdParcial (var Me:tLdParcial; Reg :TipoRegDatos; Pos:TPos; var RegControl:tipoRegControl); //Se inserta a lo ultimo
var
RegAux,RegAntAux,RegBorrado:TipoRegDatos;
PosNueva,posAnt:TPos;
begin
  if RegControl.Borrado = Lib_Auxiliar.Posnula then //No hay borrados
   PosNueva:=FileSize(Me.D)
    else
      begin //si hay borrados
        seek(Me.D,RegControl.Borrado); Read(Me.D,RegBorrado);
        PosNueva:= RegControl.Borrado; //PosNueva sera el primer elemento de la lista de borrados
        RegControl.Borrado:= RegBorrado.Sig;
      end;

  If (RegControl.Primero=Lib_Auxiliar.posnula) Then //Lista vacia
    Begin
      RegControl.Primero:=PosNueva;
      RegControl.Ultimo:=PosNueva;
      Reg.Sig:=Lib_Auxiliar.PosNula;
      Reg.Ant:=Lib_Auxiliar.PosNula;
    end
  else
    If RegControl.Primero=pos then //Inserto al principio
      Begin
        Reg.Sig:=RegControl.Primero;
        Reg.Ant:=Lib_Auxiliar.PosNula;
        seek(Me.D,RegControl.Primero); read(Me.D,RegAux);
        RegAux.Ant:=PosNueva;
        seek(Me.D,RegControl.Primero); write(Me.D,RegAux);
        RegControl.Primero:=PosNueva;
      end
    else
      If(Pos=Lib_Auxiliar.posnula) then //Inserto al final
        Begin
          seek(Me.D,RegControl.Ultimo); read(Me.D,RegAux);
          RegAux.Sig:=PosNueva;
          Reg.Sig:=Lib_Auxiliar.PosNula;
          Reg.Ant:=RegControl.Ultimo;
          RegControl.Ultimo:=PosNueva;
          seek(Me.D,Reg.Ant); write(Me.D,RegAux);
        End
      Else //Inserto al medio
        Begin
          Seek(Me.D,Pos); Read(Me.D,RegAux); //Leo reg en Pos
          Reg.Sig:=pos; //El nuevo registro tendra como siguiente al actual en que se encuentra en Pos
          PosAnt:=RegAux.ant;
          Reg.Ant:=PosAnt;
          Seek(Me.D, PosAnt); Read(Me.D, RegAntAux); //Leo el anterior a reg que se encuentra en Pos
          //Actualizo los enlances para que apunten al nuevo registro
          RegAntAux.Sig:=PosNueva;
          RegAux.Ant:=PosNueva;
          Seek(Me.D,PosAnt); Write(Me.D,RegAntAux); //Actualizo el anterior con el nuevo enlace siguiente a Posnueva
          Seek(Me.D,Pos); Write(Me.D,RegAux); //Actualizo Raux con el nuevo enlaces anterior a PosNueva
        end;
   //Grabo registro en la posNueva
    Seek(Me.D,Posnueva); Write(Me.D,Reg);
end;


{----------------------------------------(6)----------------------------------------}

Procedure EliminarInfo_LdParcial (var Me:tLdParcial; Pos:TPos; var RegControl:TipoRegControl);
var
  RegAux,RegAuxSig,RegAuxAnt:TipoRegDatos;
  PosNueva,posant:TPos;
begin

  seek(Me.D,Pos); read(Me.D,RegAux);

  If (RegControl.Primero=pos) and (RegControl.Ultimo=Pos) Then //Lista vacia
      Begin
        RegControl.Primero:=Lib_Auxiliar.Posnula;
        RegControl.Ultimo:=Lib_Auxiliar.Posnula;
      end
      else
        If RegControl.Primero=pos then //Se elimina al principio
          Begin
            seek(Me.D,RegAux.sig); read(Me.D,RegAuxSig);
            RegAuxSig.Ant:=Lib_Auxiliar.Posnula;
            seek(Me.D,RegAuxSig.sig); write(Me.D,RegAuxSig);
            RegControl.Primero:=RegAux.Sig;
          end
          else
            If(Pos=RegControl.Ultimo) then //Se elimina al final
              Begin
                seek(Me.D,RegAux.Ant); read(Me.D,RegAuxAnt);
                RegAuxAnt.Sig:=Lib_Auxiliar.Posnula;
                RegControl.Ultimo:=RegAux.Ant;
                seek(Me.D,RegAux.Ant); write(Me.D,RegAuxAnt);
              End
              Else //Se elimina al medio
                Begin
                  seek(Me.D,RegAux.Sig); read(Me.D,RegAuxSig);
                  seek(Me.D,RegAux.Ant); read(Me.D,RegAuxAnt);
                  RegAuxAnt.Sig:=RegAux.Sig;
                  RegAuxSig.Ant:=RegAux.Ant;
                  seek(Me.D,RegAux.Sig); write(Me.D,RegAuxSig);
                  seek(Me.D,RegAux.Ant); write(Me.D,RegAuxAnt);
                end;
  RegAux.Ant:=-1;
  //Pila de borrados
  RegAux.Ant:= Lib_Auxiliar.Posnula;
  RegAux.Sig:= RegControl.Borrado;
  RegControl.Borrado:= Pos;
  //Grabo registro borrado
  seek(Me.D,pos); write(Me.D,RegAux);
end;

{----------------------------------------(7)----------------------------------------}
Procedure ModificarInfo_LdParcial (var Me:tLdParcial; Pos:TPos; Reg:TipoRegDatos);
begin
  seek(Me.D,Pos); write(Me.D,Reg);
end;

{----------------------------------------(8)----------------------------------------}

Function BuscarInfo_LdParcial (var Me:tLdParcial;Clave:TClave;Var pos:TPos;var RegControl:TipoRegControl):Boolean;
Var
	Enc, corte:Boolean;
	Reg:TipoRegDatos;
  rc:TipoRegControl;

Begin
	Pos:=RegControl.Primero;
  Enc:=False;
  corte:=false;

  //Busco clave en lista, si no lo encuentra devuelve la posicion donde deberia estar
	While ((Not Enc) And (Pos<>Lib_Auxiliar.posNula) and not corte) Do
  Begin
			seek(Me.D,Pos); read(Me.D,Reg);
			IF (reg.Clave=Clave) Then
				Enc:=true
			Else
        begin
          if Clave < reg.Clave then
            corte:=true
          else
            Pos:=Reg.Sig;
        end;
  End;
	BuscarInfo_LdParcial:=Enc;

End;


{----------------------------------------(9)----------------------------------------}

Procedure CapturarInfo_LdParcial (var Me:tLdParcial; Pos:TPos; var Reg:TipoRegDatos);
begin
  seek(Me.D,Pos); read(Me.D,reg);
end;

{----------------------------------------(10)----------------------------------------}

Function Primero (var Me:tLdParcial; RegControl:TipoRegControl): TPos;
begin
   Primero:=RegControl.Primero;
end;

{----------------------------------------(11)----------------------------------------}

Function Ultimo (var Me:tLdParcial; RegControl:TipoRegControl): TPos;
begin
   Ultimo:=RegControl.Ultimo;
end;

{----------------------------------------(12)----------------------------------------}

Function Anterior (var Me:tLdParcial; Pos:TPos):TPos;
var
  Reg: TipoRegDatos;
begin
  seek(Me.D,Pos); read(Me.D,Reg);
  Anterior:=Reg.Ant;
end;

{----------------------------------------(13)----------------------------------------}

Function Proximo (var Me:tLdParcial; Pos:TPos):TPos;
var
Reg: TipoRegDatos;
begin
  seek(Me.D,Pos); read(Me.D,Reg);
  Proximo:=Reg.Sig;
end;

{----------------------------------------(14)----------------------------------------}

Function LdParcialVacia (var Me:tLdParcial; RegControl:TipoRegControl):boolean;
begin
  LdParcialVacia := (RegControl.Primero = Lib_Auxiliar.Posnula);
end;

{----------------------------------------(15)----------------------------------------}

Function PosNula (var Me:tLdParcial): TPos;
begin
  posNula:=Lib_Auxiliar.posnula;
end;

{----------------------------------------(16)----------------------------------------}

Function ClaveNula (var Me:tLdParcial): TClave;
begin
  ClaveNula:=Lib_Auxiliar.ClaveNula;
end;

{----------------------------------------(17)----------------------------------------}

Procedure InicializarCabecera (var regControl: TipoRegControl);
begin
  regcontrol.Primero:= -1;
  regcontrol.Ultimo:= -1;
  regcontrol.Borrado:= -1;
end;

END.
