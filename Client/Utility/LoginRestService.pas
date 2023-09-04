unit LoginRestService;

interface
uses
  MVCFramework.RESTClient,
  AuthService;

type
  ILoginRestService = interface
    ['{239E4F2D-F8AF-411F-90E0-DF33542DBF6D}']
    function Login(const Username, Password: string): Boolean;
  end;

  TLoginRestService = class(TInterfacedObject, ILoginRestService)
  private
    FRestClient: IMVCRestClient;
    FAuthService: TAuthService;
  public
    constructor Create;
    function Login(const Username, Password: string): Boolean;
  end;

implementation

uses
  Vcl.Dialogs;
{ TLoginRestService }

constructor TLoginRestService.Create;
begin
  inherited Create;
  FRestClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
  FAuthService := TAuthService.GetInstance;
  FRestClient.SetBearerAuthorization(FAuthService.GetToken);
end;

function TLoginRestService.Login(const Username, Password: string): Boolean;
begin
  FRestClient.SetBasicAuthorization(Username, Password);

  var Response := FRestClient.Get('/api/login');
  if Response.Success then
  begin
    var Token: string := Response.ToJSONObject.Values['token'];
    FAuthService.SetToken(Token);
    ShowMessage('Login Sucessful!')
  end
  else
    ShowMessage('Login Failed!');

  Result := Response.Success;
end;

end.
