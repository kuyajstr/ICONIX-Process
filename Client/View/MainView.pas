unit MainView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids,
  MVCFramework.RESTClient, ViewIntf, ControllerIntf, MainController;

type
  TMainForm = class(TForm, IView)
    HeaderLabel: TLabel;
    BookDBGrid: TDBGrid;
    procedure BookDBGridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    RESTClient: IMVCRESTClient;
    IsLoading: Boolean;
    FController: IController;
    function GetController: IController;
    procedure SetController(AController: IController);
  public
    property Controller: IController read GetController write SetController;
  end;

implementation

{$R *.dfm}

uses
  BookstoreDM,
  MVCFramework.DataSet.Utils,
  MVCFramework.Serializer.Commons,
  BookDetailsView;

procedure TMainForm.BookDBGridDblClick(Sender: TObject);
begin
  (FController as TMainController).ShowBookDetails();
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  (FController as TMainController).LoadBooks;
end;

function TMainForm.GetController: IController;
begin
  Result := FController;
end;

procedure TMainForm.SetController(AController: IController);
begin
  FController := AController;
  Controller.View := Self;
end;

end.
