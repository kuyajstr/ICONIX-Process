unit EntityMapper;

interface

uses
  Generics.Collections,
  MVCFramework.ActiveRecord;

type
  TEntityMapper<T: class> = class
    function ActiveRecordObjToDomainObj(List: TObjectList<TMVCActiveRecord>;
      const ARClass, AClass: TClass): TObjectList<T>;
  end;

implementation

{ TEntityMapper<T> }

function TEntityMapper<T>.ActiveRecordObjToDomainObj
  (List: TObjectList<TMVCActiveRecord>; const ARClass, AClass: TClass)
  : TObjectList<T>;
var
  ObjectList: TObjectList<T>;
  ActiveRecord: TMVCActiveRecord;
  ActiveRecordObj: TObject;
begin
//  ObjectList := TObjectList<T>.Create;
//
//  for ActiveRecord in List do
//  begin
//    ActiveRecordObj := ActiveRecord as ARClass;
//    ObjectList.Add(AClass.Create(ActiveRecordObj));
//  end;
//
//  Result := ObjectList;
end;

end.
