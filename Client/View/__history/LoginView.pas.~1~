unit LoginForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  ViewIntf, ControllerIntf;

type
  TfrmLogin = class(TForm, IView)
    edtUsername: TEdit;
    edtPassword: TEdit;
    lblPassword: TLabel;
    lblUser: TLabel;
    btnLogin: TButton;
    procedure btnLoginClick(Sender: TObject);
  private
    SucessfulLogin : boolean;
    FController: IController;
    function GetController: IController;
    procedure SetController(AController: IController);
  public
    constructor Create(AController: IController);
    property Controller: IController read GetController write SetController;
  end;


implementation

{$R *.dfm}
uses
  MVCFramework.RESTClient,
  JsonDataObjects,
  System.UITypes,
  LoginController;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  (FController as TLoginController).Login(edtUsername.Text,edtPassword.Text);
end;

constructor TfrmLogin.Create(AController: IController);
begin
  inherited Create(Application);

  FController := AController;
  FController.View := Self;
end;

function TfrmLogin.GetController: IController;
begin
  Result := FController;
end;

procedure TfrmLogin.SetController(AController: IController);
begin
  FController := AController;
end;

end.
