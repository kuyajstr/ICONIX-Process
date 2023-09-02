unit RestClientManagerIntf;

interface

uses
  Book, Generics.Collections;

type
  IRestClientManager = interface
    ['{487266B3-0E03-42DE-8B7E-DD3587727538}']
    // Main
    function RetrieveBooks: TList<TBook>;

    // BookDetails
    function IsUserAuthorize: Boolean;

    // Login
    procedure GuestLogin;
    procedure AdminLogin;
    function Login: Boolean;

    // WriteReview
    function IsReviewValid: Boolean;
    function IsSubmissionSuccess: Boolean;
  end;

implementation

end.
