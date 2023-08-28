unit WriteReviewController;

interface

uses
  ControllerIntf,
  Vcl.Forms,
  Json,
  CustomerReview,
  MVCFramework.RESTClient,
  Book;

type
  TWriteReviewController = class(TInterfacedObject, IController)
  private
    FView: TForm;
    FCustomerReview: TCustomerReview;
    FBook: TBook;
    FRestClient: IMVCRESTClient;
    function GetView: TForm;
    procedure SetView(AView: TForm);
    procedure SubmitReview(JSONBody: TJSONObject);
  public
    constructor Create;

    procedure Display(ABook: TBook);
    procedure ValidateReview(Review: string; Rating: Integer);
    property View: TForm read GetView write SetView;
  end;

implementation

uses
  WriteReviewView,
  Vcl.Dialogs,
  Vcl.Controls,
  AuthService;

{ TWriteReviewController }

constructor TWriteReviewController.Create;
begin
  inherited Create;
  FRestClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
  FRestClient.SetBearerAuthorization(TAuthService.GetInstance.GetToken);
  FView := TWriteReviewForm.Create(Self);
end;

procedure TWriteReviewController.Display(ABook: TBook);
begin
  var WriteReviewView := FView as TWriteReviewForm;
  FBook := ABook;
  WriteReviewView.BookTitleEdit.Text := FBook.Title;
  WriteReviewView.Show;
end;

function TWriteReviewController.GetView: TForm;
begin
  Result := FView;
end;

procedure TWriteReviewController.SetView(AView: TForm);
begin
  FView := AView;
end;

procedure TWriteReviewController.SubmitReview(JSONBody: TJSONObject);
begin
  var Resp := FRestClient.Post('/api/customer_reviews', JSONBody.ToString);
  if Resp.Success then
    ShowMessage('Review submitted! :)')
  else
    ShowMessage('Book not found');
end;

procedure TWriteReviewController.ValidateReview(Review: string;
  Rating: Integer);
begin
  var JSONBody := TJSONObject.Create;
  JSONBody.AddPair('BookId', FBook.Id);
  JSONBody.AddPair('Review', Review);
  JSONBody.AddPair('Rating', Rating);

  var Resp := FRestClient.Post('/api/customer_reviews/validate', JSONBody.ToString);
  if Resp.Success then
  begin
    if MessageDlg('Submit Review?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      FView.Close;
      SubmitReview(JSONBody);
    end;
  end
  else
    ShowMessage(Resp.Content);
end;

end.
