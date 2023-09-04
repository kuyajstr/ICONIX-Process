unit WriteReviewViewStub;

interface

uses
  ViewIntf,
  PresenterIntf;

type
  TWriteReViewViewStub = class(TInterfacedObject, IWriteReviewView)
  private
    FTitle: string;
    FPresenter: IWriteReviewPresenter;
    FIsBasicCourse: Boolean;
  public
    constructor Create(IsBasicCourse: Boolean);
    procedure Show;
    procedure Close;
    procedure SetTitle(const Value: string);
    function GetReview: string;
    function GetRating: Integer;
    procedure SetPresenter(APresenter: IWriteReviewPresenter);
    procedure ShowMessageBox(const MessageStr: string);
    function ShowConfirmationDialog(const MessageStr: string): Integer;
  end;

implementation

uses
  SysUtils,
  DisplayException;

{ TWriteReViewViewStub }

procedure TWriteReViewViewStub.Close;
begin
  raise Exception.Create('Close');
end;

constructor TWriteReViewViewStub.Create(IsBasicCourse: Boolean);
begin
  FIsBasicCourse := IsBasicCourse;
end;

function TWriteReViewViewStub.GetRating: Integer;
begin
  if FIsBasicCourse then
    Result := 5
  else
    Result := 0;
end;

function TWriteReViewViewStub.GetReview: string;
begin
  if FIsBasicCourse then
    Result := 'Stub Review'
  else
    Result := '';
end;

procedure TWriteReViewViewStub.SetPresenter(APresenter: IWriteReviewPresenter);
begin
  FPresenter := APresenter;
end;

procedure TWriteReViewViewStub.SetTitle(const Value: string);
begin
  FTitle := Value;
end;

procedure TWriteReViewViewStub.Show;
begin
  raise TDisplayException.Create('WriteReviewView');
end;

function TWriteReViewViewStub.ShowConfirmationDialog(
  const MessageStr: string): Integer;
begin
  if FIsBasicCourse then
    Result := 6
  else
    Result := 7;
end;

procedure TWriteReViewViewStub.ShowMessageBox(const MessageStr: string);
begin
  raise TDisplayException.Create(MessageStr);
end;

end.
