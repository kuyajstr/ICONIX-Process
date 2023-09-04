unit WriteReviewPresenter;

interface

uses
  PresenterIntf,
  ViewIntf,
  Json,
  MVCFramework.RESTClient,
  Book,
  WriteReviewRestService;

type
  TWriteReviewPresenter = class(TInterfacedObject, IWriteReviewPresenter)
  private
    FView: IWriteReviewView;
    FBook: TBook;
    FRestService: IWriteReviewRestService;
  public
    procedure SubmitReview(JSONBody: TJSONObject);
    constructor Create(AView: IWriteReviewView; ABook: TBook;
      ARestService: IWriteReviewRestService);
    procedure DisplayView;
    procedure ValidateReview;
  end;

implementation

uses
  WriteReviewView,
  AuthService;

constructor TWriteReviewPresenter.Create(AView: IWriteReviewView; ABook: TBook;
  ARestService: IWriteReviewRestService);
begin
  inherited Create;
  FRestService := ARestService;
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
  var Submission := FRestService.IsSubmissionSuccess(JSONBody);
  if Submission then
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

  var Response := FRestService.ValidationResponse(JSONBody);
  var IsValid := Response = 'Customer Review is Valid';
  if IsValid then
  begin
    if FView.ShowConfirmationDialog('Submit Review?') = 6 then
    begin
      SubmitReview(JSONBody);
      FView.Close;
    end;
  end
  else
    FView.ShowMessageBox(Response);
end;

end.
