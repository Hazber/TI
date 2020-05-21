unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TI3, StdCtrls;

type
  TfrmValues = class(TForm)
    mmD: TMemo;
    mmB1: TMemo;
    mmB2: TMemo;
    mmY: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtEvk: TEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmValues: TfrmValues;

implementation

{$R *.dfm}


procedure TfrmValues.FormShow(Sender: TObject);
begin
  mmD.Text:= DStrList.Text;
  mmB1.Text:= B1StrList.Text;
  mmB2.Text:= B2StrList.Text;
  mmY.Text:= YStrList.Text;
  edtEvk.Text:= EvklidStr;
end;

end.
