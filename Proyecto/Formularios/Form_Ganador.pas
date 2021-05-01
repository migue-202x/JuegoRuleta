unit Form_Ganador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.GIFImg;

type
  TF_Ganador = class(TForm)
    Btn_Close: TBitBtn;
    Image_dieroCayendo: TImage;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Ganador: TF_Ganador;

implementation

Uses
  Form_Juego;

{$R *.dfm}

procedure TF_Ganador.Btn_CloseClick(Sender: TObject);
begin
  F_Ganador.Close;
end;

procedure TF_Ganador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form_Juego.F_Juego.Enabled:= true;
  (Image_dieroCayendo.Picture.Graphic as TGIFImage).Animate:=false;
end;

procedure TF_Ganador.FormCreate(Sender: TObject);
begin
  self.Position := poScreenCenter;
end;

procedure TF_Ganador.FormShow(Sender: TObject);
begin
  Form_Juego.F_Juego.Enabled:= false;
end;

END.
