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
//  var WriteReviewView := FView as TWriteReviewForm;
  FView.SetTitle(FBook.Title);
  FView.Show;
//  WriteReviewView.BookTitleEdit.Text := FBook.Title;
//  WriteReviewView.Show;
end;

procedure TWriteReviewPresenter.SubmitReview(JSONBody: TJSONObject);
begin
  var Resp := FRestClient.Post('/api/customer_reviews', JSONBody.ToString);
  if Resp.Success then
    ShowMessage('Review submitted! :)')
  else
    ShowMessage('Book not found');
end;

procedure TWriteReviewPresenter.ValidateReview;
var
  View: TWriteReviewForm;
  Review: string;
  Rating: Integer;
begin
  Review := FView.GetReview;
  Rating := FView.GetRating;

  var JSONBody := TJSONObject.Create;
  JSONBody.AddPair('BookId', FBook.Id);
  JSONBody.AddPair('Review', Review);
  JSONBody.AddPair('Rating', Rating);

  var Resp := FRestClient.Post('/api/customer_reviews/validate', JSONBody.ToString);
  if Resp.Success then
  begin
    if MessageDlg('Submit Review?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      SubmitReview(JSONBody);
      FView.Close;
    end;
  end
  else
    ShowMessage(Resp.Content);
end;

end.
