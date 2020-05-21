program Project1;

uses
  Forms,
  TI3 in 'TI3.pas' {frmMain},
  Unit1 in 'Unit1.pas' {frmValues};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmValues, frmValues);
  Application.Run;
end.
