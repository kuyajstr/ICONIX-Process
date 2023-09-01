object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Home Page'
  ClientHeight = 271
  ClientWidth = 363
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object HeaderLabel: TLabel
    Left = 8
    Top = 8
    Width = 183
    Height = 30
    Caption = 'Internet Bookstore'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object BookGrid: TStringGrid
    Tag = 1
    Left = 8
    Top = 44
    Width = 347
    Height = 219
    ColCount = 1
    FixedCols = 0
    RowCount = 2
    TabOrder = 0
    OnDblClick = BookGridDblClick
    ColWidths = (
      340)
    ColAligments = (
      0)
  end
  object BookAdapterBindSource: TAdapterBindSource
    AutoActivate = False
    ScopeMappings = <>
    Left = 264
    Top = 16
  end
  object BindingList: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 148
    Top = 13
    object LinkGridToDataSourceBookAdapterBindSource: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BookAdapterBindSource
      GridControl = BookGrid
      Columns = <
        item
          MemberName = 'Title'
          Width = 340
        end>
      DefaultColumnWidth = 300
    end
  end
end
