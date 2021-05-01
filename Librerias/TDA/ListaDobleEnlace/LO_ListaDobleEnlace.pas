unit LO_ListaDobleEnlace;

interface
uses
  Lib_Auxiliar;

Type


	TipoRegDatos = Record
                      Ant,Sig:TPos;
                      Clave: TClave;
                      PosenDatos: TPos;
			          end;

	TipoRegControl= Record
				                Primero:TPos;
                        Ultimo:TPos;
                        Borrado: TPos;
			            end;

  TipoArchivoDatos = File Of TipoRegDatos;
	TipoArchivoControl = File of TipoRegControl;

	tListaDoble = Record
                      C:TipoArchivoControl;
				              D:TipoArchivoDatos;
			            End;

Procedure CrearLd (Var Me:tListaDoble; Nombre:String; Ruta:string); {1}
procedure AbrirLd   (var Me: tListaDoble); {2}
procedure CerrarLd  (var Me: tListaDoble); {3}
procedure DestruirLista (var Me: tListaDoble); {4}
function ListaVacia(me:tListaDoble):boolean; {5}
Procedure Insertar (var Me:tListaDoble; Reg :TipoRegDatos;Pos:TPos); {6}
procedure Eliminar(var Me:tListaDoble; Pos:TPos); {7}
procedure Capturar(var Me:tListaDoble; Pos:TPos; var Reg:TipoRegDatos); {8}
procedure Modificar(var Me:tListaDoble; Pos:TPos; Reg:TipoRegDatos); {9}
function Primero(var Me:tListaDoble): TPos; {10}
function Ultimo(var Me:tListaDoble): TPos; {11}
function PosNula(var Me:tListaDoble): TPos; {12}
function ClaveNula(var Me:tListaDoble): TClave; {13}
Function Anterior(var Me:tListaDoble; Pos:TPos):TPos; {14}
function Proximo(var Me:tListaDoble; Pos:TPos):TPos; {15}
Function Buscar(var Me:tListaDoble;Clave:TClave;Var pos:TPos):Boolean; {16}

Implementation

uses Math,SysUtils,Forms;

Var

Me:tListaDoble;

{--------------------------------------------------------------------------------}

Procedure CrearLd (Var Me:tListaDoble; Nombre:String; Ruta:string);
Var
	FaltaControl:Boolean;
	FaltaDatos:Boolean;
  rc:TipoRegControl;
Begin
//Vinculacion de la variable ME con los archivos fisicos
 	AssignFile(Me.C,ruta+Nombre+'.CON');
 	AssignFile(Me.D,ruta+Nombre+'.DAT');
	{$i-}
	Reset(Me.C);
	FaltaControl:=(Ioresult<>0);
	Reset(Me.D);
	FaltaDatos:=(ioResult<>0);
  //Si alguno no existe, los creo nuevamente vacios
	If ((faltaControl) or (FaltaDatos)) then
    begin
      Rewrite(Me.C);
		  Rc.Primero:=Lib_Auxiliar.PosNula;
		  Rc.Ultimo:=Lib_Auxiliar.PosNula;
      Rc.Borrado:=Lib_Auxiliar.Posnula;
      Write(Me.C,Rc);
		  Rewrite(Me.D);

		  Close(Me.D);
		  Close(Me.C);
    end;
	{$i+}
End;

{--------------------------------------------------------------------------------}

procedure AbrirLD (var Me: tListaDoble);
begin
  //Abro los archivos
  reset (Me.D);
  reset (Me.C);
end;

{--------------------------------------------------------------------------------}

procedure CerrarLD (var Me: tListaDoble);
begin
  //Cierro los archivos
  Close (Me.D);
  Close (Me.C);
end;

{--------------------------------------------------------------------------------}

procedure DestruirLista (var Me: tListaDoble);
begin
  //Destruyo los archivos
  Erase (Me.D);
  Erase (Me.C);
end;

{--------------------------------------------------------------------------------}

function ListaVacia(me:tListaDoble):boolean;
var
 rc:tiporegcontrol;
begin
//Funcion que devuleve verdadero si es que que la lista esta vacia y falso si no es asi
 seek(me.C,0); read(me.C,rc);
 ListaVacia := (rc.Primero = Lib_Auxiliar.posnula);
end;

{--------------------------------------------------------------------------------}

Procedure Insertar(var Me: tListaDoble; Reg: TipoRegDatos; Pos: TPos);
// Se inserta a lo ultimo
var
  rc: TipoRegControl;
  Raux, RauxAnt, RegBorr: TipoRegDatos;
  PosNueva, posant: TPos;
begin
  { Dada una posición inserta un nuevo registro en la lista }
  seek(Me.C, 0); read(Me.C, rc);

  if rc.Borrado = Lib_Auxiliar.PosNula then // No hay registros borrados
    PosNueva:= FileSize(Me.D) // Uso el fin de archivo
  else
    begin
      // capturo el primer borrado
      seek(Me.D, rc.Borrado); Read(Me.D, RegBorr);
      PosNueva:= rc.Borrado;
      // el primer elemento de la lista de borrados pasa a ser siguiente
      rc.Borrado:= RegBorr.Sig;
    end;

  If (rc.Primero = Lib_Auxiliar.PosNula) Then // La lista esta vacia
  Begin
    rc.Primero:= PosNueva;
    rc.Ultimo:= PosNueva;
    Reg.Sig:= Lib_Auxiliar.PosNula;
    Reg.Ant:= Lib_Auxiliar.PosNula;
  end
  else If rc.Primero = Pos then // Inserto al principio
    Begin
      Reg.Sig:= rc.Primero;
      Reg.Ant:= Lib_Auxiliar.PosNula;

      seek(Me.D, rc.Primero); Read(Me.D, Raux);
      Raux.Ant:= PosNueva;
      seek(Me.D, rc.Primero); Write(Me.D, Raux);
      rc.Primero:= PosNueva;
    end
    else If (Pos = Lib_Auxiliar.PosNula) then // Inserto al final
      Begin
        seek(Me.D, rc.Ultimo); Read(Me.D, Raux);

        Raux.Sig:= PosNueva;
        Reg.Sig:= Lib_Auxiliar.PosNula;
        Reg.Ant:= rc.Ultimo;

        rc.Ultimo:= PosNueva;
        seek(Me.D, Reg.Ant); Write(Me.D, Raux);
      End
      Else // Inserto al medio
        Begin
          // Leo el registro que se encuentra en Pos
          seek(Me.D, Pos); Read(Me.D, Raux);
          // El nuevo registro tendra como siguiente al actual en "Pos"
          Reg.Sig:= Pos;
          // Capturo la posicion del anterior al registro de Raux
          posant:= Raux.Ant;
          // El nuevo registro (Reg) tendra como anterior al anterior del registro que "desplaza"
          Reg.Ant:= posant;
          // Leo el anterior a la posicion parametrizada "Pos" y capturo ese registro
          seek(Me.D, posant); Read(Me.D, RauxAnt);
          // Actualizo los enlances para que apunten al nuevo registro
          RauxAnt.Sig:= PosNueva;
          Raux.Ant:= PosNueva;
          //Actualizo el anterior con el nuevo enlace siguiente a Posnueva
          seek(Me.D, posant); Write(Me.D, RauxAnt);
          // Actualizo Raux con el nuevo enlaces anterior a PosNueva
          seek(Me.D, Pos); Write(Me.D, Raux);
        end;

  // Gravo los registros de control y el registro parametrizado con los enlaces actualizados
  seek(Me.D, PosNueva); Write(Me.D, Reg);
  seek(Me.C, 0); Write(Me.C, rc);
end;

{--------------------------------------------------------------------------------}

procedure Eliminar(var Me: tListaDoble; Pos: TPos);
var
  rc: TipoRegControl;
  Raux, RauxAdy, RauxAdy2: TipoRegDatos;
  PosNueva, posant: TPos;
begin
  seek(Me.C, 0); read(Me.C, rc);
  seek(Me.D, Pos); Read(Me.D, Raux);
  If (rc.Primero = Pos) and (rc.Ultimo = Pos) Then // Esta vacio1
  Begin
    rc.Primero:= Lib_Auxiliar.PosNula;
    rc.Ultimo:= Lib_Auxiliar.PosNula;
  end
  else If rc.Primero = Pos then // Elimino al principio1
    Begin
      seek(Me.D, rc.Primero); Read(Me.D, RauxAdy);
      RauxAdy.Ant:= Lib_Auxiliar.PosNula;
      seek(Me.D, rc.Primero); Write(Me.D, RauxAdy);
      rc.Primero:= Raux.Sig;
    end
    else
      If (Pos = rc.Ultimo) then // Elimino al final1
      Begin
        seek(Me.D, Raux.Ant); Read(Me.D, RauxAdy);
        RauxAdy.Sig:= Lib_Auxiliar.PosNula;

        rc.Ultimo:= Raux.Ant;
        seek(Me.D, Raux.Ant); Write(Me.D, RauxAdy);
      End
      Else // Elimino al medio
        Begin
          seek(Me.D, Raux.Sig); Read(Me.D, RauxAdy);
          seek(Me.D, Raux.Ant); Read(Me.D, RauxAdy2);

          RauxAdy2.Sig:= Raux.Sig;
          RauxAdy.Ant:= Raux.Ant;

          seek(Me.D, Raux.Sig); Write(Me.D, RauxAdy);
          seek(Me.D, Raux.Ant); Write(Me.D, RauxAdy2);
        end;
        Raux.Ant:= -1;

  // Grabo el archivo de control
  seek(Me.C, 0); Write(Me.C, rc);
end;

{--------------------------------------------------------------------------------}

procedure Capturar (var Me:tListaDoble; Pos:TPos; var Reg:TipoRegDatos);
begin
  Seek(Me.D,Pos);
  Read(Me.D,reg);
end;

{--------------------------------------------------------------------------------}

procedure Modificar(var Me:tListaDoble; Pos:TPos; Reg:TipoRegDatos);
var
  Rd:TipoRegDatos;
begin
//Dada una posicion cambio los enlaces hacia el nuevo registro y el viejo lo dejo 'suelto'
  Seek(Me.D,Pos); Read(Me.D,Rd);
  Reg.Ant:=Rd.Ant;
  Reg.Sig:=Rd.Sig;
  Seek(Me.D,Pos); Write(Me.D,Reg);
end;

{--------------------------------------------------------------------------------}

function Primero(var Me:tListaDoble): TPos;
var
  Rc:TipoRegControl;
begin
//Devuelve la posicion directa del primer elemento de la lista
   seek(Me.C,0); read(Me.C,Rc);
   Primero:=Rc.Primero;
end;

{--------------------------------------------------------------------------------}

function Ultimo(var Me:tListaDoble): TPos;
var
  Rc:TipoRegControl;
begin

//Devuelve la posicion de la ultima posicion
   seek(Me.C,0); read(Me.C,Rc);
   Ultimo:=Rc.Ultimo;
end;

{--------------------------------------------------------------------------------}

function PosNula(var Me:tListaDoble): TPos;
begin

//Posicion nula de la lista
  posNula:=Lib_Auxiliar.posnula;
end;

{--------------------------------------------------------------------------------}

function ClaveNula(var Me:tListaDoble): TClave;
begin
//Clave nula del TDA
  ClaveNula:=Lib_Auxiliar.ClaveNula;
end;

{--------------------------------------------------------------------------------}

function Proximo(var Me:tListaDoble; Pos:TPos):TPos;
var
Reg: TipoRegDatos;
begin
//Dada una posicion devuelve la posicion siguiente a ella
  Seek(Me.D,Pos); Read(Me.D,Reg);
  Proximo:=Reg.Sig;
end;

{--------------------------------------------------------------------------------}

Function Anterior(var Me:tListaDoble; Pos:TPos):TPos;
var
  Reg: TipoRegDatos;
begin
//Dada una posicion devuelve la posicion anterior a ella
  Seek(Me.D,Pos); Read(Me.D,Reg);
  Anterior:=Reg.Ant;
end;

{--------------------------------------------------------------------------------}

Function Buscar(var Me:tListaDoble;Clave:TClave;Var pos:TPos):Boolean;
Var
	Encontrado:Boolean;
	Reg:TipoRegDatos;
  rc:TipoRegControl;

Begin
  //Recorre la lista y dad una clave devulve si la encontro o no. Si no la encuentra devuelve la posicion donde deveria estar
  Seek(Me.C,0); Read(Me.C,Rc);
  Pos:=Rc.Primero;
  Encontrado:=False;

  While ((Not Encontrado) And (Pos<>Lib_Auxiliar.posNula)) Do
    Begin
      Seek(Me.D,Pos); Read(Me.D,Reg);
      IF ((reg.Clave=Clave)) Then
        Encontrado:=true
      Else
        Begin
          Pos:=Reg.Sig;
        end;
    End;
  Buscar:=Encontrado;
End;

{--------------------------------------------------------------------------------}

END.
