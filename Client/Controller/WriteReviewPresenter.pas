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
  TWriteReviewPresenter = class(TInterfacedObject, IPresenter)
  private
    FView: IView;
    FCustomerReview: TCustomerReview;
    FBook: TBook;
    FRestClient: IMVCRESTClient;
    procedure SubmitReview(JSONBody: TJSONObject);
  public
    constructor Create(AView: IView; ABook: TBook);
    procedure DisplayView;
    procedure ValidateReview;
  end;

implementation

uses
  WriteReviewView,
  Vcl.Dialogs,
  Vcl.Controls,
  AuthService;

constructor TWriteReviewPresenter.Create(AView: IView; ABook: TBook);
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
  var WriteReviewView := FView as TWriteReviewForm;
  WriteReviewView.BookTitleEdit.Text := FBook.Title;
  WriteReviewView.Show;
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
  View := FView as TWriteReviewForm;
  Review := View.ReviewMemo.Text;
  Rating := View.RatingSpinEdit.Value;

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
      View.Close;
    end;
  end
  else
    ShowMessage(Resp.Content);
end;

end.