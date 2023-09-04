object BookDetailsForm: TBookDetailsForm
  Left = 0
  Top = 0
  Caption = 'Book Details'
  ClientHeight = 385
  ClientWidth = 391
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
  object WriteReviewButton: TButton
    Left = 280
    Top = 344
    Width = 105
    Height = 25
    Caption = 'Write Review'
    TabOrder = 0
    OnClick = WriteReviewButtonClick
  end
  object TitleEdit: TEdit
    Left = 8
    Top = 37
    Width = 377
    Height = 23
    ReadOnly = True
    TabOrder = 1
  end
  object SynopsisMemo: TMemo
    Left = 8
    Top = 101
    Width = 377
    Height = 228
    ReadOnly = True
    TabOrder = 2
  end
end
