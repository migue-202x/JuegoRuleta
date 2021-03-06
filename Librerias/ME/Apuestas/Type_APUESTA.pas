unit Type_APUESTA;

interface

USES
  Sysutils;

CONST
  //Nomencladores
 Nom_Rojonegro = 'RN';
 Nom_ParImpar= 'PI';
 Nom_PasaFalta= 'PF';
 Nom_Docena= 'DO';
 Nom_Columna= 'CO';
 Nom_Pleno= 'XX';

TYPE
  tClaveApuesta = string[8];
  tNomenclador = string[2];
  tValor = string[2];
  tImporte = 0..maxint;


	TipoRegDatos = Record
                      NroJugada:tClaveApuesta;
                      Nick:tClaveApuesta;
                      Nomenclador: tNomenclador;
                      Valor: tValor;
                      Importe: tImporte;
			          end;

  TipoArchDatos = File Of TipoRegDatos;

implementation

end.
