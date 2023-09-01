unit WriteReviewPresenter;

interface

uses
  PresenterIntf,
  ViewIntf,
  Vcl.Forms,
  Json,
  CustomerReview,
  MVCFramework.RESTClient,
  Book;

type
  TWriteReviewPresenter = class(TInterfacedObject, IWriteReviewPresenter)
  private
    FView: IWriteReviewView;
    FCustomerReview: TCustomerReview;
    FBook: TBook;
    FRestClient: IMVCRESTClient;
    procedure SubmitReview(JSONBody: TJSONObject);
  public
    constructor Create(AView: IWriteReviewView; ABook: TBook);
    procedure DisplayView;
    procedure ValidateReview;
  end;

implementation

uses
  WriteReviewView,
  Vcl.Dialogs,
  Vcl.Controls,
  AuthService;

constructor TWriteReviewPresenter.Create(AView: IWriteReviewView; ABook: TBook);
begin
  inherited Create;
  FRestClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
  FRestClient.SetBearerAuthorization(TAuthService.GetInstance.GetToken);
  FBook := ABook;
  FView := AView;
  FView.SetPresenter(Self);
end;

procedure TWriteReviewPresenter.DisplayView;
begin
  FView.SetTitle(FBook.Title);
  FView.Show;
end;

procedure TWriteReviewPresenter.SubmitReview(JSONBody: TJSONObject);
begin
  var Resp := FRestClient.Post('/api/customer_reviews', JSONBody.ToString);
  if Resp.Success then
    FView.ShowMessageBox('Review submitted!')
  else
    FView.ShowMessageBox('Submission failed');
end;

procedure TWriteReviewPresenter.ValidateReview;
begin
  var JSONBody := TJSONObject.Create;
  JSONBody.AddPair('BookId', FBook.Id);
  JSONBody.AddPair('Review', FView.GetReview);
  JSONBody.AddPair('Rating', FView.GetRating);

  var Resp := FRestClient.Post('/api/customer_reviews/validate', JSONBody.ToString);
  if Resp.Success then
  begin
    if FView.ShowConfirmationDialog('Submit Review?') = mrYes then
    begin
      SubmitReview(JSONBody);
      FView.Close;
    end;
  end
  else
    FView.ShowMessageBox(Resp.Content);
end;

end.
