unit ControllerIntf;

interface

uses
  Vcl.Forms;

type
  IController = interface ['{BD87DF48-D8C3-464D-A891-E25470FDA6A2}'] 
    function GetView: TForm;
    procedure SetView(AView: TForm);

    property View: TForm read GetView write SetView;
  end;

implementation


end.
