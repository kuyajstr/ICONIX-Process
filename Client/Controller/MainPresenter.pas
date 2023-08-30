unit MainPresenter;

interface

uses
  PresenterIntf,
  ViewIntf,
  Generics.Collections,
  Book,
  MVCFramework.RESTClient;

type
  TMainPresenter = class(TInterfacedObject, IPresenter)
  private
    FView: IView;
    FBookList: TObjectList<TBook>;
    FRestClient: IMVCRESTClient;
  public
    constructor Create(AView: IView);
    procedure LoadBooks;
    procedure ClearBooks;
    procedure ShowBookDetails;
  end;

implementation

uses
  BookstoreDM,
  MVCFramework.DataSet.Utils,
  MVCFramework.Serializer.Commons,
  BookDetailsView,
  BookDetailsPresenter,
  AuthService,
  MVCFramework.Serializer.JsonDataObjects,
  JsonDataObjects,
  Vcl.Forms;

{ TMainCOntroller }

procedure TMainPresenter.ClearBooks;
begin
  var MemTable := dmolBookstore.dsBooks;
  MemTable.Close;
  MemTable.Open;
end;

constructor TMainPresenter.Create(AView: IView);
begin
  inherited Create;
  FBookList := TObjectList<TBook>.Create;
  FRestClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
  FRestClient.SetBasicAuthorization('Guest', 'guest');
  FView := AView;
  FView.SetPresenter(Self);

  var Response := FRestClient.Get('/api/login') as TMVCRESTResponse;
  if Response.Success then
  begin
    var Token: string := Response.ToJSONObject.Values['token'];
    var AuthService := TAuthService.GetInstance;
    AuthService.SetToken(Token);
    FRestClient.SetBearerAuthorization(AuthService.GetToken);
  end;
end;

procedure TMainPresenter.LoadBooks;
begin
  var MemTable := dmolBookstore.dsBooks;

  FRestClient.Async(
    procedure(Resp: IMVCRESTResponse)
    begin
      MemTable.Close;
      MemTable.Open;
      MemTable.LoadJSONArrayFromJSONObjectProperty('data', Resp.Content,
        TMVCNameCase.ncPascalCase);
      MemTable.First;
    end, nil, True).Get('/api/books');
end;


procedure TMainPresenter.ShowBookDetails;
begin
  var BookDetail := TBook.Create();
  BookDetail.Id := dmolBookstore.dsBooksId.Value;
  BookDetail.Title := dmolBookstore.dsBooksTItle.Value;
  BookDetail.Synopsis := dmolBookstore.dsBooksSynopsis.Value;

  var BookDetailsView := TBookDetailsForm.Create(Application);
  var BookDetailsController := TBookDetailsPresenter.Create(BookDetailsView, BookDetail);
  BookDetailsController.Display;
end;

end.
