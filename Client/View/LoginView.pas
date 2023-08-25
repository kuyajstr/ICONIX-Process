unit LoginView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  ViewIntf, ControllerIntf;

type
  TLoginForm = class(TForm, IView)
    UsernameEdit: TEdit;
    PasswordEdit: TEdit;
    PasswordLabel: TLabel;
    UsernameLabel: TLabel;
    LoginButton: TButton;
    procedure LoginButtonClick(Sender: TObject);
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

procedure TLoginForm.LoginButtonClick(Sender: TObject);
begin
  (FController as TLoginController).Login(UsernameEdit.Text,PasswordEdit.Text);
end;

constructor TLoginForm.Create(AController: IController);
begin
  inherited Create(Application);
  FController := AController;
  FController.View := Self;
end;

function TLoginForm.GetController: IController;
begin
  Result := FController;
end;

procedure TLoginForm.SetController(AController: IController);
begin
  FController := AController;
end;

end.
