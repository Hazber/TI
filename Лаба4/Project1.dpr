program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {TFMain},
  Unit2 in 'Unit2.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTFMain, TFMain);
  Application.Run;
end.
