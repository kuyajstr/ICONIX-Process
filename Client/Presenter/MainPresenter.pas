unit MainPresenter;

interface

uses
  PresenterIntf,
  ViewIntf,
  Generics.Collections,
  Book,
  SysUtils,
  MVCFramework.RESTClient;

type
  TMainPresenter = class(TInterfacedObject, IMainPresenter)
  private
    FView: IMainView;
    FBookList: TObjectList<TBook>;
    FRestClient: IMVCRESTClient;
  public
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
  JsonDataObjects,
  Vcl.Forms,
  Vcl.Dialogs;

{ TMainCOntroller }

constructor TMainPresenter.Create(AView: IMainView);
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
  var MemTable := FView.GetDataSourceBooks;

  FRestClient.Async(
    procedure(Resp: IMVCRESTResponse)
    begin
      MemTable.Close;
      MemTable.Open;
      MemTable.LoadJSONArrayFromJSONObjectProperty('data', Resp.Content,
        TMVCNameCase.ncPascalCase);

      if MemTable.RecordCount <= 0 then
        FView.ShowMessageBox('No record found');

      MemTable.First;
    end, nil, True).Get('/api/books');
end;


procedure TMainPresenter.ShowBookDetails;
begin
  var BookDetail := TBook.Create();

  BookDetail.Id := FView.GetBookId;
  BookDetail.Title := FView.GetBookTitle;
  BookDetail.Synopsis := FView.GetBookSynopsis;

  var BookDetailsView := TBookDetailsForm.Create(Application);
  var BookDetailsController := TBookDetailsPresenter.Create(BookDetailsView, BookDetail);
  BookDetailsController.DisplayView;
end;

end.
