object F_PanelFicticios: TF_PanelFicticios
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'F_PanelFicticios'
  ClientHeight = 613
  ClientWidth = 850
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMode = pmAuto
  Position = poDesigned
  PrintScale = poNone
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel_Listado: TPanel
    Left = 0
    Top = 0
    Width = 850
    Height = 613
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
    object Panel_grid: TPanel
      Left = 175
      Top = 10
      Width = 658
      Height = 524
      TabOrder = 0
      object Panel_FicticiosActivos: TPanel
        Left = 16
        Top = 247
        Width = 633
        Height = 266
        TabOrder = 0
        object Label2: TLabel
          Left = 8
          Top = 11
          Width = 243
          Height = 16
          Caption = 'Lista de ficticios activos:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Gothic'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Grid_FicticiosActivos: TStringGrid
          Left = 8
          Top = 41
          Width = 609
          Height = 209
          ColCount = 7
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
          OnDrawCell = Grid_FicticiosActivosDrawCell
          ColWidths = (
            64
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
      object Panel2: TPanel
        Left = 16
        Top = 8
        Width = 633
        Height = 233
        TabOrder = 1
        object Label1: TLabel
          Left = 8
          Top = 8
          Width = 243
          Height = 16
          Caption = 'Lista de ficticios creados:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Gothic'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Grid_ListadoFicticios: TStringGrid
          Left = 8
          Top = 30
          Width = 609
          Height = 195
          ColCount = 7
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
          OnDrawCell = Grid_ListadoFicticiosDrawCell
          ColWidths = (
            64
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
    end
    object BitBtn1: TBitBtn
      Left = 701
      Top = 540
      Width = 132
      Height = 52
      Caption = 'CERRAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Montserrat SemiBold'
      Font.Style = [fsBold]
      Kind = bkClose
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object Panel_CrearFicticios: TPanel
      Left = 1
      Top = 1
      Width = 168
      Height = 607
      Align = alLeft
      BorderStyle = bsSingle
      Color = clSkyBlue
      ParentBackground = False
      TabOrder = 2
      object Lbl_ActivarFicticios: TLabel
        Left = 8
        Top = 7
        Width = 9
        Height = 15
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Gothic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Btn_ActivarFicticios: TButton
        Left = 8
        Top = 133
        Width = 137
        Height = 58
        Caption = 'ACTIVAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Montserrat SemiBold'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = Btn_ActivarFicticiosClick
      end
      object Cbox_CantFicticios: TComboBox
        Left = 24
        Top = 80
        Width = 121
        Height = 26
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnChange = BitBtn1Click
        OnSelect = Cbox_CantFicticiosSelect
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5')
      end
    end
  end
end
