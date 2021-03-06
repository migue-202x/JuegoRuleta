unit Form_Premios;

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
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.ExtCtrls;

type
  TF_Premios = class(TForm)
    Panel_Premiados: TPanel;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    Grid_premiados: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Grid_premiadosDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Premios: TF_Premios;

implementation

Uses
  Form_Juego, Form_login;


{$R *.dfm}

{--------------------------------------------------------------------------------}

procedure TF_Premios.BitBtn1Click(Sender: TObject);
begin
  Form_Premios.F_Premios.Close;
  Form_Juego.F_Juego.Panel_JuegoGral.Enabled:=true;
end;

{--------------------------------------------------------------------------------}

procedure TF_Premios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form_Juego.F_Juego.Panel_JuegoGral.Enabled:= true;
end;

{--------------------------------------------------------------------------------}

procedure TF_Premios.FormCreate(Sender: TObject);
begin
  self.Position := poScreenCenter;
end;

{--------------------------------------------------------------------------------}

procedure TF_Premios.FormShow(Sender: TObject);
begin
  Form_Juego.F_Juego.Panel_JuegoGral.Enabled:=false;
end;

{--------------------------------------------------------------------------------}

procedure TF_Premios.Grid_premiadosDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
with (Sender as TStringGrid) do
  begin
    if (ARow = 0)
    then
      begin
        Canvas.Brush.Color := clBtnFace;
        Canvas.TextRect(Rect, Rect.Left + (Rect.Right - Rect.Left - Canvas.TextWidth(Grid_premiados.Cells[ACol,ARow]) + 1) div 2, Rect.Top + 2, Grid_premiados.Cells[ACol,ARow]);
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

{------------------------------------------------------------------------------}

END.
