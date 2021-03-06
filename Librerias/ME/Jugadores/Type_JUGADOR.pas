unit Type_JUGADOR;

interface


USES
  Sysutils, dateutils;


Const
  _clave_nula_archivo='00000000';

TYPE
  tClave = string[8];
  tString = string [40];
  tContrasenia = string[15];
  tFecha = TDateTime;
  tTipoJugador = boolean; // true = jugador real ... false = jugador ficticio
  tEstadoJugador = boolean; // true = jugador conectado ... false = jugador no conectado
  tBloqueado = boolean; //true = bloqueado ... false = no bloqueado


  tRegDatos = Record
      Nick: tclave;
      Contrasenia: tContrasenia;
      Nombre, Apellido: tString;
      Alta: tFecha;
      UltimaConexion: tFecha;
      TipoJugador: tTipoJugador;
      Estado: tEstadoJugador;
      Bloqueado: tbloqueado;
   end;

  tArchDatos = File Of tRegDatos;

implementation

end.





