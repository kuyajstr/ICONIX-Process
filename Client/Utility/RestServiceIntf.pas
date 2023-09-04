unit RestServiceIntf;

interface

uses
  Generics.Collections,
  CustomerReview,
  Json;

type
  IRestClientManager = interface
    ['{487266B3-0E03-42DE-8B7E-DD3587727538}']
    // Main
    function RetrieveBooks: TList<TObject>;

    // BookDetails
    function IsUserAuthorize: Boolean;

    // Login
    procedure GuestLogin;
    procedure AdminLogin;
    function Login(const Username, Password: string;
      ShouldShowMessage: Boolean): Boolean;

    // WriteReview
    function IsReviewValid(const JSONBody: TJSONObject): Boolean;
    function IsSubmissionSuccess(const JSONBody: TJSONObject): Boolean;

    //Common
    procedure RefreshToken;
  end;

  IMainRestService = interface
    ['{3CBFB9D4-16C7-4F8F-A371-284C49214518}']
    function RetrieveBooks: TList<TObject>;
    procedure GuestLogin;
  end;

  IBookDetailsRestService = interface
    ['{F50B4685-82B2-42BB-B821-95E25EDF0DEE}']
    function IsUserAuthorize: Boolean;
  end;

  ILoginRestService = interface
    ['{239E4F2D-F8AF-411F-90E0-DF33542DBF6D}']
    function Login(const Username, Password: string;
      ShouldShowMessage: Boolean): Boolean;
  end;

  IWriteReviewRestService = interface
    ['{54B700DA-6CA2-4B24-B50D-372CC2C07D1F}']
    function IsReviewValid(const JSONBody: TJSONObject): Boolean;
    function IsSubmissionSuccess(const JSONBody: TJSONObject): Boolean;
  end;

implementation

end.
