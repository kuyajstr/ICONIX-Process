unit MainView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids,
  MVCFramework.RESTClient, ViewIntf, PresenterIntf, MainPresenter;

type
  TMainForm = class(TForm, IView)
    HeaderLabel: TLabel;
    BookDBGrid: TDBGrid;
    procedure BookDBGridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FPresenter: IPresenter;
    procedure SetPresenter(APresenter: IPresenter);
  end;

implementation

{$R *.dfm}

uses
  BookstoreDM,
  MVCFramework.DataSet.Utils,
  MVCFramework.Serializer.Commons;

procedure TMainForm.BookDBGridDblClick(Sender: TObject);
begin
  (FPresenter as TMainPresenter).ShowBookDetails();
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  (FPresenter as TMainPresenter).LoadBooks;
end;

procedure TMainForm.SetPresenter(APresenter: IPresenter);
begin
  FPresenter := APresenter;
end;

end.
