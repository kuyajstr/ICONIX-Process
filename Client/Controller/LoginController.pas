unit LoginController;

interface

uses
  ControllerIntf,
  Vcl.Forms,
  MVCFramework.RESTClient,
  LoginForm;

type
  TLoginController = class(TInterfacedObject,IController)
  private
    FView: TForm;
    RESTClient: IMVCRESTClient;
    function GetView: TForm;
    procedure SetView(AView: TForm);
  public
    constructor Create;
  
    procedure Login(const Username, Password: string);
    property View: TForm read GetView write SetView;

  end;

implementation

uses
  AuthService,
  Vcl.Dialogs;

{ TLoginController }

constructor TLoginController.Create;
begin
  inherited Create;
  RESTClient := TMVCRESTClient.New.BaseURL('localhost',8080);

  FView := TfrmLogin.Create(self);
end;

function TLoginController.GetView: TForm;
begin
  Result := FView;
end;

procedure TLoginController.Login(const Username, Password: string);
begin
  RESTClient.SetBasicAuthorization(Username, Password);

  var Response := RESTClient.Get('/api/login') as TMVCRESTResponse;

  if Response.Success then
  begin
    var Token: string := Response.ToJSONObject.Values['token'];

    TAuthService.GetInstance.SetToken(Token);
    ShowMessage('Login Sucessful!');
    FView.Close;
  end
  else
  begin
    ShowMessage('Incorrect Login Credentials!');
  end;
  
end;

procedure TLoginController.SetView(AView: TForm);
begin
  FView := AView;
end;

end.
