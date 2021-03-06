program TPO_ProgramacionII_2018;

uses
  Forms,
  Form_Login in 'Formularios\Form_Login.pas' {F_Login},
  LO_ArbolAVL in '..\Librerias\TDA\ArbolAVL\LO_ArbolAVL.pas',
  Lib_Auxiliar in '..\Librerias\ME\Auxiliar\Lib_Auxiliar.pas',
  ME_JUGADORES in '..\Librerias\ME\Jugadores\ME_JUGADORES.pas',
  Type_JUGADOR in '..\Librerias\ME\Jugadores\Type_JUGADOR.pas',
  ME_CTACTE in '..\Librerias\ME\CuentaCorriente\ME_CTACTE.pas',
  Type_ALMACEN in '..\Librerias\ME\CuentaCorriente\Type_ALMACEN.pas',
  LO_Hash in '..\Librerias\TDA\Hash\LO_Hash.pas',
  Type_Hash in '..\Librerias\TDA\Hash\Type_Hash.pas',
  ME_JUEGO in '..\Librerias\ME\Juego\ME_JUEGO.pas',
  Type_JUEGO in '..\Librerias\ME\Juego\Type_JUEGO.pas',
  LO_Colas in '..\Librerias\TDA\Colas\LO_Colas.pas',
  LO_ListaSimpleEnlace in '..\Librerias\TDA\ListaSimpleEnlace\LO_ListaSimpleEnlace.pas',
  ME_APUESTAS in '..\Librerias\ME\Apuestas\ME_APUESTAS.pas',
  Type_APUESTA in '..\Librerias\ME\Apuestas\Type_APUESTA.pas',
  ME_GANADORES in '..\Librerias\ME\Ganadores\ME_GANADORES.pas',
  Type_GANADOR in '..\Librerias\ME\Ganadores\Type_GANADOR.pas',
  LO_ArbolTrinario in '..\Librerias\TDA\ArbolTrinario\LO_ArbolTrinario.pas',
  Form_Croupier in 'Formularios\Form_Croupier.pas' {F_Croupier},
  Form_Jugadores in 'Formularios\Form_Jugadores.pas' {F_Jugadores},
  Form_PanelCaseButtons in 'Formularios\Form_PanelCaseButtons.pas' {F_PanelCaseButtons},
  Form_Apostar in 'Formularios\Form_Apostar.pas' {F_Apostar},
  Form_PanelFicticios in 'Formularios\Form_PanelFicticios.pas' {F_PanelFicticios},
  Lib_AuxJuego in 'Lib_AuxJuego\Lib_AuxJuego.pas',
  Form_Premios in 'Formularios\Form_Premios.pas' {F_Premios},
  Form_Listados in 'Formularios\Form_Listados.pas' {F_Listados},
  Form_Juego in 'Formularios\Form_Juego.pas' {F_Juego},
  LO_ListaDobleEnlace in '..\Librerias\TDA\ListaDobleEnlace\LO_ListaDobleEnlace.pas',
  LO_ListaParcialDobleEnlace in '..\Librerias\TDA\ListaParcialDobleEnlace\LO_ListaParcialDobleEnlace.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TF_Login, F_Login);
  Application.CreateForm(TF_Croupier, F_Croupier);
  Application.CreateForm(TF_Jugadores, F_Jugadores);
  Application.CreateForm(TF_Juego, F_Juego);
  Application.CreateForm(TF_PanelCaseButtons, F_PanelCaseButtons);
  Application.CreateForm(TF_Apostar, F_Apostar);
  Application.CreateForm(TF_PanelFicticios, F_PanelFicticios);
  Application.CreateForm(TF_PanelFicticios, F_PanelFicticios);
  Application.CreateForm(TF_Premios, F_Premios);
  Application.CreateForm(TF_Listados, F_Listados);
  Application.CreateForm(TF_Listados, F_Listados);
  Application.CreateForm(TF_Juego, F_Juego);
  Application.Run;
end.
