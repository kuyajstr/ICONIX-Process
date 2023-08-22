unit BookstoreDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmolBookstore = class(TDataModule)
    dsBooks: TFDMemTable;
    dsrcBooks: TDataSource;
    dsBooksId: TIntegerField;
    dsBooksTItle: TStringField;
    dsBooksSynopsis: TStringField;
    dsCustomer: TFDMemTable;
    dsrcCustomers: TDataSource;
    dsCustomerReview: TFDMemTable;
    dsrcCustomerReview: TDataSource;
    dsCustomerReviewId: TIntegerField;
    dsCustomerReviewBookId: TIntegerField;
    dsCustomerReviewCustomerId: TIntegerField;
    dsCustomerReviewRating: TIntegerField;
    dsCustomerReviewReview: TStringField;
    dsCustomerReviewIsPending: TBooleanField;
    dsCustomerId: TIntegerField;
    dsCustomerFirstName: TStringField;
    dsCustomerLastName: TStringField;
    dsCustomerEmail: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmolBookstore: TdmolBookstore;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
