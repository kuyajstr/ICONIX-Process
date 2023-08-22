unit Mainform;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids,

  MVCFramework.RESTClient;

type
  TMainPage = class(TForm)
    lblHeader: TLabel;
    dbgBooks: TDBGrid;
    btnLoadBooks: TButton;
    btnClearBooks: TButton;
    procedure btnLoadBooksClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnClearBooksClick(Sender: TObject);
  private
    RESTClient: IMVCRESTClient;
    IsLoading: Boolean;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  BookstoreDM,
  MVCFramework.DataSet.Utils,
  MVCFramework.Serializer.Commons;

procedure TMainPage.btnLoadBooksClick(Sender: TObject);
begin
  var MemTable := dmolBookstore.dsBooks;

  RESTClient.Async(
    procedure(Resp: IMVCRESTResponse)
    begin
      MemTable.Close;
      MemTable.Open;
      IsLoading := True;

      MemTable.LoadJSONArrayFromJSONObjectProperty('data', Resp.Content,
        TMVCNameCase.ncPascalCase);

      MemTable.First;
      IsLoading := False;
    end, nil, True).Get('/api/books');
end;

procedure TMainPage.btnClearBooksClick(Sender: TObject);
begin
  var MemTable := dmolBookstore.dsBooks;

  MemTable.Close;
  MemTable.Open;
end;

procedure TMainPage.FormCreate(Sender: TObject);
begin
  RESTClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
end;

end.
