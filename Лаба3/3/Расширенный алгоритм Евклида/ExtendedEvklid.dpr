program ExtendedEvklid;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  a, b, x, y: Integer;

procedure gcd(a, b: Integer; var x: Integer; var y: Integer);
var
  x1, y1: Integer;
begin
  if a = 0 then
  begin
    x:= 0;
    y:= 1;
    exit;
  end;
  gcd(b mod a, a, x1, y1);
  x:= y1 - (b div a) * x1;
  y:= x1;
end;

begin
  Readln(a, b);
  gcd(a, b, x, y);
  writeln(x, y);
  readln;
end.
