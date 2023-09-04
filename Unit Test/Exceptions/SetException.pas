unit SetException;

interface

uses
  SysUtils;

type
  TSetException = class(Exception)
  public
    constructor Create(const Msg: string);
  end;

implementation

{ TSetException }

constructor TSetException.Create(const Msg: string);
begin
  inherited Create(Msg);
end;

end.
