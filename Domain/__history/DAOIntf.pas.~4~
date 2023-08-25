unit DAOIntf;

interface

uses
  Generics.Collections;

type
  IDAO<T: class> = interface
    ['{ED4AA087-E713-4DA1-9DBE-3BB4464E4EAE}']
    procedure Insert(var Obj: T);
    procedure Select(const AId: Integer; var Obj: T);
    procedure Update(var Obj: T);
    procedure Delete(const AId: Integer);
    procedure SelectAll(var AList: TObjectList<T>);
  end;

implementation

end.
