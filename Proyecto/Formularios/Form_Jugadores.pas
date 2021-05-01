unit Form_Jugadores;

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
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.Imaging.jpeg;

type
  TF_Jugadores = class(TForm)
    Menu_Jugadores: TMainMenu;
    Entraraljuego1: TMenuItem;
    Comprarcredito1: TMenuItem;
    Jugadoresactivos1: TMenuItem;
    Modificardatos1: TMenuItem;
    Cambiarcontrasea1: TMenuItem;
    SALIR1: TMenuItem;
    Panel1: TPanel;
    Panel_BajaModificacion: TPanel;
    caption_panelGral: TLabel;
    Panel_Botones1: TPanel;
    BtnModificacion: TButton;
    BtnBajas: TButton;
    Panel_Formulario: TPanel;
    Lab_apellido: TLabel;
    Lab_nombre: TLabel;
    Lab_nick: TLabel;
    Txt_Nombre: TEdit;
    Txt_NICK: TEdit;
    BtnOk: TBitBtn;
    BtnCancelar: TBitBtn;
    Txt_Apellido: TEdit;
    Btn_closePnelBM: TBitBtn;
    panel_CambioContrasenia: TPanel;
    btnCambiarContraseña: TBitBtn;
    Bit_ShowHide1: TBitBtn;
    Bit_ShowHide2: TBitBtn;
    Btn_closePnelAlterContrasenia: TBitBtn;
    panel_Compracredito: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnRecargar: TBitBtn;
    Txt_Saldo: TEdit;
    Btn_closePnelCredito: TBitBtn;
    lbEdit_Recarga: TEdit;
    Label4: TLabel;
    lbEdit_Contraseña: TEdit;
    Label5: TLabel;
    lbEdit_ConfirmContraseñaConf: TEdit;
    Label6: TLabel;
    Panel_EncabezadoUser: TPanel;
    Panel2: TPanel;
    Label7: TLabel;
    Panel15: TPanel;
    Label8: TLabel;
    Lbl_nickUser: TLabel;
    Panel16: TPanel;
    Label9: TLabel;
    Lbl_fechaUser: TLabel;
    Label10: TLabel;
    Lbl_horaUser: TLabel;
    Img_fondoJugadores: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Pantalla_InicioJugadores();
    procedure FormShow(Sender: TObject);
    procedure SALIR1Click(Sender: TObject);
    procedure Jugadoresactivos1Click(Sender: TObject);
    procedure Entraraljuego1Click(Sender: TObject);
    procedure BtnModificacionClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnBajasClick(Sender: TObject);
    procedure Modificardatos1Click(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure Txt_NombreKeyPress(Sender: TObject; var Key: Char);
    procedure Txt_ApellidoKeyPress(Sender: TObject; var Key: Char);
    procedure Cambiarcontrasea1Click(Sender: TObject);
    procedure lbEdit_ContraseñaKeyPress(Sender: TObject; var Key: Char);
    procedure lbEdit_ConfirmContraseñaConfKeyPress(Sender: TObject;
      var Key: Char);
    procedure Bit_ShowHide1Click(Sender: TObject);
    procedure Bit_ShowHide2Click(Sender: TObject);
    procedure btnCambiarContraseñaClick(Sender: TObject);
    procedure Comprarcredito1Click(Sender: TObject);
    procedure Btn_closePnelBMClick(Sender: TObject);
    procedure Btn_closePnelAlterContraseniaClick(Sender: TObject);
    procedure Btn_closePnelCreditoClick(Sender: TObject);
    procedure btnRecargarClick(Sender: TObject);
    procedure lbEdit_RecargaKeyPress(Sender: TObject; var Key: Char);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Jugadores: TF_Jugadores;

implementation

uses
  Form_login, Form_juego, Form_Listados;

VAR
  Opcion: char;

{$R *.dfm}



{------------------------------------------------------------------------------}

procedure TF_Jugadores.FormCreate(Sender: TObject);
begin
  self.Position := poScreenCenter;
  self.WindowState := wsMaximized;
end;

{------------------------------------------------------------------------------}

procedure TF_Jugadores.FormShow(Sender: TObject);
begin
  F_Jugadores.Pantalla_InicioJugadores();
end;

{------------------------------------------------------------------------------}

procedure TF_Jugadores.Entraraljuego1Click(Sender: TObject);
begin
  ME_JUEGO.RegistroNulo(regJuegoRuleta);
  ME_JUEGO.UltimaJugada(ME_JUEGORULETA, regJuegoRuleta);

  //busco y capturo jugador para verificar si esta bloqueado y a su vez para activarlo si ingresa al juego
  ME_JUGADORES.BuscarInfoME_Jugadores(ME_JUGADOR, posJugador, RegJugador.Nick);
  ME_JUGADORES.CapturarInfoME_Jugadores(ME_JUGADOR, regJugador, posJugador);

  //Solo podra entrar a la partida si el estado es igual 0 (Juego creado)
  if (regJuegoRuleta.Estado = 0) then
  begin
    //Podra entrar al juego sino esta bloquado
    if not(regJugador.Bloqueado) then
    begin
      F_Jugadores.Hide;
      //---------------
      regJugador.Nick:= regJugador.Nick;
      regJugador.Contrasenia:= regJugador.Contrasenia;
      regJugador.Nombre:= regJugador.Nombre;
      regJugador.Apellido:= regJugador.Apellido;
      regJugador.Alta:= regJugador.Alta;
      regJugador.UltimaConexion:= Now();
      regJugador.Bloqueado:= regJugador.Bloqueado;
      regJugador.Estado:= true; //se conecta al juego, lo activo

      ME_JUGADORES.ModificarInfoME_Jugadores(ME_JUGADOR, regJugador, posJugador);
      //---------------
      F_Juego.Show;
      F_Juego.refrezcarPantallaNormalUser();
    end
    else
      MessageDlg('USTED ESTA BLOQUEADO: No puede ingresar a ningun juego hasta que sea desbloqueado!',mtWarning , [mbOK], 0);
  end
  else
      MessageDlg('No puede ingresar aún. El juego no ha sido creado o está en curso!',mtWarning , [mbOK], 0);
end;

{------------------------------------------------------------------------------}


procedure TF_Jugadores.Jugadoresactivos1Click(Sender: TObject);
var
  Cant: tCantidad; // cantidad jugadores en general
  Cant_Activos: tCantidad; // cantidad de jugadores activos
begin
  Form_Listados.opListado:= 9;

  cant:= 0;
  Cant_Activos:= 0;

  cant:= ME_JUGADORES.Cantidad_Jugadores(ME_JUGADOR);
  Lib_AuxJuego.Cant_JugadoresActivos(ME_JUGADORES.Raiz(ME_JUGADOR), Cant_Activos);

   if (not ME_JUGADORES.MeVacio_Jugadores(ME_JUGADOR) and (cant>1)) then //si cant es >1 entonces al menos hay un jugador que no es el administrador
   begin
        //Si hay jugadores activos
      if (Cant_Activos>=1) then
        F_Listados.Show
      else
        MessageDlg('No hay jugadores activos!',mtWarning, [mbOK], 0);
    end
    else
      MessageDlg('No existen jugadores!!',mtWarning, [mbOK], 0);
end;

{------------------------------------------------------------------------------}

procedure TF_Jugadores.lbEdit_ConfirmContraseñaConfKeyPress(Sender: TObject;
  var Key: Char);
const
  CARAC_HABILITADOS = ['a'..'z', 'A'..'Z', '0'..'9', #0..#27];//solo letras, numero y borrar
begin
  if not (Key IN CARAC_HABILITADOS) then
    Key:=#0; //la tecla vale null si presiona caracteres no habilitados
end;

{------------------------------------------------------------------------------}

procedure TF_Jugadores.lbEdit_RecargaKeyPress(Sender: TObject; var Key: Char);
const
  CARAC_HABILITADOS = ['0'..'9', #0..#27];//solo numero y tecla borrar
begin
  if not (Key IN CARAC_HABILITADOS) then
    Key:=#0; //la tecla vale null si presiona caracteres no habilitados
end;

{------------------------------------------------------------------------------}

procedure TF_Jugadores.Modificardatos1Click(Sender: TObject);
var
  i: integer;
begin
  //Cuando usuario va a modificar sus datos, como lo que se muestra es un panel y no un formulario, debo dehabilitar el menu principal
  for i:=0 to menu_Jugadores.Items.Count-1 do
    menu_Jugadores.Items[I].Enabled:= false;

  panel_Compracredito.Hide;
  panel_CambioContrasenia.Hide;
  Panel_BajaModificacion.Show;
  Panel_Formulario.Enabled:= false;
  BtnModificacion.Enabled:= true;
  BtnBajas.Enabled:= true;

  ME_JUGADORES.BuscarInfoME_Jugadores(ME_JUGADOR,PosJugador,F_Jugadores.Txt_NICK.Text);
  ME_JUGADORES.CapturarInfoME_Jugadores(ME_JUGADOR,regJugador,PosJugador);

  F_Jugadores.Txt_Nombre.Text:= regJugador.Nombre;
  F_Jugadores.Txt_Apellido.Text:= regJugador.Apellido;
end;


{------------------------------------------------------------------------------}

procedure TF_Jugadores.Bit_ShowHide1Click(Sender: TObject);
begin
  if (lbEdit_Contraseña.PasswordChar = #0) then
  begin
    lbEdit_Contraseña.PasswordChar:='*';
    Bit_ShowHide1.Glyph.LoadFromFile(Lib_AuxJuego.rutaIconoOjoAbierto);
  end
  else
  begin
    lbEdit_Contraseña.PasswordChar:= #0;
    Bit_ShowHide1.Glyph.LoadFromFile(Lib_AuxJuego.rutaIconoOjoCerrado);
  end;
end;

{------------------------------------------------------------------------------}

procedure TF_Jugadores.Bit_ShowHide2Click(Sender: TObject);
begin
  if (lbEdit_ConfirmContraseñaConf.PasswordChar = #0) then
  begin
    lbEdit_ConfirmContraseñaConf.PasswordChar:='*';
    Bit_ShowHide2.Glyph.LoadFromFile(Lib_AuxJuego.rutaIconoOjoAbierto);
  end
  else
  begin
    lbEdit_ConfirmContraseñaConf.PasswordChar:= #0;
    Bit_ShowHide2.Glyph.LoadFromFile(Lib_AuxJuego.rutaIconoOjoCerrado);
  end;
end;

{------------------------------------------------------------------------------}

procedure TF_Jugadores.BtnBajasClick(Sender: TObject);
begin
    if Lib_AuxJuego.Mensaje_Confirmacion('MENSAJE DE CONFIRMACIÓN: ' + #13 + #13 + '¿Seguro que quiere darse de baja?') then
    begin
      //Cargo datos de ctacte
      RegCtaCte.Nick:= F_Jugadores.Txt_Nick.Text;
      RegCtaCte.FechaHora:= Now();
      RegCtaCte.Concepto:= Type_ALMACEN.tipoConceptos.Baja_cuenta;
      RegCtaCte.Debe:= 0;
      RegCtaCte.haber:= ME_CTACTE.SaldoAcumulado(ME_CUENTACORRIENTE, RegCtaCte.Nick);
      RegCtaCte.saldo:= 0;

      //inserto cuenta corriente
      ME_CTACTE.InsertarAlmacen(ME_CUENTACORRIENTE,RegCtaCte);
      ME_JUGADORES.BuscarInfoME_Jugadores(ME_JUGADOR,posJugador, F_Jugadores.Txt_NICK.Text);
      ME_JUGADORES.EliminarInfoME_Jugadores(ME_JUGADOR, posJugador);
      Showmessage('HA SIDO DADA DE BAJA: ' + #13 + #13 + 'Será redirigido a la página principal');

      F_Jugadores.Close;
      F_login.Show;
    end
    else
      Pantalla_InicioJugadores();
end;

{------------------------------------------------------------------------------}

procedure TF_Jugadores.btnCambiarContraseñaClick(Sender: TObject);
begin
//usuario va a cambiar su contrasenia
 if ((lbEdit_Contraseña.Text <> '') and (lbEdit_ConfirmContraseñaConf.Text <> '')) then
 begin
   if (lbEdit_Contraseña.Text = lbEdit_ConfirmContraseñaConf.Text) then
   begin
      if Lib_AuxJuego.Mensaje_Confirmacion('MENSAJE DE CONFIRMACIÓN: ' + #13 + #13 + '¿Seguro que cambiar su contraseña?') then
      begin
        ME_JUGADORES.BuscarInfoME_Jugadores(ME_JUGADOR,posJugador, F_Jugadores.Txt_NICK.Text);
        ME_JUGADORES.CapturarInfoME_Jugadores(ME_JUGADOR, regJugador, posJugador);
        regJugador.Contrasenia:= lbEdit_Contraseña.Text;
        ME_JUGADORES.ModificarInfoME_Jugadores(ME_JUGADOR, regJugador, posJugador);
        Pantalla_InicioJugadores();
        messagedlg('MODICICACIÓN CON ÉXITO: ' + #13 + #13 + 'Su contraseña ha sido modificada con éxito!', mtInformation, [mbOk], 0);
      end;
   end
   else
    begin
      MessageDlg('Las contraseñas deben ser iguales!',mtError , [mbOK], 0);
      lbEdit_Contraseña.Clear;
      lbEdit_ConfirmContraseñaConf.Clear;
      lbEdit_Contraseña.SetFocus;
    end;
 end
 else
  begin
    MessageDlg('Debe completar los dos campos!!',mtError , [mbOK], 0);
    if (lbEdit_Contraseña.Text = '') then
      lbEdit_Contraseña.SetFocus
    else
      lbEdit_ConfirmContraseñaConf.SetFocus
  end;
end;

{------------------------------------------------------------------------------}

procedure TF_Jugadores.BtnCancelarClick(Sender: TObject);
begin
  BtnModificacion.Enabled:=true;
  BtnBajas.Enabled:=true;
  Panel_Formulario.Enabled:= false;

  ME_JUGADORES.BuscarInfoME_Jugadores(ME_JUGADOR,PosJugador,F_Jugadores.Txt_NICK.Text);
  ME_JUGADORES.CapturarInfoME_Jugadores(ME_JUGADOR,regJugador,PosJugador);

  F_Jugadores.Txt_Nombre.Text:= regJugador.Nombre;
  F_Jugadores.Txt_Apellido.Text:= regJugador.Apellido;
end;

{------------------------------------------------------------------------------}

procedure TF_Jugadores.BtnModificacionClick(Sender: TObject);
begin
  Panel_Formulario.Enabled:= true;
  BtnBajas.Enabled:= false;
  F_Jugadores.Txt_Nombre.SetFocus;
end;

{------------------------------------------------------------------------------}

procedure TF_Jugadores.BtnOkClick(Sender: TObject);
begin
//usuario comun modifica sus datos
  if ((F_Jugadores.Txt_Nombre.Text <> '') and (F_Jugadores.Txt_Apellido.Text <> '')) then
  begin
      if Lib_AuxJuego.Mensaje_Confirmacion('MENSAJE DE CONFIRMACIÓN: ' + #13 + #13 + '¿Seguro que quiere modificar sus datos?') then
      begin
        ME_JUGADORES.BuscarInfoME_Jugadores(ME_JUGADOR,posJugador, F_Jugadores.Txt_NICK.Text);
        ME_JUGADORES.CapturarInfoME_Jugadores(ME_JUGADOR, regJugador, posJugador);
        regJugador.Nick:= regJugador.Nick;
        regJugador.Nombre:= F_Jugadores.Txt_Nombre.Text;
        regJugador.Apellido:= F_Jugadores.Txt_Apellido.Text;
        regJugador.TipoJugador:= regJugador.TipoJugador;
        regJugador.Estado:= regJugador.Estado;
        ME_JUGADORES.ModificarInfoME_Jugadores(ME_JUGADOR, regJugador, posJugador);
        Pantalla_InicioJugadores();
        messagedlg('MODICICACIÓN CON ÉXITO: ' + #13 + #13 + 'Sus datos han sido modificados con éxito!', mtInformation, [mbOk], 0);
      end
      else
        Pantalla_InicioJugadores();
  end
  else
    begin
      MessageDlg('Debe completar los dos campos!!',mtError , [mbOK], 0);
      if (F_Jugadores.Txt_Nombre.Text = '') then
        F_Jugadores.Txt_Nombre.SetFocus
      else
        F_Jugadores.Txt_Apellido.SetFocus
    end;
end;

{------------------------------------------------------------------------------}

procedure TF_Jugadores.btnRecargarClick(Sender: TObject);
begin
if (lbEdit_Recarga.Text<>'') then
    begin
      if (strtoint(lbEdit_Recarga.Text) >= ME_JUEGO.ApuestaMinima(ME_JUEGORULETA)) and (strtoint(lbEdit_Recarga.Text) <= ME_JUEGO.ApuestaMaxima(ME_JUEGORULETA)) then
      begin
        if Lib_AuxJuego.Mensaje_Confirmacion('¿Está seguro que quiere comprar $'+ lbEdit_Recarga.Text +' en créditos?') then
        begin
          regCtaCte.Nick:= RegJugador.Nick;
          regCtaCte.FechaHora:= Now();
          regCtaCte.Concepto:= Type_ALMACEN.tipoConceptos.Compra_Fichas;
          regCtaCte.Debe:= strToint(lbEdit_Recarga.Text);
          regCtaCte.haber:= 0;
          regCtaCte.saldo:= regCtaCte.Debe + ME_CTACTE.SaldoAcumulado(ME_CUENTACORRIENTE, RegJugador.Nick);
          ME_CTACTE.InsertarAlmacen(ME_CUENTACORRIENTE, RegCtaCte);
          lbEdit_Recarga.Clear;
          Pantalla_InicioJugadores();
          messagedlg('Compra relizada con éxito!', mtInformation, [mbOk], 0);
        end;
        lbEdit_Recarga.Clear;
        Pantalla_InicioJugadores();
      end
      else
        begin
          MessageDlg('El crédito minimo debe ser de $ ' +intTostr(ME_JUEGO.ApuestaMinima(ME_JUEGORULETA))+
                ', y el crédito máximo debe ser de $ ' +intTostr(ME_JUEGO.ApuestaMaxima(ME_JUEGORULETA)),mtWarning, [mbOK], 0);
          lbEdit_Recarga.Clear;
          lbEdit_Recarga.SetFocus;
        end;
    end;
end;

{------------------------------------------------------------------------------}

procedure TF_Jugadores.Btn_closePnelAlterContraseniaClick(Sender: TObject);
var
 i: integer;
begin
  panel_CambioContrasenia.Hide;

  for i:=0 to menu_Jugadores.Items.Count-1 do
    menu_Jugadores.Items[I].Enabled:= true;
end;

{------------------------------------------------------------------------------}

procedure TF_Jugadores.Btn_closePnelBMClick(Sender: TObject);
var
 i:integer;
begin
  Panel_BajaModificacion.Hide;
  for i:=0 to menu_Jugadores.Items.Count-1 do
    menu_Jugadores.Items[I].Enabled:= true;
end;

{------------------------------------------------------------------------------}

procedure TF_Jugadores.Btn_closePnelCreditoClick(Sender: TObject);
var
 i: integer;
begin
  panel_Compracredito.Hide;
  lbEdit_Recarga.Clear;

  for i:=0 to menu_Jugadores.Items.Count-1 do
    menu_Jugadores.Items[I].Enabled:= true;
end;

{------------------------------------------------------------------------------}

procedure TF_Jugadores.Cambiarcontrasea1Click(Sender: TObject);
var
 i: integer;
begin
  panel_Compracredito.Hide;
  Panel_BajaModificacion.Hide;
  panel_CambioContrasenia.Show;

  for i:=0 to menu_Jugadores.Items.Count-1 do
    menu_Jugadores.Items[I].Enabled:= false;

  lbEdit_Contraseña.Clear;
  lbEdit_ConfirmContraseñaConf.Clear;
  lbEdit_Contraseña.SetFocus;
end;

{------------------------------------------------------------------------------}

procedure TF_Jugadores.Comprarcredito1Click(Sender: TObject);
var
 i: integer;
begin
  panel_CambioContrasenia.Hide;
  Panel_BajaModificacion.Hide;
  panel_Compracredito.Show;

  for i:=0 to menu_Jugadores.Items.Count-1 do
    menu_Jugadores.Items[I].Enabled:= false;

  F_Jugadores.Txt_Saldo.Text:=intTostr(ME_CTACTE.SaldoAcumulado(ME_CUENTACORRIENTE, RegJugador.Nick));
  lbEdit_Recarga.SetFocus;
end;

{------------------------------------------------------------------------------}


procedure TF_Jugadores.Pantalla_InicioJugadores();
var
 i: integer;

begin
  Lbl_nickUser.Caption:= NickLogueado;
  F_Juego.ActualizarFechaHora(Lbl_fechaUser, Lbl_horaUser); //Actualizo fecha y hora a mostrar

  F_Jugadores.panel_Compracredito.Hide;
  F_Jugadores.panel_CambioContrasenia.Hide;
  F_Jugadores.Panel_BajaModificacion.Hide;

  ME_JUGADORES.BuscarInfoME_Jugadores(ME_JUGADOR,PosJugador,RegJugador.Nick);
  ME_JUGADORES.CapturarInfoME_Jugadores(ME_JUGADOR,regJugador,PosJugador);

  F_Jugadores.Txt_NICK.Text:= RegJugador.Nick;
  F_Jugadores.Txt_Nombre.Text:= regJugador.Nombre;
  F_Jugadores.Txt_Apellido.Text:= regJugador.Apellido;

  for i:=0 to menu_Jugadores.Items.Count-1 do
    menu_Jugadores.Items[I].Enabled:= true;

end;

{------------------------------------------------------------------------------}
procedure TF_Jugadores.SALIR1Click(Sender: TObject);
begin
  if (Lib_AuxJuego.Mensaje_Confirmacion('¿Esta seguro que quiere salir?')) then
  begin
    Lib_AuxJuego.Fin_Sesion(ME_JUGADOR, regJugador);
    F_Jugadores.Close;
    F_Login.Show;
    F_Login.Limpiar_Formulario();
  end;
end;

{------------------------------------------------------------------------------}

procedure TF_Jugadores.Txt_ApellidoKeyPress(Sender: TObject; var Key: Char);
const
  CARAC_HABILITADOS = ['a'..'z', 'A'..'Z', #0..#27];//solo letras y tecla borrar
begin
  if not (Key IN CARAC_HABILITADOS) then
    Key:=#0; //la tecla vale null si presiona caracteres no habilitados
end;

procedure TF_Jugadores.Txt_NombreKeyPress(Sender: TObject; var Key: Char);
const
  CARAC_HABILITADOS = ['a'..'z', 'A'..'Z', #0..#27];//solo letras y tecla borrar
begin
  if not (Key IN CARAC_HABILITADOS) then
    Key:=#0; //la tecla vale null si presiona caracteres no habilitados
end;

procedure TF_Jugadores.lbEdit_ContraseñaKeyPress(Sender: TObject;
  var Key: Char);
const
  CARAC_HABILITADOS = ['a'..'z', 'A'..'Z', '0'..'9', #0..#27];//solo letras, numero y borrar
begin
  if not (Key IN CARAC_HABILITADOS) then
    Key:=#0; //la tecla vale null si presiona caracteres no habilitados
end;


END.
