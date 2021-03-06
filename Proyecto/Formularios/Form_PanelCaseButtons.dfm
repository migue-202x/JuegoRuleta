object F_PanelCaseButtons: TF_PanelCaseButtons
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'F_PanelCaseButtons'
  ClientHeight = 486
  ClientWidth = 983
  Color = clBtnFace
  TransparentColorValue = clDefault
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMode = pmAuto
  Position = poDesigned
  PrintScale = poNone
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel_Listado: TPanel
    Left = 0
    Top = 0
    Width = 983
    Height = 486
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
    object Lbl_bloquearDesbloquear: TLabel
      Left = 186
      Top = 7
      Width = 405
      Height = 22
      Caption = 'Seleccione jugador a bloquear/desbloquear'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Montserrat SemiBold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Lbl_regalarCred: TLabel
      Left = 186
      Top = 7
      Width = 336
      Height = 22
      Caption = 'Seleccione jugador a regalar cr'#233'dito'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Montserrat SemiBold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel_RegalarCredito: TPanel
      Left = 16
      Top = 39
      Width = 164
      Height = 353
      TabOrder = 0
      object Lbl_cantCredito: TLabel
        Left = 13
        Top = 205
        Width = 142
        Height = 18
        Caption = 'Cantidad de cr'#233'dito:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 13
        Top = 133
        Width = 61
        Height = 18
        Caption = 'Jugador:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object btn_okRegalarCredito: TBitBtn
        Left = 20
        Top = 285
        Width = 126
        Height = 62
        Caption = 'ACEPTAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Montserrat SemiBold'
        Font.Style = [fsBold]
        Kind = bkOK
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 0
        OnClick = btn_okRegalarCreditoClick
      end
      object Edit_cantCredito: TEdit
        Left = 13
        Top = 229
        Width = 140
        Height = 26
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnKeyPress = Edit_cantCreditoKeyPress
      end
      object Edit_Jugador: TEdit
        Left = 13
        Top = 157
        Width = 140
        Height = 26
        Color = 8715679
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
    end
    object Panel_grid: TPanel
      Left = 196
      Top = 39
      Width = 759
      Height = 353
      TabOrder = 1
      object Grid_ListadoJugadores: TStringGrid
        Left = 13
        Top = 17
        Width = 732
        Height = 320
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        ParentFont = False
        TabOrder = 0
        OnClick = Grid_ListadoJugadoresClick
        OnDrawCell = Grid_ListadoJugadoresDrawCell
        ColWidths = (
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
      Left = 805
      Top = 398
      Width = 140
      Height = 66
      Caption = 'CERRAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Montserrat SemiBold'
      Font.Style = [fsBold]
      Kind = bkClose
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object Panel_LockUnlock: TPanel
      Left = 16
      Top = 39
      Width = 164
      Height = 353
      TabOrder = 3
      object Label3: TLabel
        Left = 13
        Top = 205
        Width = 61
        Height = 18
        Caption = 'Jugador:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object btn_okLockUnlock: TBitBtn
        Left = 27
        Top = 270
        Width = 126
        Height = 62
        Caption = 'ACEPTAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Montserrat SemiBold'
        Font.Style = [fsBold]
        Kind = bkOK
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 1
        OnClick = btn_okLockUnlockClick
      end
      object Edit_NickJugador: TEdit
        Left = 13
        Top = 229
        Width = 140
        Height = 27
        Color = 8715679
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
  end
end
