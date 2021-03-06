program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  P, Q, N, B, C, M: Integer;

function FastExp(Number, Power, Module: Int64): Int64;
begin
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
end;

procedure Evklid(P, Q: Int64; var Yp: Int64; var Yq: Int64);
var
  X, Y: Int64;
begin
  if P = 0 then
  begin
    Yp:= 0;
    Yq:= 1;
    exit;
  end;
  Evklid(Q mod P, P, X, Y);
  Yp:= Y - (Q div P) * X;
  Yq:= X;
end;

procedure Decrypted(CipherNumber: Int64);
var
  D, b1, b2, M1, M2, invM1, invM2, d1, M, K, K1: Int64;
  Boof: Int64;
  Str: String;
  EncryptedFile: File of Byte;
begin
  D:= (B * B + 4 * CipherNumber) mod N;
  if D < 0 then
    D:= N + D;
  Writeln('D: ', D);
  b1:= FastExp(D, (P + 1) div 4, P);
  Writeln('b1: ', b1);
  b2:= FastExp(D, (Q + 1) div 4, Q);
  Writeln('b2: ', b2);

  M1:= N div P;
  M2:= N div Q;

  Evklid(M1, M2, invM1, invM2);
  Writeln('invM1: ', invM1);
  Writeln('invM2: ', invM2);

  K:= (N div 2) + 1;
  Writeln('inv2: ', K);

  d1:= (M1 * invM1 * b1 + M2 * invM2 * b2) mod N;
  if d1 < 0 then
    d1:= N + d1;
  Writeln('d1: ', d1);

  M:= (K * (d1 - B)) mod N;
  if M < 0 then
    M:= N + M;
  Writeln('M: ', M);

  //d1:= N - d1;
  d1:= (M1 * invM1 * (-b1) + M2 * invM2 * b2) mod N;
  if d1 < 0 then
    d1:= N + d1;
  Writeln('d1: ', d1);

  M:= (K * (d1 - B)) mod N;
  if M < 0 then
    M:= N + M;
  Writeln('M: ', M);

  //d1:= (M1 * invM1 * b1 - M2 * invM2 * b2) mod N;
  d1:= (M1 * invM1 * b1 + M2 * invM2 * (-b2)) mod N;
  if d1 < 0 then
    d1:= N + d1;
  Writeln('d1: ', d1);

  M:= (K * (d1 - B)) mod N;
  if M < 0 then
    M:= N + M;
  Writeln('M: ', M);

  //d1:= N - d1;
  d1:= (M1 * invM1 * (-b1) + M2 * invM2 * (-b2)) mod N;
  if d1 < 0 then
    d1:= N + d1;
  Writeln('d1: ', d1);

  M:= (K * (d1 - B)) mod N;
  if M < 0 then
    M:= N + M;
  Writeln('M: ', M);
end;

begin
  readln(P);
  while P mod 4 <> 3 do
  begin
    writeln('gjrdk');
    readln(P);
  end;

  readln(Q);
  while P mod 4 <> 3 do
  begin
    writeln('gjrdk');
    readln(Q);
  end;

  N:= P * Q;
  readln(B);
  while B > N do
  begin
    writeln('gjrdk');
    readln(B);
  end;

  write('Plaintext: ');
  readln(M);

  C:= (M * (M + B)) mod N;
  writeln('C: ', C);
  Decrypted(C);

  readln;
end.
