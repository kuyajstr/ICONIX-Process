unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, ViewModelIntf, Vcl.Mask,
  Vcl.ExtCtrls, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components,
  ViewIntf, MainViewModel, Vcl.ComCtrls;

type
  TMainFrm = class(TForm)
    lblHeader: TLabel;
    edtId: TLabeledEdit;
    edtTItle: TLabeledEdit;
    lblBookList: TLabel;
    BindlingList: TBindingsList;
    ViewModelBindScope: TBindScope;
    ListView1: TListView;
  private
    FViewModel: TMainViewModel;
    function GetFMainViewModel: TMainViewModel;
    procedure SetFMainViewModel(const AViewModel: TMainViewModel);
  public
    constructor Create;
    property MainViewModel: TMainViewModel read GetFMainViewModel write SetFMainViewModel;
  end;

implementation

{$R *.dfm}


{ TMainFrm }

constructor TMainFrm.Create;
begin
  
end;

function TMainFrm.GetFMainViewModel: TMainViewModel;
begin
  Result := FViewModel;
end;

procedure TMainFrm.SetFMainViewModel(const AViewModel: TMainViewModel);
begin
  FViewModel := AViewModel;  

  ViewModelBindScope.DataObject := FViewModel;

  ViewModelBindScope.Active := True;
end;

end.