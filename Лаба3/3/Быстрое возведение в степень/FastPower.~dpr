program FastPower;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  Number, Power, Module, Result: Int64;

begin
  Readln(Number, Power, Module);
  Writeln(Number, '^', Power, ' mod ', Module);

  Result:= 1;
  while Power <> 0 do
  begin
    while Power mod 2 = 0 do
    begin
      Power:= Power div 2;
      Number:= (Number * Number) mod Module;
    end;
    Dec(Power);
    Result:= (Result * Number) mod Module;
  end;

  Writeln(Result);
  readln;
end.
