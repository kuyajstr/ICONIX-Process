unit LoginPresenter;

interface

uses
  PresenterIntf,
  Vcl.Forms,
  ViewIntf,
  MVCFramework.RESTClient,
  LoginView;

type
  TLoginPresenter = class(TInterfacedObject, IPresenter)
  private
    FView: IView;
    FRestClient: IMVCRESTClient;
  public
    constructor Create(AView: IView);
    procedure Login;
  end;

implementation

uses
  AuthService,
  Vcl.Dialogs;

{ TLoginController }

constructor TLoginPresenter.Create(AView: IView);
begin
  inherited Create;
  FRestClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
  FView := AView;
  FView.SetPresenter(Self);
end;

procedure TLoginPresenter.Login;
var
  View: TLoginForm;
  Username, Password: string;
begin
  View := FView as TLoginForm;
  Username := View.UsernameEdit.Text;
  Password := View.PasswordEdit.Text;

  FRestClient.SetBasicAuthorization(Username, Password);

  var Response := FRestClient.Get('/api/login') as TMVCRESTResponse;
  if Response.Success then
  begin
    var Token: string := Response.ToJSONObject.Values['token'];
    TAuthService.GetInstance.SetToken(Token);
    ShowMessage('Login Sucessful!');
    View.Close;
  end
  else
    ShowMessage('Incorrect Login Credentials!');

end;

end.
