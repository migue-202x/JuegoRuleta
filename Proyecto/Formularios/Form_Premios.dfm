object F_Premios: TF_Premios
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'F_Premios'
  ClientHeight = 416
  ClientWidth = 502
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
  object Panel_Premiados: TPanel
    Left = 0
    Top = 0
    Width = 502
    Height = 416
    Align = alClient
    Color = 16361282
    ParentBackground = False
    TabOrder = 0
    object Label7: TLabel
      Left = 163
      Top = 8
      Width = 142
      Height = 32
      Caption = 'Premiados'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Montserrat ExtraBold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 337
      Top = 339
      Width = 144
      Height = 62
      Caption = 'CERRAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Montserrat SemiBold'
      Font.Style = [fsBold]
      Kind = bkClose
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object Grid_premiados: TStringGrid
      Left = 19
      Top = 70
      Width = 462
      Height = 255
      ColCount = 4
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
      TabOrder = 1
      OnDrawCell = Grid_premiadosDrawCell
      ColWidths = (
        64
        64
        64
        64)
      RowHeights = (
        24)
    end
  end
end
