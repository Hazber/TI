unit Shifrator_deshifrator;

interface
function LfsR(var Prev: string; const i1,i2: int64):byte;
function Gefe(var state1,state2,state3:string;var key1,key2,key3:byte):byte ;
function GoodLFSR(var state1:string;const i1,i2:integer):byte;
function LFSRfor37and27(var Prev: string; const i1,i2,i3,i4: integer):byte;
implementation
uses
  SysUtils;

function LfsR(var Prev: string; const i1,i2: int64):byte;
var
  X29,X2,newX1,Xrez:byte;
begin

  X29:=strtoint(Prev[i1]);
  X2:=strtoint(prev[i2]);
  newX1:=X29 xor X2;
  LFSR:=strtoint(prev[1]);
  Prev:=copy(Prev,2,i2)+inttostr(newX1);

end;

function LFSRfor37and27(var Prev: string; const i1,i2,i3,i4: integer):byte;
var
 // X_24,X_4,X_3,X_1:integer;
  X1,X2,X3,X4,newX1,XRez:byte;
  P:string;
begin
    //X_24:=Prev and i1;
    //if X_24=0 then
      X1:=strtoint(Prev[i1]);
    //X_4:=Prev and i2;
    //if X_4=0 then
      X2:=strtoint(Prev[i2]);
    //X_3:=Prev and i3;
    //if X_3=0 then
      X3:=strtoint(Prev[i3]);
    //X_1:=Prev and i4;
    //if X_1=0 then
      X4:=strtoint(Prev[i4]);
    newX1:=((X1 xor X2) xor X3) xor X4;
    //Prev:=(Prev shl 1);
   // Prev:=Prev or newX1;
   // Prev:=Prev and (i1*2-1);
  // P:= copy(Prev,2,i4)+inttostr(newX1);
  LFSRfor37and27:=StrToInt(Prev[1]);
  Prev:=copy(Prev,2,i4)+inttostr(newX1);

end;


function GoodLFSR(var state1:string;const i1,i2:integer):byte;
var
  key:byte; //все байт
  i:Integer;
  x1:Byte;
begin
  key:=0;
  for i:=1 to 8 do
  begin
    X1:=LFSR(state1,i1,i2);
    key:=(key shl 1) or X1
  end;
  GoodLFSR:=key ;
end;

function Gefe(var state1,state2,state3:string;var key1,key2,key3:byte):byte ;
var
  i: integer;
  key,temp,X1,X2,X3: byte;
begin
  key:=0;
  for i:=1 to 8 do
  begin
    X1:=LFSR(state1,28,1);
    X2:=LFSRfor37and27(state2,36,28,26,1);
    X3:=LFSRfor37and27(state3,27,21,20,1);
    key:=(key shl 1) or ((X1 and X2) or ((not X1) and X3));
    key1:=(key1 shl 1) or X1;
    key2:=(key2 shl 1) or X2;
    key3:=(key3 shl 1) or X3;
 end;
 Gefe:=key;
end;
end.
