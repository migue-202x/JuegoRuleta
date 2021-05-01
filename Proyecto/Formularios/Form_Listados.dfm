object F_Listados: TF_Listados
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'F_Listados'
  ClientHeight = 510
  ClientWidth = 845
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMode = pmAuto
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel_gralListados: TPanel
    Left = 0
    Top = 0
    Width = 845
    Height = 510
    Align = alClient
    Color = 16361282
    ParentBackground = False
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 688
      Top = 440
      Width = 140
      Height = 52
      Caption = 'Cerrar'
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object Grid_ListadoxFiltro: TStringGrid
      Left = 16
      Top = 184
      Width = 812
      Height = 250
      ColCount = 1
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnDrawCell = Grid_ListadoxFiltroDrawCell
      ColWidths = (
        64)
      RowHeights = (
        24)
    end
    object Panel_filtro: TPanel
      Left = 16
      Top = 8
      Width = 812
      Height = 170
      TabOrder = 2
      object Lbl_tittle: TLabel
        Left = 15
        Top = 0
        Width = 86
        Height = 24
        Caption = 'Lbl_tittle'
        Color = 4070912
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Montserrat ExtraBold'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Panel_Nomenclador: TPanel
        Left = 15
        Top = 35
        Width = 194
        Height = 125
        Color = clSkyBlue
        ParentBackground = False
        TabOrder = 0
        object Lbl_Nomenclador: TLabel
          Left = 8
          Top = 12
          Width = 122
          Height = 21
          Caption = 'Lbl_Nomenclador'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Cbox_Nomenclador: TComboBox
          Left = 40
          Top = 65
          Width = 145
          Height = 27
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnSelect = Cbox_NomencladorSelect
          Items.Strings = (
            'RN'
            'PI'
            'PF'
            'DO'
            'CO'
            'XX')
        end
      end
      object Panel_CantJugadores: TPanel
        Left = 15
        Top = 35
        Width = 202
        Height = 126
        Color = clSkyBlue
        ParentBackground = False
        TabOrder = 1
        object Lbl_cantJugadores: TLabel
          Left = 16
          Top = 12
          Width = 134
          Height = 21
          Caption = 'Lbl_cantJugadores'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Cbox_Cantidad: TComboBox
          Left = 48
          Top = 65
          Width = 145
          Height = 27
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnSelect = Cbox_CantidadSelect
          Items.Strings = (
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7'
            '8'
            '9'
            '10')
        end
      end
      object Panel_nickJugador: TPanel
        Left = 15
        Top = 35
        Width = 786
        Height = 126
        Color = clSkyBlue
        ParentBackground = False
        TabOrder = 2
        object Lbl_NickJugador: TLabel
          Left = 511
          Top = 9
          Width = 135
          Height = 16
          Caption = 'Lbl_NickJugador'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Gothic'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 9
          Top = 41
          Width = 90
          Height = 19
          Caption = 'Jugador: '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Gothic'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 8
          Top = 66
          Width = 180
          Height = 19
          Caption = 'Fecha de ingreso: '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Gothic'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 8
          Top = 91
          Width = 330
          Height = 19
          Caption = 'Premios acumulados como jugador: '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Gothic'
          Font.Style = []
          ParentFont = False
        end
        object Lbl_NameJugador: TLabel
          Left = 90
          Top = 41
          Width = 55
          Height = 19
          Caption = 'xxxxx'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'MS Gothic'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lbl_FechaIngreso: TLabel
          Left = 188
          Top = 66
          Width = 55
          Height = 19
          Caption = 'xxxxx'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'MS Gothic'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lbl_PremiosAcumulados: TLabel
          Left = 337
          Top = 91
          Width = 55
          Height = 19
          Caption = 'xxxxx'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'MS Gothic'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Edit_NickJugador: TEdit
          Left = 608
          Top = 31
          Width = 162
          Height = 26
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object Btn_aceptar: TBitBtn
          Left = 648
          Top = 63
          Width = 129
          Height = 54
          Caption = 'ACEPTAR'
          Kind = bkOK
          NumGlyphs = 2
          TabOrder = 1
          OnClick = Btn_aceptarClick
        end
      end
    end
  end
end
