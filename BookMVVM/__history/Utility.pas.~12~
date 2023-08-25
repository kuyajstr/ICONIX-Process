unit Utility;

interface

type
  TUtility<T: class> = class
    class function Clone(SourceObject: T): T;
  end;


implementation

uses
  Rtti;

{ TUtility<T> }

class function TUtility<T>.Clone(SourceObject: T): T;
var
  SourceValue : TValue;
begin
  var Context := TRttiContext.Create;
  try
    var RttiType := Context.GetType(SourceObject.ClassType);

    var Clone := RttiType.GetMethod('Create').Invoke(
      RttiType.AsInstance.MetaclassType, []).AsObject;

    for var RttiProperty in RttiType.GetProperties do
    begin
      if RttiProperty.IsWritable and RttiProperty.IsReadable then
      begin
//        SourceValue := RttiProperty.GetValue(SourceObject);
        RttiProperty.SetValue(Clone,SourceValue);
      end;
    end;
  finally
    Context.Free;
  end;
end;

end.
