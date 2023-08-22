unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids,
  MVCFramework.RESTClient, ViewIntf, ControllerIntf, MainController;

type
  TMainFrm = class(TForm, IView)
    lblHeader: TLabel;
    dbgBooks: TDBGrid;
    procedure dbgBooksDblClick(Sender: TObject);
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
  BookDetailsForm;

procedure TMainFrm.dbgBooksDblClick(Sender: TObject);
begin
  (FController as TMainController).ShowBookDetails();
end;

procedure TMainFrm.FormShow(Sender: TObject);
begin
  (FController as TMainController).LoadBooks;
end;

function TMainFrm.GetController: IController;
begin
  Result := FController;
end;

procedure TMainFrm.SetController(AController: IController);
begin
  FController := AController;

  Controller.View := Self;
end;

end.
