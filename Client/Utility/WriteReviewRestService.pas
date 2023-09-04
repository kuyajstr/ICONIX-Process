unit WriteReviewRestService;

interface

uses
  JSON,
  MVCFramework.RESTClient,
  AuthService;

type
  IWriteReviewRestService = interface
    ['{54B700DA-6CA2-4B24-B50D-372CC2C07D1F}']
    function ValidationResponse(const JSONBody: TJSONObject): string;
    function IsSubmissionSuccess(const JSONBody: TJSONObject): Boolean;
  end;

  TWriteReviewRestService = class(TInterfacedObject, IWriteReviewRestService)
  private
    FRestClient: IMVCRestClient;
    FAuthService: TAuthService;
  public
    constructor Create;
    function ValidationResponse(const JSONBody: TJSONObject): string;
    function IsSubmissionSuccess(const JSONBody: TJSONObject): Boolean;
  end;

implementation

{ TWriteReviewRestService }

constructor TWriteReviewRestService.Create;
begin
  inherited Create;
  FRestClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
  FAuthService := TAuthService.GetInstance;
  FRestClient.SetBearerAuthorization(FAuthService.GetToken);
end;

function TWriteReviewRestService.ValidationResponse(
  const JSONBody: TJSONObject): string;
begin
  var Response := FRestClient.Post('/api/customer_reviews/validate',
    JSONBody.ToString);
  Result := Response.Content;
end;

function TWriteReviewRestService.IsSubmissionSuccess(const JSONBody
  : TJSONObject): Boolean;
begin
  var Response := FRestClient.Post('/api/customer_reviews', JSONBody.ToString);
  Result := Response.Success;
end;

end.
