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
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Grid,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Grid;

type
  TMainForm = class(TForm, IMainView)
    HeaderLabel: TLabel;
    BookGrid: TStringGrid;
    BookAdapterBindSource: TAdapterBindSource;
    BindingList: TBindingsList;
    LinkGridToDataSourceBookAdapterBindSource: TLinkGridToDataSource;
    procedure FormShow(Sender: TObject);
    procedure BookGridDblClick(Sender: TObject);
  private
    FPresenter: IMainPresenter;
    procedure SetPresenter(APresenter: IMainPresenter);
    function GetSelectedBook: TObject;
  public
    procedure ShowMessageBox(const MessageStr: string);
  end;

implementation

{$R *.dfm}

uses
  BookstoreDM,
  MVCFramework.DataSet.Utils,
  MVCFramework.Serializer.Commons;

function TMainForm.GetSelectedBook: TObject;
begin
  Result := BookAdapterBindSource.Adapter.Current;
end;

procedure TMainForm.BookGridDblClick(Sender: TObject);
begin
  FPresenter.ShowBookDetails;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  FPresenter.LoadBooks;
  BookAdapterBindSource.Adapter := TListBindSourceAdapter.Create(
    Self, FPresenter.GetBookList, FPresenter.GetModelClass, True);
  BookAdapterBindSource.Active := True;
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
