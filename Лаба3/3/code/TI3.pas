unit TI3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

const
  CountOfOutputs = 345;

type
  TfrmMain = class(TForm)
    edtKeyP: TEdit;
    edtKeyQ: TEdit;
    edtKeyN: TEdit;
    edtKeyB: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtFile: TEdit;
    btnFile: TButton;
    mmPlaintext: TMemo;
    mmCiphertext: TMemo;
    Label5: TLabel;
    Label6: TLabel;
    dialogOpen: TOpenDialog;
    dialogSave: TSaveDialog;
    btnEncryption: TButton;
    btnDecryption: TButton;
    Label7: TLabel;
    ProgressBar1: TProgressBar;
    procedure btnFileClick(Sender: TObject);
    procedure btnEncryptionClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDecryptionClick(Sender: TObject);
  end;
  TPointerOnEdit = ^TEdit;

var
  frmMain: TfrmMain;
  P, Q, N, B: Integer;
  EvklidStr: String;
  StrList, CipherTextList: TStringList;
  DStrList, B1StrList, B2StrList, YStrList, EvkStrList: TStringList;
  PlaintextFile: File of Byte;
  EncryptedFile1, EncryptedFile2, EncryptedFile3, EncryptedFile4, EncryptedFile5: File of Byte;
  Offset:Integer=0;
  size:Extended;

//Процедуры и функции
procedure CheckInput(Key: TPointerOnEdit);
function isPrimary(Key: TPointerOnEdit): Boolean;
procedure Encrypted;
function FastExp(Number, Power, Module: Int64): Integer;
procedure Evklid(P, Q: Int64; var Yp: Int64; var Yq: Int64);
procedure EncDec;
function Decrypted(CipherNumber: Integer; NameOfFile: String): String;

implementation

uses Unit1;

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  StrList:= TStringList.Create;
  CipherTextList:= TStringList.Create;
  DStrList:= TStringList.Create;
  B1StrList:= TStringList.Create;
  B2StrList:= TStringList.Create;
  YStrList:= TStringList.Create;
  EvkStrList:= TStringList.Create;
end;

procedure TfrmMain.btnFileClick(Sender: TObject);
begin
  if dialogOpen.Execute then
  begin
    AssignFile(PlaintextFile, dialogOpen.FileName);
    edtFile.Text:= dialogOpen.FileName;
  end;
end;

procedure TfrmMain.btnEncryptionClick(Sender: TObject);
var
  isAGoodNumber: Boolean;
  Number: Byte;
begin
  mmPlaintext.Clear;
  mmCiphertext.Clear;
  StrList.Clear;
  CiphertextList.Clear;

  CheckInput(@edtKeyP);
  if (edtKeyP.Text = '') or (not isPrimary(@edtKeyP)) or (StrToInt(edtKeyP.Text) > 9999) then
  begin
    ShowMessage('Неверное значение P!');
    exit;
  end;

  CheckInput(@edtKeyQ);
  if (edtKeyQ.Text = '') or (not isPrimary(@edtKeyQ)) or (StrToInt(edtKeyQ.Text) > 9999) then
  begin
    ShowMessage('Неверное значение Q!');
    exit;
  end;

  CheckInput(@edtKeyB);
  if edtKeyB.Text = '' then
  begin
    ShowMessage('Incorrect B!');
    exit;
  end;

  EncDec;

  if abs(B) > 10533 then
  begin
    ShowMessage('Too hi B(<10533)!');
    exit;
  end;

  if P = Q then
  begin
    ShowMessage('P и Q не могут быть равны!');
    exit;
  end;

  if B > N then
  begin
    ShowMessage('Неверное значение B!');
    exit;
  end;

  if N <= 255 then
  begin
    ShowMessage('Неверное значение N, выберите другие P и Q, чтобы N было больше 255');
    exit;
  end;

  if dialogOpen.FileName <> '' then
    Encrypted
  else
    ShowMessage('Выберите файл!');
end;

procedure TfrmMain.btnDecryptionClick(Sender: TObject);
var
  i, M, C: Integer;
  Str, DecStr: String;
begin
  mmPlaintext.Clear;
  mmCiphertext.Clear;
  StrList.Clear;
  CiphertextList.Clear;

  CheckInput(@edtKeyP);
  if (edtKeyP.Text = '') or (not isPrimary(@edtKeyP)) or (StrToInt(edtKeyP.Text) > 9999) then
  begin
    ShowMessage('Неверное значение P!');
    exit;
  end;

  CheckInput(@edtKeyQ);
  if (edtKeyQ.Text = '') or (not isPrimary(@edtKeyQ)) or (StrToInt(edtKeyQ.Text) > 9999) then
  begin
    ShowMessage('Неверное значение Q!');
    exit;
  end;

  CheckInput(@edtKeyB);
  if edtKeyB.Text = '' then
  begin
    ShowMessage('Неверное значение B!');
    exit;
  end;

  EncDec;

  if abs(B) > 10533 then
  begin
    ShowMessage('Ambiguous decryption!');
    exit;
  end;

  if P = Q then
  begin
    ShowMessage('P<>Q!');
    exit;
  end;

  if B > N then
  begin
    ShowMessage('B<N!');
    exit;
  end;

  {if N <= 255 then
  begin
    ShowMessage('Неверное значение N, выберите другие P и Q, чтобы N было больше 255');
    exit;
  end;}

  if edtFile.Text <> '' then
    StrList.LoadFromFile(dialogOpen.FileName)
  else
    ShowMessage('Выберите файл!');

  frmMain.dialogSave.DefaultExt:= ExtractFileExt(frmMain.dialogOpen.FileName);
  if frmMain.dialogSave.Execute then
  begin
    Str:= frmMain.dialogSave.FileName;
    Insert('1', Str, Length(Str) - 4);
    AssignFile(EncryptedFile1, Str);
    Rewrite(EncryptedFile1);

    Str:= frmMain.dialogSave.FileName;
    Insert('2', Str, Length(Str) - 4);
    AssignFile(EncryptedFile2, Str);
    Rewrite(EncryptedFile2);

    Str:= frmMain.dialogSave.FileName;
    Insert('3', Str, Length(Str) - 4);
    AssignFile(EncryptedFile3, Str);
    Rewrite(EncryptedFile3);

    Str:= frmMain.dialogSave.FileName;
    Insert('4', Str, Length(Str) - 4);
    AssignFile(EncryptedFile4, Str);
    Rewrite(EncryptedFile4);

    Str:= frmMain.dialogSave.FileName;
    Insert('Res', Str, Length(Str) - 4);
    AssignFile(EncryptedFile5, Str);
    Rewrite(EncryptedFile5);
  end;
  Offset:=0;
  i:= 0;
  while i < StrList.Count do
  begin

    C:= StrToInt(StrList[i]);
    DecStr:= Decrypted(C, Str);

    if i < CountOfOutputs then
    begin
      mmPlaintext.Text:= mmPlaintext.Text + StrList[i] + ' ';
      mmCiphertext.Lines.Add(DecStr);
    end;
    inc(Offset);
    size:=CountOfOutputs/100;
    if Offset=round(size) then
    begin
      Offset:=0;
      frmMain.ProgressBar1.Position:=frmMain.ProgressBar1.Position+1;
    end;

    Inc(i);
  end;

  CloseFile(EncryptedFile1);
  CloseFile(EncryptedFile2);
  CloseFile(EncryptedFile3);
  CloseFile(EncryptedFile4);
  CloseFile(EncryptedFile5);

  //frmValues.Show;
end;


procedure Encrypted;
var
  Number: Byte;
  i, CipherNumber: Integer;
  EncryptedFile: File of Byte;
begin
  frmMain.dialogSave.DefaultExt:= ExtractFileExt(frmMain.dialogOpen.FileName);
  if frmMain.dialogSave.Execute then
    AssignFile(EncryptedFile, frmMain.dialogSave.FileName);

  i:= 1;
  Reset(PlaintextFile);
  Offset:=0;
  while not EOF(PlaintextFile) do
  begin
    Read(PlaintextFile, Number);

    CipherNumber:= (Number * (Number + B)) mod N;
    if CipherNumber < 0 then
      CipherNumber:= N + CipherNumber;

    if i <= CountOfOutputs then
    begin
      frmMain.mmPlaintext.Text:= frmMain.mmPlaintext.Text + IntToStr(Number) + ' ';
      frmMain.mmCiphertext.Text:= frmMain.mmCiphertext.Text + IntToStr(CipherNumber) + ' ';
      Inc(i);
    end;
    CipherTextList.Add(IntToStr(CipherNumber));
    inc(Offset);
    size:=filesize(PlaintextFile)/100;
    if Offset=round(size) then
    begin
      Offset:=0;
      frmMain.ProgressBar1.Position:=frmMain.ProgressBar1.Position+1;
    end;
  end;
  CloseFile(PlaintextFile);

  CipherTextList.SaveToFile(frmMain.dialogSave.FileName);
end;

function Decrypted(CipherNumber: Integer; NameOfFile: String): String;
var
  D, b1, b2, M1, M2, invM1, invM2, inv2, d1, M: Int64;
  OutputNumber: Byte;
begin
  Result:= '';
  D:= (B * B + 4 * CipherNumber) mod N;
  if DStrList.Count < CountOfoutputs then
    DStrList.Add(IntToStr(D));

  b1:= FastExp(D, (P + 1) div 4, P);
  if B1StrList.Count < CountOfoutputs then
    B1StrList.Add(IntToStr(b1));

  b2:= FastExp(D, (Q + 1) div 4, Q);
  if B2StrList.Count < CountOfoutputs then
    B2StrList.Add(IntToStr(b2));

  M1:= N div P;
  M2:= N div Q;

  Evklid(M1, M2, invM1, invM2);
  EvklidStr:= IntToStr(invM1) + '*Q + ' + IntToStr(invM2) + '*P = 1';
  inv2:= (N div 2) + 1;

  d1:= (M1 * invM1 * b1 + M2 * invM2 * b2) mod N;
  if d1 < 0 then
    d1:= N + d1;
  if YStrList.Count < CountOfoutputs then
    YStrList.Add(IntToStr(d1));

  M:= (inv2 * (d1 - B)) mod N;
  if M < 0 then
    M:= N + M;
  OutputNumber:= M;
  Write(EncryptedFile1, OutputNumber);
  if M <= 255 then
    Write(EncryptedFile5, OutputNumber);

  Result:= Result + IntToStr(M) + ' ';

  d1:= (M1 * invM1 * (-b1) + M2 * invM2 * b2) mod N;
  if d1 < 0 then
    d1:= N + d1;
  if YStrList.Count < CountOfoutputs then
    YStrList[YStrList.Count - 1]:= YStrList[YStrList.Count - 1] + ' ' + IntToStr(d1);

  M:= (inv2 * (d1 - B)) mod N;
  if M < 0 then
    M:= N + M;
  OutputNumber:= M;
  Write(EncryptedFile2, OutputNumber);
  if M <= 255 then
    Write(EncryptedFile5, OutputNumber);

  Result:= Result + IntToStr(M) + ' ';

  d1:= (M1 * invM1 * b1 + M2 * invM2 * (-b2)) mod N;
  if d1 < 0 then
    d1:= N + d1;
  if YStrList.Count < CountOfoutputs then
    YStrList[YStrList.Count - 1]:= YStrList[YStrList.Count - 1] + ' ' + IntToStr(d1);

  M:= (inv2 * (d1 - B)) mod N;
  if M < 0 then
    M:= N + M;
  OutputNumber:= M;
  Write(EncryptedFile3, OutputNumber);
  if M <= 255 then
    Write(EncryptedFile5, OutputNumber);

  Result:= Result + IntToStr(M) + ' ';

  d1:= (M1 * invM1 * (-b1) + M2 * invM2 * (-b2)) mod N;
  if d1 < 0 then
    d1:= N + d1;
  if YStrList.Count < CountOfoutputs then
    YStrList[YStrList.Count - 1]:= YStrList[YStrList.Count - 1] + ' ' + IntToStr(d1);

  M:= (inv2 * (d1 - B)) mod N;
  if M < 0 then
    M:= N + M;
  OutputNumber:= M;
  Write(EncryptedFile4, OutputNumber);
  if M <= 255 then
    Write(EncryptedFile5, OutputNumber);

  Result:= Result + IntToStr(M) + ' ';
end;

procedure CheckInput(Key: TPointerOnEdit);
var
  Str: String;
  Res, Code: Integer;
begin
  Str:= Key^.Text;
  val(Str, Res, Code);
  while (Code <> 0) and (Str <> '') do
  begin
    Delete(Str, Code, 1);
    val(Str, Res, Code);
  end;
  Key^.Text:= Str;
end;

function isPrimary(Key: TPointerOnEdit): Boolean;
var
  i, Number, SqrtFromNumber: Integer;
begin
  Number:= StrToInt(Key^.Text);
  Result:= false;
  if Number < 0 then
    exit;

  SqrtFromNumber:= Trunc(Sqrt(Number));

  Result:= True;

  i:= 2;
  while (i <= SqrtFromNumber) and Result do
  begin
    if Number mod i = 0 then
      Result:= False;
    Inc(i);
  end;
  if Result and (Number mod 4 <> 3) then
    Result:= False;
end;

procedure EncDec;
begin
  P:= StrToInt(frmMain.edtKeyP.Text);
  Q:= StrToInt(frmMain.edtKeyQ.Text);
  N:= P * Q;
  frmMain.edtKeyN.Text:= IntToStr(N);
  B:= StrToInt(frmMain.edtKeyB.Text);
end;

function FastExp(Number, Power, Module: Int64): Integer;
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

end.
