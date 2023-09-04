unit DisplayException;

interface

uses
  SysUtils;

type
  TDisplayException = class(Exception)
  public
    constructor Create(const Msg: string);
  end;

implementation

{ TDisplayException }

constructor TDisplayException.Create(const Msg: string);
begin
  inherited Create(Msg);
end;

end.
