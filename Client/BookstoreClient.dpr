program BookstoreClient;

uses
  Vcl.Forms,
  MainView in 'View\MainView.pas' {MainForm},
  BookstoreDM in 'BookstoreDM.pas' {dmolBookstore: TDataModule},
  BookDetailsView in 'View\BookDetailsView.pas' {BookDetailsForm},
  WriteReviewView in 'View\WriteReviewView.pas' {WriteReviewForm},
  ControllerIntf in 'Controller\ControllerIntf.pas',
  MainController in 'Controller\MainController.pas',
  ViewIntf in 'View\ViewIntf.pas',
  BookDetailsController in 'Controller\BookDetailsController.pas',
  WriteReviewController in 'Controller\WriteReviewController.pas',
  LoginView in 'View\LoginView.pas' {LoginForm},
  LoginController in 'Controller\LoginController.pas',
  AuthService in 'AuthService.pas';

{$R *.res}

var
  MainView: TMainForm;
  MainController: TMainController;
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmolBookstore, dmolBookstore);
  Application.CreateForm(TMainForm, MainView);
  MainController := TMainController.Create;

  MainView.Controller := MainController;

  Application.Run;
end.
