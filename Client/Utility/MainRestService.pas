unit MainRestService;

interface

uses
  Generics.Collections,
  MVCFramework.RESTClient,
  AuthService;

type
  IMainRestService = interface
    ['{3CBFB9D4-16C7-4F8F-A371-284C49214518}']
    function RetrieveBooks: TList<TObject>;
  end;

  TMainRestService = class(TInterfacedObject, IMainRestService)
  private
    FRestClient: IMVCRESTClient;
    FAuthService: TAuthService;
    procedure GuestLogin;
  public
    constructor Create;
    function RetrieveBooks: TList<TObject>;
  end;

implementation

uses
  JSON,
  Book,
  REST.Json;

{ TMainRestService }

constructor TMainRestService.Create;
begin
  inherited Create;
  FRestClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
  FAuthService := TAuthService.GetInstance;
  FRestClient.SetBearerAuthorization(FAuthService.GetToken);
  GuestLogin;
end;

procedure TMainRestService.GuestLogin;
begin
  FRestClient.SetBasicAuthorization('Guest', 'guest');

  var Response := FRestClient.Get('/api/login');
  if Response.Success then
  begin
    var Token: string := Response.ToJSONObject.Values['token'];
    FAuthService.SetToken(Token);
    FRestClient.SetBearerAuthorization(Token)
  end;
end;

function TMainRestService.RetrieveBooks: TList<TObject>;
begin
  Result := TList<TObject>.Create;
  var Response := FRestClient.Get('/api/books');
  var JSONValue := TJSONObject.ParseJSONValue(Response.Content);
  var BookArray := JSONValue.GetValue<TJSONArray>('data');

  for var BookJson in BookArray do
  begin
    var Book := TJSON.JsonToObject<TBook>(BookJson.ToString);

    TJSON.ObjectToJsonString(Book);
    Result.Add(Book);
  end;
end;

end.
