unit EntityActiveRecord;

interface

uses
  MVCFramework.ActiveRecord;

type
  TEntityActiveRecord = class abstract(TMVCActiveRecord)
  public
    function QueryInterface(const IID: TGUID; out Obj): HRESULT; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  end;

implementation

{ TEntityActiveRecord }

function TEntityActiveRecord.QueryInterface(const IID: TGUID; out Obj): HRESULT;
begin
  Result := -1;
end;

function TEntityActiveRecord._AddRef: Integer;
begin
  Result := -1;
end;

function TEntityActiveRecord._Release: Integer;
begin
  Result := -1;
end;

end.
