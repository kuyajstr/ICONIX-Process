unit RestService;

interface

uses
  RestServiceIntf,
  AuthService,
  MVCFramework.RESTClient,
  Generics.Collections,
  CustomerReview,
  Json;

type
  TRestClientManager = class(TInterfacedObject, IRestClientManager)
  private
    FRestClient: IMVCRestClient;
    FAuthService: TAuthService;
  protected
    function RetrieveBooks: TList<TObject>;
    function IsUserAuthorize: Boolean;
    procedure GuestLogin;
    procedure AdminLogin;
    function Login(const Username, Password: string;
      ShouldShowMessage: Boolean = False): Boolean;
    function IsReviewValid(const JSONBody: TJSONObject): Boolean;
    function IsSubmissionSuccess(const JSONBody: TJSONObject): Boolean;
    procedure RefreshToken;
  public
    constructor Create;
  end;

implementation

uses
  Book,
  Vcl.Dialogs,
  REST.Json;

{ TRestClientManager }

procedure TRestClientManager.AdminLogin;
begin
  Login('Admin', 'admin');
end;

constructor TRestClientManager.Create;
begin
  inherited Create;
  FRestClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
  FAuthService := TAuthService.GetInstance;
  FRestClient.SetBearerAuthorization(FAuthService.GetToken);
end;

procedure TRestClientManager.GuestLogin;
begin
  Login('Guest', 'guest');
end;

function TRestClientManager.IsReviewValid(const JSONBody: TJSONObject): Boolean;
begin
  var Response := FRestClient.Post('/api/customer_reviews/validate',
    JSONBody.ToString);

  Result := Response.Success;
end;

function TRestClientManager.IsSubmissionSuccess(const JSONBody: TJSONObject): Boolean;
begin
  var Response := FRestClient.Post('/api/customer_reviews', JSONBody.ToString);
  Result := Response.Success;
end;

function TRestClientManager.IsUserAuthorize: Boolean;
begin
  var CheckUserRequest := FRestClient.Post('/api/customer_reviews', '{}');
  // Check if ReasonString is Unauthorized
  var IsUserValid := CheckUserRequest.StatusCode = 403;

  Result := IsUserValid;
end;

function TRestClientManager.Login(const Username, Password: string;
  ShouldShowMessage: Boolean): Boolean;
begin
  FRestClient.SetBasicAuthorization(Username, Password);

  var Response := FRestClient.Get('/api/login');
  if Response.Success then
  begin
    var Token: string := Response.ToJSONObject.Values['token'];
    FAuthService.SetToken(Token);
    RefreshToken;
  end;

  if ShouldShowMessage then
  begin
    if Response.Success then
      ShowMessage('Login Sucessful!')
    else
      ShowMessage('Incorrect Login Credentials!');
  end;

  Result := Response.Success;
end;

procedure TRestClientManager.RefreshToken;
begin
  FRestClient.SetBearerAuthorization(FAuthService.GetToken);
end;

function TRestClientManager.RetrieveBooks: TList<TObject>;
begin
  Result := TList<TObject>.Create;
  var Response := FRestClient.Get('/api/books');
  var JSONValue := TJSONObject.ParseJSONValue(Response.Content);
  var BookArray := JSONValue.GetValue<TJSONArray>('data');

  for var BookJson in BookArray do
  begin
    var Book := TJSON.JsonToObject<TBook>(BookJson.ToString);
    Result.Add(Book);
  end;
end;

end.
