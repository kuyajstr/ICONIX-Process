unit BookDetailsController;

interface

uses
  ControllerIntf,
  Vcl.Forms,
  Book,
  MVCFramework.RESTClient,
  BookDetailsView;

type
  TBookDetailsController = class(TinterfacedObject, IController)
  private
    FBook: TBook;
    FView: TForm;
    RESTClient: IMVCRestClient;
    function GetView: TForm;
    procedure SetView(AView: TForm);
  public
    constructor Create(ABook: TBook);
    procedure Display;
    procedure WriteReview;

    property View: TForm read GetView write SetView;
  end;

implementation

uses
  WriteReviewController,
  AuthService,
  SysUtils,
  LoginController,
  Vcl.Dialogs,
  Vcl.Controls;

{ TBookDetailsController }

constructor TBookDetailsController.Create(ABook: TBook);
begin
  inherited Create;
  RESTClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
  RESTClient.SetBearerAuthorization(TAuthService.GetInstance.GetToken);
  FBook := ABook;
  FView := TBookDetailsForm.Create(Self);
end;

procedure TBookDetailsController.Display;
begin
  var BookDetailsView := FView as TBookDetailsForm;

  BookDetailsView.TitleEdit.Text := FBook.Title;
  BookDetailsView.SynopsisMemo.Text := FBook.Synopsis;
  BookDetailsView.Show;
end;

function TBookDetailsController.GetView: TForm;
begin
  Result := FView;
end;

procedure TBookDetailsController.SetView(AView: TForm);
begin
  FView := AView;
end;

procedure TBookDetailsController.WriteReview;
begin
  RESTClient.SetBearerAuthorization(TAuthService.GetInstance.GetToken);

  var CheckUserRequest := RESTClient.Post('/api/customer_reviews', '{}');
  // Check if ReasonString is Unauthorized
  if CheckUserRequest.StatusCode <> 403 then
  begin
    var WriteReviewController := TWriteReviewController.Create;
    WriteReviewController.Display(FBook);
  end
  else
  begin
    if MessageDlg('Please Login first, would you like to proceed?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      TLoginController.Create.View.Show;
    end;
  end;
end;

end.
