unit MainView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids,
  MVCFramework.RESTClient, ViewIntf, PresenterIntf, MainPresenter,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TMainForm = class(TForm, IMainView)
    HeaderLabel: TLabel;
    BookDBGrid: TDBGrid;
    dsrcBooks: TDataSource;
    dsBooks: TFDMemTable;
    dsBooksId: TIntegerField;
    dsBooksTItle: TStringField;
    dsBooksSynopsis: TStringField;
    procedure BookDBGridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FPresenter: IMainPresenter;
    procedure SetPresenter(APresenter: IMainPresenter);
  public
    function GetDataSourceBooks: TFDMemTable;
    function GetBookId: Integer;
    function GetBookTitle: string;
    function GetBookSynopsis: string;
    procedure ShowMessageBox(const MessageStr: string);
  end;

implementation

{$R *.dfm}

uses
  BookstoreDM,
  MVCFramework.DataSet.Utils,
  MVCFramework.Serializer.Commons;

procedure TMainForm.BookDBGridDblClick(Sender: TObject);
begin
  FPresenter.ShowBookDetails;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  FPresenter.LoadBooks;
end;

function TMainForm.GetBookId: Integer;
begin
  Result := dsBooksId.Value;
end;

function TMainForm.GetBookSynopsis: string;
begin
  Result := dsBooksSynopsis.Value;
end;

function TMainForm.GetBookTitle: string;
begin
  Result := dsBooksTItle.Value;
end;

function TMainForm.GetDataSourceBooks: TFDMemTable;
begin
  Result := dsBooks;
end;

procedure TMainForm.SetPresenter(APresenter: IMainPresenter);
begin
  FPresenter := APresenter;
end;

procedure TMainForm.ShowMessageBox(const MessageStr: string);
begin
  ShowMessage(MessageStr);
end;

end.
