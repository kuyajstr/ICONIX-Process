unit AlternativeBookDetailsView;

interface

uses
  ViewIntf,
  PresenterIntf;

type
  TAlternativeBookDetailsView = class(TInterfacedObject, IBookDetailsView)
    procedure Show;
    procedure SetTitle(const Value: string);
    procedure SetSynopsis(const Value: string);
    procedure SetPresenter(APresenter: IBookDetailsPresenter);
    function ShowConfirmationDialog(const MessageStr: string): Integer;
  end;

implementation

uses
  SetException,
  DisplayException;

{ TAlternativeBookDetailsView }

procedure TAlternativeBookDetailsView.SetPresenter(
  APresenter: IBookDetailsPresenter);
begin
//  raise TSetException.Create('BookDetailsPresenter');
end;

procedure TAlternativeBookDetailsView.SetSynopsis(const Value: string);
begin
//  raise TSetException.Create(Value);
end;

procedure TAlternativeBookDetailsView.SetTitle(const Value: string);
begin
//  raise TSetException.Create(Value);
end;

procedure TAlternativeBookDetailsView.Show;
begin
  //Do nothing  
end;

function TAlternativeBookDetailsView.ShowConfirmationDialog(
  const MessageStr: string): Integer;
begin
  Result := 7;
end;

end.
