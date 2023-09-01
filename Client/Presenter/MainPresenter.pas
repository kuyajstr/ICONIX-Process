unit MainPresenter;

interface

uses
  PresenterIntf,
  ViewIntf,
  Generics.Collections,
  Book,
  SysUtils,
  MVCFramework.RESTClient,
  Data.Bind.ObjectScope;

type
  TMainPresenter = class(TInterfacedObject, IMainPresenter)
  private
    FView: IMainView;
    FBookList: TList<TBook>;
    FRestClient: IMVCRESTClient;
  public
    function RetrieveBooks: TList<TBook>;
    function CreateAdapter: TBindSourceAdapter;
    constructor Create(AView: IMainView);
    procedure LoadBooks;
    procedure ShowBookDetails;
  end;

implementation

uses
  BookstoreDM,
  MVCFramework.DataSet.Utils,
  MVCFramework.Serializer.Commons,
  MainView,
  BookDetailsView,
  BookDetailsPresenter,
  AuthService,
  MVCFramework.Serializer.JsonDataObjects,
  REST.Json,
  Json,
  Vcl.Forms,
  Vcl.Dialogs;

{ TMainCOntroller }

constructor TMainPresenter.Create(AView: IMainView);
begin
  FRestClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
  FRestClient.SetBasicAuthorization('Guest', 'guest');
  FView := AView;
  FView.SetPresenter(Self);
  inherited Create;

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
  FBookList := RetrieveBooks;
  var BindSourceAdapter := FView.GetBindSource;
  BindSourceAdapter.Adapter := CreateAdapter;
  BindSourceAdapter.Active := True;
end;

function TMainPresenter.CreateAdapter: TBindSourceAdapter;
begin
  Result := TListBindSourceAdapter<TBook>.Create(
    FView as TMainForm, FBookList, False);
end;

function TMainPresenter.RetrieveBooks: TList<TBook>;
begin
  Result := TList<TBook>.Create;

  var Response := FRestClient.Get('/api/books');
  var JSONValue := TJSONObject.ParseJSONValue(Response.Content);
  var BookArray := JSONValue.GetValue<TJSONArray>('data');

  for var BookJson in BookArray do
  begin
    var Book := TJSON.JsonToObject<TBook>(BookJson.ToString);
    Result.Add(Book);
  end;
end;

procedure TMainPresenter.ShowBookDetails;
begin
  var SelectedBook := FView.GetBindSource.Adapter.Current as TBook;
  var BookDetailsView := TBookDetailsForm.Create(FView as TForm);
  var BookDetailsController := TBookDetailsPresenter.Create(BookDetailsView,
    SelectedBook);
  BookDetailsController.DisplayView;
end;

end.
