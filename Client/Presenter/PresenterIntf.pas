unit PresenterIntf;

interface

uses
  JSON;

type
  IPresenter = interface
    ['{BD87DF48-D8C3-464D-A891-E25470FDA6A2}']
  end;

  IMainPresenter = interface
    ['{76881BDD-9BE0-4835-821F-C8A58692C25D}']
    procedure ShowBookDetails;
    procedure LoadBooks;
    procedure ShowError(const ErrorMsg: string);
  end;

  IBookDetailsPresenter = interface
    ['{5A294E75-BF3F-4B7C-9F8F-0E431DBF16B2}']
    function IsUserAuthorized: Boolean;
    procedure ComposeReview;
    procedure DisplayView;
  end;

  ILoginPresenter = interface
    ['{117BA561-61D5-492B-ACDB-4BBAE8D90580}']
    procedure Login;
  end;

  IWriteReviewPresenter = interface
    ['{5A4B7533-F850-4751-A7C9-695F01D386C7}']
    procedure SubmitReview(JSONBody: TJSONObject);
    procedure ValidateReview;
    procedure DisplayView;
  end;
implementation

end.
