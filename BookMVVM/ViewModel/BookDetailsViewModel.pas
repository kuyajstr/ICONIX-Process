unit BookDetailsViewModel;

interface

uses
  Book;

type
  TBookDetailsViewModel = class
  private
    FBook: TBook;
  public
    constructor Create(const ABook: TBook);

    property Book: TBook read FBook write FBook;
  end;

implementation

{ TBookDetailsViewModel }

constructor TBookDetailsViewModel.Create(const ABook: TBook);
begin
  inherited Create;

  FBook := ABook;
end;

end.
