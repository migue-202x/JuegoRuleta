unit LO_Colas;

{
* Estructura lineal de tipo FIFO (First In First Out), es decir,
el primero en entrar a la cola, también el primero en salir.

* Este TDA utiliza la libreria Libreria Operacional de "Simple Enlace", donde:

  - Se inserta siempre al final: Por eso Encolar le parametriza a la lista simple el ultimo elemento
  - Se elimina siempre el primer elemento
  - Se captura siempre al frente: Por eso Frente captura de la lista el primer elemento

}

interface
  uses

  LO_ListaSimpleEnlace, Lib_Auxiliar;

type

 TipoRegDatos = LO_ListaSimpleEnlace.TipoRegDatos;
 TipoRegControl = LO_ListaSimpleEnlace.TipoRegControl;

 tCola = LO_ListaSimpleEnlace.tLsEnlace;

procedure CrearCola(var Me:tCola;NombreControl:string;NombreDatos:string; Ruta:String); {1}
procedure AbrirCola(var Me:tCola); {2}
procedure CerrarCola(var Me:tCola); {3}
procedure DestruirCola(var ME:tCola); {4}
function  ColaVacia(var Me:tCola):boolean; {5}
procedure Frente(var Me:tCola; var reg:tiporegdatos); {6}
procedure Decolar(var me:tCola); {7}
procedure Encolar(var me:tCola; reg:tiporegdatos); {8}
procedure InicializarRegBandera(var Reg:tiporegDatos); {9}
function ClaveNula(var me:tCola): TClave; {10}
function Buscar(var Me:tCola; Clave:TClave):boolean; {11}




implementation

{----------------------------------------(1)----------------------------------------}
procedure CrearCola(var Me:tCola;NombreControl:string;NombreDatos:string; Ruta:String);
begin
 //Creo estructura cola con el metodo de crear de la lista simple
 LO_ListaSimpleEnlace.CrearListaSimple(me,NombreControl,NombreDatos,ruta);
end;

{----------------------------------------(2)----------------------------------------}

procedure AbrirCola(var Me:tCola);
begin
//Abro la cola invocando al procedimiento abrir de la lista simple
 LO_ListaSimpleEnlace.AbrirListaSimple(me);
end;

{----------------------------------------(3)----------------------------------------}

procedure CerrarCola(var Me:tCola);
begin
//Cierro la cola invocando al procedimiento cerrar de la lista simple
  LO_ListaSimpleEnlace.CerrarListaSimple(me);
end;


{----------------------------------------(4)----------------------------------------}
procedure DestruirCola(var ME:tCola);
begin
//Destruyo la cola invocando al procedimiento destruir de la lista simple
  LO_ListaSimpleEnlace.DestruirListaSimple(me);
end;

{----------------------------------------(5)----------------------------------------}
function  ColaVacia(var Me:tCola):boolean;
 begin
 //Consulto si la cola esta vacia. Devuelve verdadero si la cola esta vacia
  ColaVacia:= LO_ListaSimpleEnlace.ListaSimpleVacia(me);
 end;

{----------------------------------------(6)----------------------------------------}
procedure Frente(var Me:tCola; var reg:tiporegdatos);
 begin
 //Con Frente capturo siempre el primer elemento de la cola, por eso le paso la posicion del primer elemento de la lista
  LO_ListaSimpleEnlace.CapturarInfo_LSimple(me,LO_ListaSimpleEnlace.Primero(me),reg);
 end;

{----------------------------------------(7)----------------------------------------}
 procedure Decolar(var me:tCola);
 begin
 //Al decolar, le paso por parametrizo la posicion nula de la lista (-1) para que elimine el primer elemento
  LO_ListaSimpleEnlace.EliminarInfo_LSimple(me,LO_ListaSimpleEnlace.Posnula(me));
 end;


{----------------------------------------(8)----------------------------------------}
procedure Encolar(var me:tCola; reg:tiporegdatos);
 begin
  //Al encolar se inserta siempre al final, por eso le paso la ultima posicion de la lista
  LO_ListaSimpleEnlace.InsertarInfo_LSimple(me,reg,LO_ListaSimpleEnlace.Ultimo(me));
 end;


{----------------------------------------(9)----------------------------------------}
procedure InicializarRegBandera(var Reg:tiporegDatos);
 begin
  //Creo un registro nulo que servira de 'Bandera' para poder recorrer la cola
  Reg.Clave:=Lib_Auxiliar.ClaveNula;
  Reg.Siguiente:=Lib_Auxiliar.PosNula;
  Reg.PosEnDatos:= Lib_Auxiliar.PosNula;
 end;


{----------------------------------------(10)----------------------------------------}
 function ClaveNula(var me:tCola): TClave;
 begin
 //Devuelve la clave nula de la estructura de lista simple
   claveNula:= LO_ListaSimpleEnlace.ClaveNula(ME);
 end;




{----------------------------------------(11)----------------------------------------}
function Buscar(var Me:tCola; Clave:TClave):boolean;
var
 regBandera,reg:tiporegdatos;
 corte,enc:boolean;

begin
//Se encola un registro bandera para cortar recorrido cuando en el ciclo se topa con el mismo
//Se encontro clave si enc = true

 corte:=false;
 enc:=false;

 //Inicializo registro bandera
 InicializarRegBandera(regBandera);
 //Encolo el registro bandera
 Encolar(me,regBandera);

 while not corte do
  begin
    Frente(me,reg);
    Decolar(me);

    if clave = reg.Clave then
      enc:=true;

    if reg.Clave <> Lib_Auxiliar.ClaveNula then
      Encolar(me,reg)
    else
      corte:=true;
  end;

  Buscar:= enc;
end;

{-----------------------------------------------------------------------------------}
END.
