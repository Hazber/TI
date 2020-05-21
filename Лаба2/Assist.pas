unit Assist;

interface
function MakeExtention(var str: string):string;
function IntToBin(B:byte):string;
function BinToInt(Value: string): int64;

implementation
uses
  Main;

function MakeExtention(var str: string):string;
var
  i:integer;
  res:string;
begin
  i:=length(str);
  while str[i]<>'.' do
    dec(i);
  while i<=length(str) do
  begin
    res:=res+str[i];
    inc(i);
  end;
  MakeExtention:=res;
end;

function BinToInt(Value: string): int64;
 var
   i, iValueSize: Integer;
 begin
   Result := 0;
   iValueSize := Length(Value);
   for i := iValueSize downto 1 do
     if Value[i] = '1' then Result := Result + (1 shl (iValueSize - i));
 end;

function IntToBin(B:byte):string;
var i, Mask:integer;
begin
   Result:='';
   Mask:=1;
   for i:=0 to 7 do
   begin
    if (B and Mask)<>0 then
      Result:='1'+Result
    else Result:='0'+Result;
      Mask:=Mask shl 1;
   end;
end;

end.
 