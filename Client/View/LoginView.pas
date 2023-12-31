unit LoginView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  ViewIntf, PresenterIntf;

type
  TLoginForm = class(TForm, ILoginView)
    UsernameEdit: TEdit;
    PasswordEdit: TEdit;
    PasswordLabel: TLabel;
    UsernameLabel: TLabel;
    LoginButton: TButton;
    procedure LoginButtonClick(Sender: TObject);
  private
    FPresenter: ILoginPresenter;
    procedure SetPresenter(APresenter: ILoginPresenter);
  public
    function GetUsername: string;
    function GetPassword: string;
  end;

implementation

{$R *.dfm}
uses
  MVCFramework.RESTClient,
  JsonDataObjects,
  System.UITypes,
  LoginPresenter;

function TLoginForm.GetPassword: string;
begin
  Result := PasswordEdit.Text;
end;

function TLoginForm.GetUsername: string;
begin
  Result := UsernameEdit.Text;
end;

procedure TLoginForm.LoginButtonClick(Sender: TObject);
begin
  FPresenter.Login;
end;

procedure TLoginForm.SetPresenter(APresenter: ILoginPresenter);
begin
  FPresenter := APresenter;
end;

end.
