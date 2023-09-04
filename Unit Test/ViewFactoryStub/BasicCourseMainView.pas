unit BasicCourseMainView;

interface

uses
  ViewIntf,
  PresenterIntf,
  Generics.Collections,
  Book;

type
  TBasicCourseMainView = class(TInterfacedObject, IMainView)
  private
    FList: TList<TObject>;
    FPresenter: IMainPresenter;
    FSelectedBook: TObject;
  public
    constructor Create;
    procedure SetPresenter(APresenter: IMainPresenter);
    procedure ShowMessageBox(const MessageStr: string);
    function GetSelectedBook: TObject;
  end;

implementation

uses
  SysUtils;

{ TMainViewStub }

constructor TBasicCourseMainView.Create;
begin
  FList := TList<TObject>.Create;
  FList.AddRange([
    TBook.Create('Book A', 'Book A Synopsis', 1),
    TBook.Create('Book B', 'Book B Synopsis', 2),
    TBook.Create('Book C', 'Book C Synopsis', 3)
  ]);
end;

function TBasicCourseMainView.GetSelectedBook: TObject;
begin
  Result := FList.First;
end;

procedure TBasicCourseMainView.SetPresenter(APresenter: IMainPresenter);
begin
  FPresenter := APresenter;
end;

procedure TBasicCourseMainView.ShowMessageBox(const MessageStr: string);
begin
  raise Exception.Create(MessageStr);
end;

end.
