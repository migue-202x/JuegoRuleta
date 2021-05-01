unit Type_GANADOR;

interface

USES
  Sysutils;

CONST
//Valor del premio segun el nomenclador
  Prem_Cero = 0.5;
  Prem_Rojonegro = 1;
  Prem_ParImpar= 1;
  Prem_PasaFalta= 1;
  Prem_Docena= 2;
  Prem_Columna= 2;
  Prem_Pleno= 35;

TYPE

  tNomenclador = string[2];
  tNumero = -1..36;
  tImporte = 0..maxint;
  tNumeroJugada = 0.. maxint;

  TipoRegDatos = Record
                      Nomenclador:tNomenclador;
                      Numero: tNumero; //Solo si el nomenclador es pleno (XX) el resto -1
                      Importe: tImporte;
                      NroJugada: tNumeroJugada;
			          end;


	TipoArchivoDatos = File Of TipoRegDatos;


implementation

end.
 