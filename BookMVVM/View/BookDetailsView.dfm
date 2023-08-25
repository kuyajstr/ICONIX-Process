object BookDetailsForm: TBookDetailsForm
  Left = 0
  Top = 0
  Caption = 'Book Details'
  ClientHeight = 358
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object TitleLabel: TLabel
    Left = 8
    Top = 16
    Width = 22
    Height = 15
    Caption = 'Title'
  end
  object SynopsisLabel: TLabel
    Left = 8
    Top = 80
    Width = 46
    Height = 15
    Caption = 'Synopsis'
  end
  object TitleEdit: TEdit
    Left = 8
    Top = 37
    Width = 379
    Height = 23
    TabOrder = 0
  end
  object SynopsisMemo: TMemo
    Left = 8
    Top = 101
    Width = 377
    Height = 244
    ReadOnly = True
    TabOrder = 1
  end
  object ViewModelBindingScope: TBindScope
    AutoActivate = False
    ScopeMappings = <>
    Left = 208
    Top = 16
  end
  object BindingList: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 328
    Top = 16
    object BookDetailTitleBinding: TBindExpression
      Category = 'Binding Expressions'
      ControlComponent = TitleEdit
      SourceComponent = ViewModelBindingScope
      SourceExpression = 'Book.Title'
      ControlExpression = 'Text'
      NotifyOutputs = True
      Direction = dirSourceToControl
    end
    object BookDetailSynopsisBinding: TBindExpression
      Category = 'Binding Expressions'
      ControlComponent = SynopsisMemo
      SourceComponent = ViewModelBindingScope
      SourceExpression = 'Book.Synopsis'
      ControlExpression = 'Text'
      NotifyOutputs = True
      Direction = dirBidirectional
    end
  end
end
