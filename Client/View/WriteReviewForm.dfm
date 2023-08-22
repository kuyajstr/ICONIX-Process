object WriteReviewFrm: TWriteReviewFrm
  Left = 0
  Top = 0
  Caption = 'Write Book Review'
  ClientHeight = 378
  ClientWidth = 431
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lblBookTitle: TLabel
    Left = 19
    Top = 26
    Width = 52
    Height = 15
    Caption = 'Book Title'
  end
  object lblReview: TLabel
    Left = 44
    Top = 66
    Width = 37
    Height = 15
    Caption = 'Review'
  end
  object lblRating: TLabel
    Left = 19
    Top = 282
    Width = 62
    Height = 15
    Caption = 'Rating (1-5)'
  end
  object btnSubmit: TButton
    Left = 87
    Top = 330
    Width = 75
    Height = 25
    Caption = 'Submit'
    TabOrder = 0
    OnClick = btnSubmitClick
  end
  object edtBookTitle: TEdit
    Left = 87
    Top = 22
    Width = 325
    Height = 23
    TabOrder = 1
  end
  object memReview: TMemo
    Left = 87
    Top = 63
    Width = 325
    Height = 197
    Lines.Strings = (
      'memReview')
    TabOrder = 2
  end
  object sedRating: TSpinEdit
    Left = 87
    Top = 279
    Width = 109
    Height = 24
    MaxValue = 0
    MinValue = 0
    TabOrder = 3
    Value = 0
  end
end
