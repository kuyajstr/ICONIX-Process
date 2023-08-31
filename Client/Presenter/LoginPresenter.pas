unit LoginPresenter;

interface

uses
  PresenterIntf,
  Vcl.Forms,
  ViewIntf,
  MVCFramework.RESTClient,
  LoginView;

type
  TLoginPresenter = class(TInterfacedObject, ILoginPresenter)
  private
    FView: ILoginView;
    FRestClient: IMVCRESTClient;
  public
    constructor Create(AView: ILoginView);
    procedure Login;
  end;

implementation

uses
  AuthService,
  Vcl.Dialogs;

{ TLoginController }

constructor TLoginPresenter.Create(AView: ILoginView);
begin
  inherited Create;
  FRestClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
  FView := AView;
  FView.SetPresenter(Self);
end;

procedure TLoginPresenter.Login;
var
  Username, Password: string;
begin
  Username := FView.GetUsername;
  Password := FView.GetPassword;

  FRestClient.SetBasicAuthorization(Username, Password);

  var Response := FRestClient.Get('/api/login') as TMVCRESTResponse;
  if Response.Success then
  begin
    var Token: string := Response.ToJSONObject.Values['token'];
    TAuthService.GetInstance.SetToken(Token);
    ShowMessage('Login Sucessful!');
    FView.Close;
  end
  else
    ShowMessage('Incorrect Login Credentials!');

end;

end.