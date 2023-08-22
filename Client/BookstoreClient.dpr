program BookstoreClient;

uses
  Vcl.Forms,
  MainForm in 'View\MainForm.pas' {MainFrm},
  BookstoreDM in 'BookstoreDM.pas' {dmolBookstore: TDataModule},
  BookDetailsForm in 'View\BookDetailsForm.pas' {BookDetailsFrm},
  WriteReviewForm in 'View\WriteReviewForm.pas' {WriteReviewFrm},
  ControllerIntf in 'Controller\ControllerIntf.pas',
  MainController in 'Controller\MainController.pas',
  ViewIntf in 'View\ViewIntf.pas',
  BookDetailsController in 'Controller\BookDetailsController.pas',
  WriteReviewController in 'Controller\WriteReviewController.pas',
  LoginForm in 'View\LoginForm.pas' {frmLogin},
  LoginController in 'Controller\LoginController.pas',
  AuthService in 'AuthService.pas';

{$R *.res}

var
  MainView: TMainFrm;
  MainController: TMainController;
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmolBookstore, dmolBookstore);
  Application.CreateForm(TMainFrm, MainView);
  MainController := TMainController.Create;

  MainView.Controller := MainController;

  Application.Run;
end.
