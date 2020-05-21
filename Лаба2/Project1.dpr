program Project1;

uses
  Forms,
  main in 'main.pas' {Form1},
  Assist in 'Assist.pas',
  Shifrator_deshifrator in 'Shifrator_deshifrator.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
