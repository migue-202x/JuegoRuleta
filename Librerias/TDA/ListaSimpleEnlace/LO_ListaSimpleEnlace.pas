unit LO_ListaSimpleEnlace;

interface

USES
  Lib_Auxiliar;

TYPE
     TipoRegDatos = record
                     Clave:Tclave;
                     Siguiente:TPos;
                     PosEnDatos: TPos;
                    end;


     TipoRegControl = record
                       Primero,Ultimo,Borrado :TPos;
                      end;

     TipoArchDatos = file of TipoRegDatos;
     TipoArchControl = file of TiporegControl;

     tLsEnlace = record
               D: tipoArchDatos;
               C: tipoArchControl;
              end;

procedure CrearListaSimple(var Me:tLsEnlace;NombreControl:String;NombreDatos:String; Ruta:String); {1}
procedure AbrirListaSimple(var Me:tLsEnlace); {2}
procedure CerrarListaSimple(var Me:tLsEnlace); {3}
procedure DestruirListaSimple(var Me:tLsEnlace); {4}
procedure InsertarInfo_LSimple(var Me:tLsEnlace; reg:TipoRegDatos; Pos:TPos); {5}
procedure EliminarInfo_LSimple(var Me:tLsEnlace; pos:TPos); {6}
procedure ModificarInfo_LSimple(var Me:tLsEnlace; pos:TPos; reg:tiporegdatos); {7}
function BuscarInfo_LdSimple(var Me:tLsEnlace; Clave:Tclave; var Pos :TPos):boolean; {8}
procedure CapturarInfo_LSimple(var ME:tLsEnlace; pos:TPos; var Reg:TipoRegDatos); {9}
function Primero(var Me:tLsEnlace):TPos; {10}
function Ultimo(var Me:tLsEnlace):TPos; {11}
function Proximo(var Me:tLsEnlace; pos:TPos):TPos; {12}
function ListaSimpleVacia(me:tLsEnlace):boolean; {13}
function Posnula(var Me:tLsEnlace):TPos; {14}
function ClaveNula(var Me:tLsEnlace):tClave; {15}





implementation

{----------------------------------------(1)----------------------------------------}

procedure CrearListaSimple(var Me:tLsEnlace;NombreControl:String;NombreDatos:String; Ruta:String);
 Var
	ioD, ioC:integer;
  rc:TipoRegControl;
Begin
//Vinculacion de las variable ME con los archivos fisicos
  assign(Me.C, Ruta + NombreControl);
  Assign(Me.D, Ruta + NombreDatos);
	{$i-}
  //Si IoResult es cero, la operacion es exitosa
	Reset(Me.C); ioC:=IoResult;
  Reset(Me.D); ioD:=IoResult;

	if ((ioD<>0) or (ioC<>0)) then
    begin
      Rewrite(Me.D);
      Rewrite(Me.C);
      //Inicializo variables de control
		  Rc.Primero:=Lib_Auxiliar.PosNula;
		  Rc.Ultimo:=Lib_Auxiliar.PosNula;
      Rc.Borrado:=Lib_Auxiliar.Posnula;

      Write(Me.C,Rc);

		  Close(Me.D);
		  Close(Me.C);
    end;
	{$i+}
End;

{----------------------------------------(2)----------------------------------------}

procedure AbrirListaSimple(var Me:tLsEnlace);
begin
  reset(me.D);
  reset(me.C);
end;

{----------------------------------------(3)----------------------------------------}

procedure CerrarListaSimple(var Me:tLsEnlace);
begin
  close(me.D);
  close(me.C);
end;

{----------------------------------------(4)----------------------------------------}

procedure DestruirListaSimple(var Me:tLsEnlace);
begin
  erase(me.D);
  erase(me.C);
end;

{----------------------------------------(5)----------------------------------------}


procedure InsertarInfo_LSimple(var Me:tLsEnlace; reg:TipoRegDatos; Pos:tpos);
var
 rc:tiporegcontrol;
 regAnt:tiporegdatos;
 posNueva:tpos;
begin
   seek(me.C,0); read(me.C,rc); //Leo cabecera de control

   if rc.Borrado = Lib_Auxiliar.PosNula then  //No hay borrados
    posnueva:= filesize(me.D)
   else //hay borrados
    begin
      seek(me.D,rc.Borrado); read(me.D,regant);
      posnueva:= rc.Borrado; //PosNueva sera el primer elemento de la lista de borrados
      rc.Borrado:= regant.Siguiente;
    end;

   if rc.Primero = Lib_Auxiliar.PosNula then //Lista vacia
    begin
     rc.Primero:=posnueva;
     rc.Ultimo:= posnueva;
     reg.Siguiente:= Lib_Auxiliar.PosNula;
    end
     else
      if pos = Lib_Auxiliar.PosNula then //Inserto al principio
       begin
        reg.Siguiente:= rc.Primero;
        rc.Primero:= posnueva;
       end
        else
         if pos = rc.Ultimo then //Inserto al final
          begin
           seek(me.D,pos); read(me.D,regant);
           regant.Siguiente:= posnueva;
           reg.Siguiente:= Lib_Auxiliar.PosNula;
           rc.Ultimo:= posnueva;
           seek(me.D,pos); write(me.D,regant);
          end
           else //Inserto al medio
            begin
             seek(me.D,pos); read(me.D,regant);
             reg.Siguiente:= regant.Siguiente;
             regant.Siguiente:= posnueva;
             seek(me.D,pos); write(me.D,regant);
            end;

   //Grabo registro en la posNueva y cabecera de control actualizado
   seek(me.D,posnueva); write(me.D,reg);
   seek(me.C,0); write(me.C,rc);
end;


{----------------------------------------(6)----------------------------------------}

procedure EliminarInfo_LSimple(var Me:tLsEnlace; pos:tpos);
var
 rc:tiporegcontrol;
 RegAnt,regaelim:tiporegdatos;
 posaux:tpos;

begin
  seek(me.C,0); read(me.C,rc);

  if pos = Lib_Auxiliar.PosNula then  //Elimino el primer elemento
  begin
    seek(me.D,rc.Primero); read(me.D,regaelim);
    posaux:= rc.Primero;
    rc.Primero:= regaelim.Siguiente;

    if rc.Primero = Lib_Auxiliar.PosNula then  //Ahora la lista esta vacia
    rc.Ultimo:= Lib_Auxiliar.PosNula;
  end
    else
      begin
        seek(me.D,pos); read(me.D,RegAnt);
        posaux:= RegAnt.Siguiente;
        seek(me.D,posaux); read(me.D,regaelim);

        if rc.Ultimo = RegAnt.Siguiente then
           rc.Ultimo := pos;

        RegAnt.Siguiente:= regaelim.Siguiente;
        regaelim.Siguiente:=Lib_Auxiliar.PosNula;

        seek(me.D,pos); write(me.D,RegAnt);
      end;

  regaelim.Siguiente:= rc.Borrado;
  rc.Borrado:=posaux;

  seek(me.D,posaux); write(me.D,regaelim);
  seek(me.C,0); write(me.C,rc);
end;

{----------------------------------------(7)----------------------------------------}

procedure ModificarInfo_LSimple(var Me:tLsEnlace; pos:tpos; reg:tiporegdatos);
 begin
  seek(Me.D,pos); write(Me.D,reg);
 end;

{----------------------------------------(8)----------------------------------------}

function BuscarInfo_LdSimple(var Me:tLsEnlace; Clave:Tclave; var Pos :tPos):boolean;
var
 posaux:tPos;
 corte,encontrado:boolean;
 reg:tipoRegDatos;
 rc:tiporegControl;

 begin
  //Busco clave en lista, si no lo encuentra devuelve la posicion donde deberia estar
  corte:=false;
  encontrado:=false;

  seek(me.C,0); read(me.C,rc);
  posaux:= rc.Primero;
  pos:= Lib_Auxiliar.PosNula;

  while (posaux <> Lib_Auxiliar.PosNula) and not (Corte) and not (encontrado) do
   begin
      seek(me.D,posaux); read(me.D,reg);

      if reg.Clave = clave then
       encontrado:= true
        else
         if reg.Clave > Clave then
          corte:=true
         else
          begin
           pos:= posaux;
           posaux:= reg.Siguiente;
          end;
   end;
  BuscarInfo_LdSimple:= encontrado;
 end;

{----------------------------------------(9)----------------------------------------}

procedure CapturarInfo_LSimple(var ME:tLsEnlace; pos:tPos; var Reg:TipoRegDatos);
 begin
   seek(me.D,pos); read(me.D,reg);
 end;

{----------------------------------------(10)----------------------------------------}

function Primero(var Me:tLsEnlace):tPos;
var
 rc:tiporegcontrol;
 begin
  seek(me.C,0); read(me.C,rc);
  Primero:= rc.Primero; //Posicion del primer elemento en la lista
 end;
 
{----------------------------------------(11)----------------------------------------}

function Ultimo(var Me:tLsEnlace):tPos;
var
 rc:tiporegcontrol;
 begin
  seek(me.C,0); read(me.C,rc);
  Ultimo:= rc.Ultimo; //Posicion del ultimo elemento en la lista
 end;

{----------------------------------------(12)----------------------------------------}

function Proximo(var Me:tLsEnlace; pos:tPos):tPos;
var reg:tipoRegDatos;
 begin
  seek(me.D,pos); read(me.D,reg);
  Proximo:= reg.Siguiente; //Posicion del proximo elemento en pos parametrizado
 end;

{----------------------------------------(13)----------------------------------------}

function ListaSimpleVacia(me:tLsEnlace):boolean;
var
 rc:tiporegcontrol;
 begin
   seek(me.C,0); read(me.C,rc);
   ListaSimpleVacia := (rc.Primero = Lib_Auxiliar.PosNula);
 end;

{----------------------------------------(14)----------------------------------------}

function Posnula(var Me:tLsEnlace):TPos;
 begin
   Posnula:= Lib_Auxiliar.PosNula;
 end;


{----------------------------------------(15)----------------------------------------}

function ClaveNula(var Me:tLsEnlace):tClave;
 begin
   ClaveNula:= Lib_Auxiliar.ClaveNula;
 end;

END.
