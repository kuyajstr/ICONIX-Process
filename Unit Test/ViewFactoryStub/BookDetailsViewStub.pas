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
    FIsBasicCourse: Boolean;
    FTitle, FSynopsis: string;
  public
    constructor Create(IsBasicCourse: Boolean);
    procedure Show;
    procedure SetTitle(const Value: string);
    procedure SetSynopsis(const Value: string);
    procedure SetPresenter(APresenter: IBookDetailsPresenter);
    function ShowConfirmationDialog(const MessageStr: string): Integer;
  end;


implementation

uses
  SysUtils,
  Vcl.Controls,
  DisplayException,
  SetException;

{ TBookDetailsViewStub }

constructor TBookDetailsViewStub.Create(IsBasicCourse: Boolean);
begin
  FIsBasicCourse := IsBasicCourse;
end;

procedure TBookDetailsViewStub.SetPresenter(APresenter: IBookDetailsPresenter);
begin
  FPresenter := APresenter;
end;

procedure TBookDetailsViewStub.SetSynopsis(const Value: string);
begin
  FSynopsis := Value;
end;

procedure TBookDetailsViewStub.SetTitle(const Value: string);
begin
  FTitle := Value;
end;

procedure TBookDetailsViewStub.Show;
begin
  raise TDisplayException.Create('BookDetailsView');
end;

function TBookDetailsViewStub.ShowConfirmationDialog(
  const MessageStr: string): Integer;
begin
  if FIsBasicCourse then
    Result := 6
  else
    Result := 7;
end;

end.
