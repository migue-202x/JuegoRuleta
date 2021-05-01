object F_Ganador: TF_Ganador
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'F_Ganador'
  ClientHeight = 403
  ClientWidth = 691
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMode = pmAuto
  PrintScale = poNone
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image_dieroCayendo: TImage
    Left = 0
    Top = 0
    Width = 691
    Height = 403
    Align = alClient
    ExplicitTop = 56
  end
  object Label7: TLabel
    Left = 255
    Top = 13
    Width = 177
    Height = 26
    Caption = #161'FELICITACIONES!'
    Color = -1
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Montserrat ExtraBold'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Btn_Close: TBitBtn
    Left = 520
    Top = 324
    Width = 145
    Height = 57
    Caption = 'CERRAR'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Montserrat SemiBold'
    Font.Style = [fsBold]
    Kind = bkClose
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 0
    OnClick = Btn_CloseClick
  end
end
