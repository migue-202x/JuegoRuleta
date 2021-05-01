unit Type_JUEGO;

interface


Const
    MaximaApuesta = 1000; //es el importe máximo de una apuesta. Por defecto 1000 pesos.
    MinimaApuesta = 50; //es el importe mínimo de una apuesta. Por defecto 50 pesos.

Type
     tImporte = 0..maxint;
     tClave = string[6];
     tFecha = TDateTime;
     tEstados = -1..4; //Juego no creado(-1)/ Juego creado(0)/ Hagan sus apuestas(1)/ no va mas(2)/ bolilla tirada (3)/ premios repartidos y fin de juego(4);
     tBolilla = -1..36; //identifica a la bolilla que ha salido. Se inicializa en -1 (no ha salido la bolilla)

     TipoRegControlJuego = record
                      MaximaApuesta, MinimaApuesta: tImporte;
                    end;

    tipoArchControlJuego = File of TipoRegControlJuego;

	  TipoRegDatos = Record
                      NroJugada: TClave;
                      FechaHora: tFecha;
                      Estado: tEstados;
                      Bolilla: tBolilla;  
			          end;


    TipoArchivoDatos = File Of TipoRegDatos;

implementation

END.
