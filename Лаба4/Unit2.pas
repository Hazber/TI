unit Unit2;

interface
Type
  TArrHeshImages = array of longword;

  TDigitalSignature = record
    r, s: longword;
  end;
Var
    InitialText: ansistring = '';
  SignedText: ansistring = '';
  FileWasOpened: boolean = false;
  OpenY, OpenG: longword;
  Signature: TDigitalSignature;
  signatureFromFile: TDigitalSignature;
  GlobW, GlobU1, GlobU2, GlobV: longword;
  HeshImsArrForOutput: TArrHeshImages;

  function isSimpleNumber(a: longword): boolean;

procedure ToFormTextString(const FileName: string;
                           var ReqStr: ansistring;
                           isSigned: boolean);

function ToExtractEDS(const fName: string;
                      var fileSignature: TDigitalSignature): boolean;

function ToGenerateSignature(const reqMessage: ansistring;
                             q, p, h, g, x, k: longword): TDigitalSignature;

function IsCorrectSignature(const mesgeToCheck: ansistring;
                            const fileSignature: TDigitalSignature;
                            moduleQ, moduleP, reqG, reqY: longword): boolean;

procedure SaveSignedText(const fileName: string;
                         const reqText: ansistring;
                         const reqSignature: TDigitalSignature);

implementation
Uses
  Math, SysUtils, Dialogs;




///
function FastExp(a:longword;
                 z, n: longword): int64;
var
  a1, z1, x: longword;
begin
  a1:=a;
  z1:=z;
  x:=1;
  while z1<>0 do
  begin
    while (z1 mod 2=0) do
    begin
      z1:=z1 div 2;
      a1:=(a1*a1) mod n;
    end;

    z1:=z1-1;
    x:=(x*a1) mod n;
  end;

  Result:=x;
end;

///
function isSimpleNumber(a: longword): boolean;
var
  i: longword;
begin
  Result:=True;
  if a<=1 then
    Result:=false;
  for i := 2 to Trunc(sqrt(a)) do
    if a mod i = 0 then
      Result:= false;
end;

///
procedure ToFormTextString(const FileName: string;
                           var ReqStr: ansistring;
                           isSigned: boolean);
var
  curF: TextFile;
  curStr: ansistring;
  strNum, i: integer;
begin
  ReqStr:='';
  strNum:=0;

  AssignFile(CurF, FileName);
  Reset(CurF);
  if not(isSigned) then
  begin
    while not(eof(CurF)) do
    begin
      Readln(CurF,CurStr);
      CurStr:=CurStr+#13#10;
      reqStr:=ReqStr+CurStr;
    end;

  end
  else
  begin
    while not(eof(CurF)) do
    begin
      inc(strNum);
      readln(CurF);
    end;

    CloseFile(curF);
    Reset(curF);
    for i := 1 to strNum-2 do
    begin
      Readln(CurF,CurStr);
      CurStr:=CurStr+#13#10;
      reqStr:=ReqStr+CurStr;
    end;
  end;

  Delete(reqStr, length(reqStr)-1, 2);
  CloseFile(Curf);
end;

///
procedure UseHeshFunc(const curMessage: ansistring;
                      module: longword;
                      var heshArr: TArrHeshImages);
var
  hPrev, hCur: longword;
  mi: longword;
  symb: ansichar;
  i: integer;
begin
  if curMessage='' then
  begin
    SetLength(HeshArr, 1);
    heshArr[0]:=100;
    exit;
  end;
  SetLength(HeshArr, length(curMessage));
  hPrev:=100;
  for i := 1 to length(HeshArr) do
  begin
    symb:=curMessage[i];
    mi:=longword(symb);
    //mi:= mi - ord('À')+1;
    hCur:=FastExp(hPrev+mi, 2, module);
    heshArr[i-1]:=hCur;
    hPrev:=hCur;
  end;
end;

///
function ToExtractEDS(const fName: string;
                      var fileSignature: TDigitalSignature): boolean;
var
  f: TextFile;
  strNum: integer;
  i: integer;
  curR, curS: string;
begin
  Result:=true;
  AssignFile(f, fName);
  Reset(f);
  strNum:=0;
  while not(eof(f)) do
  begin
    inc(strNum);
    Readln(f);
  end;
  CloseFile(f);

  fileSignature.r:=0;
  fileSignature.s:=0;

  Reset(f);
  if strNum<2 then
    Result:=false
  else
  begin
    for i := 1 to strNum-2 do
      readln(f);

    readln(f, curR);
    readln(f, curS);
    fileSignature.r:=strToInt(curR);
    fileSignature.s:=strToInt(curS);
  end;
  CloseFile(f);
end;

///
procedure SaveSignedText(const fileName: string;
                         const reqText: ansistring;
                         const reqSignature: TDigitalSignature);
var
  reqFile: TextFile;
begin
  AssignFile(reqFile, fileName);
  Rewrite(reqFile);
  writeln(reqFile, reqText);
  writeln(reqFile, reqSignature.r);
  write(reqFile, reqSignature.s);
  CloseFile(reqFile);
end;

///
function ToGenerateSignature(const reqMessage: ansistring;
                             q, p, h, g, x, k: longword): TDigitalSignature;
var
  y, mesgeHeshImage: longword;
  heshImagesArr: TArrHeshImages;
  r, s: longword;
begin
  g:=Round( exp(((p-1) div q) * ln(h)) ) mod p;
  y:=fastExp(g, x, p);
  UseHeshFunc(reqMessage, q, heshImagesArr);
  HeshImsArrForOutput:=copy(heshImagesArr, 0, length(heshImagesArr));
  mesgeHeshImage:=heshImagesArr[length(heshImagesArr)-1];
  r:=FastExp(g, k, p) mod q;
  s:=(FastExp(k, q-2, q) * ((mesgeHeshImage mod q) + (x*r mod q))) mod q;
  Result.r:=r;
  Result.s:=s;
  if (r<>0) and (s<>0) then
    OpenY:=y
  else
    OpenY:=0;
end;

///
function IsCorrectSignature(const mesgeToCheck: ansistring;
                            const fileSignature: TDigitalSignature;
                            moduleQ, moduleP, reqG, reqY: longword): boolean;
var
  w, u1, u2, v: longword;
  mesgeHeshImage: longword;
  heshImagesArr: TArrHeshImages;
begin
  w:=FastExp(fileSignature.s, moduleQ-2, moduleQ);

  UseHeshFunc(mesgeToCheck, moduleQ, heshImagesArr);
  mesgeHeshImage:=heshImagesArr[length(heshImagesArr)-1];
  u1:=w*mesgeHeshImage mod moduleQ;
  u2:=w*fileSignature.r mod moduleQ;
  v:=(FastExp(reqG, u1, moduleP)*(FastExp(reqY, u2, moduleP))) mod moduleP;
  v:=v mod moduleQ;

  if v=fileSignature.r then
    Result:=true
  else
    Result:=false;

  GlobW:=w;
  GlobU1:=u1;
  GlobU2:=u2;
  GlobV:=v;
end;



end.
 