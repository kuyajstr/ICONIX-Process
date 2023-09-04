unit BookDetailsViewStub;

interface

uses
  ViewIntf,
  PresenterIntf,
  Vcl.Forms;

type
  TBookDetailsViewStub = class(TInterfacedObject, IBookDetailsView)
  private
    FPresenter: IBookDetailsPresenter;
    FResponse: Integer;
  public
    procedure Show;
    procedure SetTitle(const Value: string);
    procedure SetSynopsis(const Value: string);
    procedure SetPresenter(APresenter: IBookDetailsPresenter);
    function ShowConfirmationDialog(const MessageStr: string): Integer;
  end;


implementation

uses
  SysUtils,
  Vcl.Controls;

{ TBookDetailsViewStub }

procedure TBookDetailsViewStub.SetPresenter(APresenter: IBookDetailsPresenter);
begin
  FPresenter := APresenter;
end;

procedure TBookDetailsViewStub.SetSynopsis(const Value: string);
begin
  raise Exception.Create(Value);
end;

procedure TBookDetailsViewStub.SetTitle(const Value: string);
begin
  raise Exception.Create(Value);
end;

procedure TBookDetailsViewStub.Show;
begin
    raise Exception.Create('BookDetailsView');
end;

function TBookDetailsViewStub.ShowConfirmationDialog(
  const MessageStr: string): Integer;
begin
  Result := FResponse;
end;

end.
