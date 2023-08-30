unit LoginView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  ViewIntf, PresenterIntf;

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
    FPresenter: IPresenter;
    procedure SetPresenter(APresenter: IPresenter);
  end;

implementation

{$R *.dfm}
uses
  MVCFramework.RESTClient,
  JsonDataObjects,
  System.UITypes,
  LoginPresenter;

procedure TLoginForm.LoginButtonClick(Sender: TObject);
begin
  (FPresenter as TLoginPresenter).Login;
end;

procedure TLoginForm.SetPresenter(APresenter: IPresenter);
begin
  FPresenter := APresenter;
end;

end.
