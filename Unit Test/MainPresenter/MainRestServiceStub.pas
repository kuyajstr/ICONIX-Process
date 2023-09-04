unit MainRestServiceStub;

interface

uses
  MainRestService,
  Generics.Collections;

type
  TMainRestServiceStub = class(TInterfacedObject, IMainRestService)
  private
    FList: TList<TObject>;
  public
    constructor Create(AList: TList<TObject>);
    function RetrieveBooks: TList<TObject>;
  end;

implementation

{ TMainRestServiceStub }

constructor TMainRestServiceStub.Create(AList: TList<TObject>);
begin
  FList := AList;
end;

function TMainRestServiceStub.RetrieveBooks: TList<TObject>;
begin
  Result := FList;
end;

end.
