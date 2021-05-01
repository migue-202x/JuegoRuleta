unit Form_Listados;

interface

uses
  ME_JUGADORES,
  Type_JUGADOR,
  ME_CTACTE,
  Type_ALMACEN,
  ME_JUEGO,
  Type_JUEGO,
  ME_APUESTAS,
  Type_APUESTA,
  ME_GANADORES,
  Type_GANADOR,
  Lib_Auxiliar,
  Lib_AuxJuego,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids;

type
  TF_Listados = class(TForm)
    Panel_gralListados: TPanel;
    BitBtn1: TBitBtn;
    Grid_ListadoxFiltro: TStringGrid;
    Panel_filtro: TPanel;
    Lbl_tittle: TLabel;
    Panel_Nomenclador: TPanel;
    Lbl_Nomenclador: TLabel;
    Cbox_Nomenclador: TComboBox;
    Panel_CantJugadores: TPanel;
    Lbl_cantJugadores: TLabel;
    Cbox_Cantidad: TComboBox;
    Panel_nickJugador: TPanel;
    Edit_NickJugador: TEdit;
    Btn_aceptar: TBitBtn;
    Lbl_NickJugador: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Lbl_NameJugador: TLabel;
    Lbl_FechaIngreso: TLabel;
    Lbl_PremiosAcumulados: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cbox_CantidadSelect(Sender: TObject);
    procedure Cbox_NomencladorSelect(Sender: TObject);
    procedure Btn_aceptarClick(Sender: TObject);
    procedure Grid_ListadoxFiltroDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Listados: TF_Listados;
  opListado: integer;

implementation

uses  
  Form_croupier, Form_Jugadores, Form_login;

{$R *.dfm}

{--------------------------------------------------------------------------------}

procedure TF_Listados.BitBtn1Click(Sender: TObject);
begin
  F_Listados.Close;
end;

{--------------------------------------------------------------------------------}

procedure TF_Listados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if AdminLog then
    F_Croupier.Enabled:= true
  else
  begin
    F_Jugadores.Enabled:= true;
    Lib_AuxJuego.limpiarGrid(Grid_ListadoxFiltro);

    if (OpListado = 2) then
      Cbox_Nomenclador.ItemIndex:= -1;

    if (OpListado = 3) then
      Cbox_Cantidad.ItemIndex:= -1;

    if (OpListado = 5) then
      Edit_NickJugador.Clear;
  end;
end;

{--------------------------------------------------------------------------------}

procedure TF_Listados.FormCreate(Sender: TObject);
begin
  self.Position := poScreenCenter;

  Lbl_Nomenclador.Caption:= 'Seleccione nomenclador' + #10#13 + 'para filtrar.';
  Lbl_cantJugadores.Caption:= 'Seleccione cantidad' + #10#13 + 'para filtrar.';
  Lbl_NickJugador.Caption:= 'INGRESE NICK DE UN JUGADOR';
end;


{--------------------------------------------------------------------------------}

procedure TF_Listados.FormShow(Sender: TObject);
begin
  if AdminLog then
    F_Croupier.Enabled:= false
  else
    F_Jugadores.Enabled:= false;

  Lib_AuxJuego.limpiarGrid(Grid_ListadoxFiltro);
  Grid_ListadoxFiltro.RowCount:= 1;
  Panel_Nomenclador.Hide;
  Panel_CantJugadores.Hide;
  Panel_nickJugador.Hide;
  Cbox_Nomenclador.ItemIndex:= Lib_Auxiliar.PosNula;

    case (OpListado) of
    1: begin //Listado General de Usuarios (jugadores)
      Lbl_tittle.Caption:='Listado general de jugadores';
      Lib_AuxJuego.EncabezadoDetalladoJugadores(Grid_ListadoxFiltro);
      Grid_ListadoxFiltro.RowCount:=1;
      Lib_AuxJuego.ListadoGeneral_JugadoresEnGrid(ME_JUGADORES.Raiz(ME_JUGADOR), Grid_ListadoxFiltro);
      Grid_ListadoxFiltro.FixedRows:=1;
    end;
    2:begin ////jugadores que ganaron determinado premio seleccionando nomenclador
      Lbl_tittle.Caption:='Jugadores que ganaron determinado premio';
      Panel_Nomenclador.Show;
      Cbox_Nomenclador.ItemIndex:= Lib_Auxiliar.PosNula;
      Lib_AuxJuego.EncabezadoGanadoresXPremio(Grid_ListadoxFiltro);
    end;
    3:begin //<n> jugadores que más dinero ganaron a través del tiempo.
      Lbl_tittle.Caption:='Jugadores que más dinero ganaron a través del tiempo';
      Panel_CantJugadores.Show;
      Cbox_Cantidad.ItemIndex:= Lib_Auxiliar.PosNula;
      Lib_AuxJuego.EncabezadoJugadoresMasGanaron(Grid_ListadoxFiltro);
    end;
    4:begin //jugadores que nunca ganaron apuestas.
      Lbl_tittle.Caption:='Jugadores que nunca ganaron apuestas';
      Lib_AuxJuego.EncabezadoDetalladoJugadores(Grid_ListadoxFiltro);
      Grid_ListadoxFiltro.RowCount:=1;
      Lib_AuxJuego.ListadoJugadoresNuncaGanaron(ME_JUGADORES.Raiz(ME_JUGADOR), Grid_ListadoxFiltro);
      Grid_ListadoxFiltro.FixedRows:=1;
    end;
    5:begin //Ficha de un jugador. Ingresando nick podra listar su cta cte con todos sus movimientos ordenados por fecha y hora de manera cronologia ascendente
      Lbl_tittle.Caption:='Ficha de un Jugador';
      Lib_AuxJuego.EncabezadoFiltroCtaCte(Grid_ListadoxFiltro);
      Panel_nickJugador.show;
      Lbl_NameJugador.Caption:= '';
      Lbl_FechaIngreso.Caption:= '';
      Lbl_PremiosAcumulados.Caption:= '';
      Edit_NickJugador.Clear;
      Edit_NickJugador.SetFocus;
    end;  //Listado general de todas las partidas jugadas hasta el momento
    6:begin
      Lbl_tittle.Caption:='Listado general de partidas';
      Lib_AuxJuego.EncabezadoListadoPartidas(Grid_ListadoxFiltro);
      Grid_ListadoxFiltro.RowCount:=1;
      Lib_AuxJuego.ListadoPartidas(Grid_ListadoxFiltro);
      Grid_ListadoxFiltro.FixedRows:=1;
    end;
    7:begin //Listado de arbol balanceado de Jugadores
      Lbl_tittle.Caption:='Listado Árbol Binario AVL de Jugadores';
      EncabezadoArbolJugadores(Grid_ListadoxFiltro);
      Grid_ListadoxFiltro.RowCount:=1;
      Lib_AuxJuego.ListadoArbolJugadores(ME_JUGADORES.Raiz(ME_JUGADOR), Grid_ListadoxFiltro);
      Grid_ListadoxFiltro.FixedRows:=1;
    end;
    8:begin //Listado de arbol balanceado de Ganadores
      Lbl_tittle.Caption:='Listado Árbol Trinario AVL de Ganadores';
      Lib_AuxJuego.EncabezadoArbolJugadores(Grid_ListadoxFiltro);
      Grid_ListadoxFiltro.RowCount:=1;
      Lib_AuxJuego.ListadoArbolGanadores(ME_GANADORES.Raiz(ME_GANADOR), Grid_ListadoxFiltro);
      Grid_ListadoxFiltro.FixedRows:=1;
    end;
    9:begin //Listado de jugadores que se encuentran activos (activos = logueados)
      Lbl_tittle.Caption:='Listado Jugadores Activos';
      Lib_AuxJuego.EncabezadoDetalladoJugadores(Grid_ListadoxFiltro);
      Grid_ListadoxFiltro.RowCount:=1;
      Lib_AuxJuego.Listado_JugadoresActivos(ME_JUGADORES.Raiz(ME_JUGADOR), Grid_ListadoxFiltro);
      Grid_ListadoxFiltro.FixedRows:=1;
    end;
    end;//case
end;

{--------------------------------------------------------------------------------}

procedure TF_Listados.Btn_aceptarClick(Sender: TObject);
var
  Nick: tClave;
  cantPremios: tCantidad;
  Monto: tImporte;
begin
  Nick:= UpperCase(Edit_NickJugador.Text);
  cantPremios:= 0;
  Monto:= 0;

   if not (ME_JUGADORES.BuscarInfoME_Jugadores(ME_JUGADOR,PosJugador, Nick)) then
   begin //Nick incorrecto
    MessageDlg('Nick ingresado no existe!',mtError , [mbOK], 0);
    Edit_NickJugador.Clear;
    Edit_NickJugador.SetFocus;
   end
   else
    begin
      ME_JUGADORES.CapturarInfoME_Jugadores(ME_JUGADOR, regjugador, PosJugador);
      Lbl_NameJugador.Caption:= regjugador.Nick;
      Lbl_FechaIngreso.Caption:= DatetoStr(regJugador.Alta);

      //Llamo a procedimiento recursivo que acumula en monto y cantidad los premios que gano
      Lib_AuxJuego.Premios_AcumuladosXJugador(ME_GANADORES.Raiz(ME_GANADOR), Nick, cantPremios, Monto);
      Lbl_PremiosAcumulados.Caption:= intTostr(cantPremios) + ' PREMIOS POR ' +intTostr(monto);

      //Llamo a procedimiento recursivo para que muestre los movimientos de ctacte de un jugador
      Grid_ListadoxFiltro.RowCount:=1;
      Lib_AuxJuego.ListadoCtaCte_deUnJugador(ME_CTACTE.PrimeroLdParcial(ME_CUENTACORRIENTE,Nick), Nick, Grid_ListadoxFiltro);
      Grid_ListadoxFiltro.FixedRows:=1;

      Edit_NickJugador.Clear;
      Edit_NickJugador.SetFocus;
    end;
end;

{--------------------------------------------------------------------------------}

procedure TF_Listados.Grid_ListadoxFiltroDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  with (Sender as TStringGrid) do
    begin
      if (ARow = 0)
      then
        begin
          Canvas.Brush.Color := clBtnFace;
          Canvas.TextRect(Rect, Rect.Left + (Rect.Right - Rect.Left - Canvas.TextWidth(Grid_ListadoxFiltro.Cells[ACol,ARow]) + 1) div 2, Rect.Top + 2, Grid_ListadoxFiltro.Cells[ACol,ARow]);
        end
      else
      begin
        Canvas.Font.Color := clblack;
        if  (ARow mod 2 = 0)
        then
          Canvas.Brush.Color := $00E1FFF9
        else
          Canvas.Brush.Color := $00FFEBDF;
        Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, cells[acol, arow]);
        Canvas.FrameRect(Rect);
      end;
    end;
end;

{--------------------------------------------------------------------------------}

procedure TF_Listados.Cbox_CantidadSelect(Sender: TObject);
var
  num:tCantidad;
  importe: tImporte;
  cantFilas, cantGanadores: integer;
begin
  importe:= 0;
  num:= strToint(Cbox_Cantidad.Text);
  cantFilas:= 1;

  if not (ME_GANADORES.MeVacio_Ganadores(ME_GANADOR)) then
    begin
      cantGanadores:= ME_GANADORES.Cantidad_Ganadores(ME_GANADOR);
      if (num<=cantGanadores) then
      begin
      Grid_ListadoxFiltro.RowCount:=1;
      Lib_AuxJuego.ListadoMasPremiados(ME_GANADORES.Raiz(ME_GANADOR), importe, Grid_ListadoxFiltro, cantFilas);
      Grid_ListadoxFiltro.FixedRows:=1;

      Grid_ListadoxFiltro.RowCount:=1;
      Lib_AuxJuego.ReordenarMasPremiados(Grid_ListadoxFiltro, num, cantFilas);
      Grid_ListadoxFiltro.FixedRows:=1;
      end
      else
        MessageDlg('TENGA PRESENTE QUE : ' +#13+#13 + 'La máxima cantidad a flitrar es de ' + intTostr(cantGanadores) + ' ganadores!', mtWarning, [mbOK], 0);
    end;
end;

{--------------------------------------------------------------------------------}

procedure TF_Listados.Cbox_NomencladorSelect(Sender: TObject);
var
  nomenclador: tNomenclador;
  cantGanadores: tCantidad;
begin
  nomenclador:= Cbox_Nomenclador.Text;
  cantGanadores:= 0; 

  Lib_AuxJuego.CantGanadores_xNomenclador(ME_GANADORES.Raiz(ME_GANADOR), nomenclador, cantGanadores);

  if (cantGanadores>0) then
  begin
    Grid_ListadoxFiltro.RowCount:=1;
    Lib_AuxJuego.ListadoPremiados_Nomenclador(ME_GANADORES.Raiz(ME_GANADOR), nomenclador, Grid_ListadoxFiltro);
    Grid_ListadoxFiltro.FixedRows:=1;
  end
  else
    MessageDlg('NO HAY GANADORES : ' +#13+#13 + 'No hay ganadores con el nomenclador ' + nomenclador, mtInformation, [mbOK], 0);
end;

{--------------------------------------------------------------------------------}

END.
