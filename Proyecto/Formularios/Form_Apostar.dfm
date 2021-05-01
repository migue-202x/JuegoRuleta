object F_Apostar: TF_Apostar
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'F_Apostar'
  ClientHeight = 503
  ClientWidth = 828
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
  object Panel_Listado: TPanel
    Left = 0
    Top = 0
    Width = 828
    Height = 503
    Align = alClient
    BorderStyle = bsSingle
    Color = 16361282
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object Lbl_SelectJugador: TLabel
      Left = 232
      Top = 7
      Width = 428
      Height = 22
      Caption = 'Seleccione jugador para llevar a cabo apuesta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Montserrat SemiBold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Lbl_ListaDeApuestas: TLabel
      Left = 232
      Top = 7
      Width = 565
      Height = 22
      Caption = 'Si quiere eliminar una de sus apuestas, seleccione de la lista '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Montserrat SemiBold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Lbl_ListaJugadores: TLabel
      Left = 232
      Top = 7
      Width = 478
      Height = 22
      Caption = 'Lista de jugadores que llevaron a cabo una apuesta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Montserrat SemiBold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel_DatosApostar: TPanel
      Left = 17
      Top = 39
      Width = 201
      Height = 370
      Color = clSkyBlue
      ParentBackground = False
      TabOrder = 0
      object Lbl_nameJugador: TLabel
        Left = 13
        Top = 10
        Width = 64
        Height = 19
        Caption = 'Jugador'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Montserrat Medium'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Lbl_nomenclador: TLabel
        Left = 13
        Top = 73
        Width = 103
        Height = 19
        Caption = 'Nomenclador'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Montserrat Medium'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Lbl_valor: TLabel
        Left = 13
        Top = 137
        Width = 39
        Height = 19
        Caption = 'Valor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Montserrat Medium'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Lbl_importe: TLabel
        Left = 13
        Top = 197
        Width = 58
        Height = 19
        Caption = 'Importe'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Montserrat Medium'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit_nameJugador: TEdit
        Left = 13
        Top = 38
        Width = 172
        Height = 26
        Color = 8715679
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object btn_okeyApostar: TBitBtn
        Left = 23
        Top = 291
        Width = 162
        Height = 62
        Caption = 'APOSTAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Montserrat SemiBold'
        Font.Style = [fsBold]
        Kind = bkOK
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 1
        OnClick = btn_okeyApostarClick
      end
      object Edit_nomenclador: TEdit
        Left = 13
        Top = 101
        Width = 172
        Height = 26
        Color = 8715679
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object Edit_valor: TEdit
        Left = 13
        Top = 165
        Width = 172
        Height = 26
        Color = 8715679
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object Edit_importe: TEdit
        Left = 13
        Top = 225
        Width = 172
        Height = 25
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Montserrat'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnKeyPress = Edit_importeKeyPress
      end
    end
    object Panel_grid: TPanel
      Left = 224
      Top = 39
      Width = 569
      Height = 370
      TabOrder = 1
      object Grid_ListaApuestas: TStringGrid
        Left = 16
        Top = 10
        Width = 537
        Height = 335
        ColCount = 4
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Grid_ListaApuestasClick
        OnDrawCell = Grid_ListaApuestasDrawCell
        ColWidths = (
          64
          64
          64
          64)
        RowHeights = (
          24)
      end
      object Grid_ListaJugadores: TStringGrid
        Left = 16
        Top = 10
        Width = 537
        Height = 336
        ColCount = 6
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        ParentFont = False
        TabOrder = 1
        OnClick = Grid_ListaJugadoresClick
        OnDrawCell = Grid_ListaJugadoresDrawCell
        ColWidths = (
          64
          64
          64
          64
          64
          64)
        RowHeights = (
          24)
      end
    end
    object BitBtn1: TBitBtn
      Left = 648
      Top = 423
      Width = 153
      Height = 66
      Caption = 'Cerrar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Montserrat SemiBold'
      Font.Style = [fsBold]
      Kind = bkClose
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn1Click
    end
  end
end
