unit AlternativeMainView;

interface

uses
  ViewFactory,
  ViewIntf,
  PresenterIntf;

type
  TAlternativeMainView = class(TInterfacedObject, IMainView)
  private
    FPresenter: IMainPresenter;
  public
    procedure SetPresenter(APresenter: IMainPresenter);
    procedure ShowMessageBox(const MessageStr: string);
    function GetSelectedBook: TObject;
  end;

implementation

{ TAlternativeMainView }

function TAlternativeMainView.GetSelectedBook: TObject;
begin
  Result := nil;
end;

procedure TAlternativeMainView.SetPresenter(APresenter: IMainPresenter);
begin
  FPresenter := APresenter;
end;

procedure TAlternativeMainView.ShowMessageBox(const MessageStr: string);
begin
  //Do nothing
end;

end.
