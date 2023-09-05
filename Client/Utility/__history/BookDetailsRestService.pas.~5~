unit BookDetailsRestService;

interface
uses
  MVCFramework.RESTClient,
  AuthService;

type
  IBookDetailsRestService = interface
    ['{F50B4685-82B2-42BB-B821-95E25EDF0DEE}']
    procedure RefreshToken;
    function IsUserNotAuthorize: Boolean;
  end;

  TBookDetailsRestService = class(TInterfacedObject, IBookDetailsRestService)
  private
    FRestClient: IMVCRESTClient;
    FAuthService: TAuthService;
  public
    constructor Create;
    procedure RefreshToken;
    function IsUserNotAuthorize: Boolean;
  end;

implementation

{ TBookDetailsRestService }

constructor TBookDetailsRestService.Create;
begin
  inherited Create;
  FRestClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
  FAuthService := TAuthService.GetInstance;
  FRestClient.SetBearerAuthorization(FAuthService.GetToken);
end;

function TBookDetailsRestService.IsUserNotAuthorize: Boolean;
begin
  var CheckUserRequest := FRestClient.Post('/api/customer_reviews', '{}');
  // Check if ReasonString is Unauthorized
  var IsUserValid := CheckUserRequest.StatusCode = 403;

  Result := IsUserValid;
end;

procedure TBookDetailsRestService.RefreshToken;
begin
  FRestClient.SetBearerAuthorization(FAuthService.GetToken)
end;

end.
