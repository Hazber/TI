unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TTFMain = class(TForm)
    IshodMemo: TMemo;
    HeshMemo: TMemo;
    ChoseFile: TOpenDialog;
    SaveFile: TSaveDialog;
    lblQ: TLabel;
    lblP: TLabel;
    lblH: TLabel;
    lblX: TLabel;
    lblK: TLabel;
    edtQ: TEdit;
    edtP: TEdit;
    edtH: TEdit;
    edtX: TEdit;
    edtK: TEdit;
    lblY: TLabel;
    edtY: TEdit;
    lblHESH: TLabel;
    lblishod: TLabel;
    btnSignFile: TButton;
    btnChecksignature: TButton;
    lblResSignature: TLabel;
    lblSignature: TLabel;
    btnChooseFile: TButton;
    chkEDSisInFile: TCheckBox;
    lblOpenY: TLabel;
    procedure btnChooseFileClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSignFileClick(Sender: TObject);
    procedure btnChecksignatureClick(Sender: TObject);
   // procedure chkEDSisInFileClick(Sender: TObject);
    //procedure btnChecksignatureClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TFMain: TTFMain;

implementation
Uses
    Unit2,Math;

procedure OutputHeshValues(var reqMemo: TMemo;
                           const outputArr: TArrHeshImages);
var
  i: integer;
begin
  for i := 0 to length(outputArr)-1 do
    reqMemo.Lines.Add(IntToStr(outputArr[i]));
end;

///
function IsCorrectInput(q, p, h, x, k: longword): boolean;
var
  buf: extended;
begin
  Result:=false;
  if not(IsSimpleNumber(q)) then
  begin
    ShowMessage('Q must be simple.');
    //Result:=false;
    exit;
  end;

  if not(IsSimpleNumber(p)) then
  begin
    ShowMessage('P must be simple.');
    //Result:=false;
    exit;
  end
  else
  begin
    buf:=abs(frac((p-1)/q));
    if not(buf <= 0 + 1E-6) then
    begin
      ShowMessage('Q must be a divider(P-1).');
      //Result:=false;
      exit;
    end;
  end;

  if not((h > 1) and (h < (p-1))) then
  begin
    ShowMessage('1 <> h <> p-1');
    //Result:=false;
    exit;
  end
  else
  begin
    buf:=round(power(h, (p-1) div q)) mod p;
    if buf <= 1 then
    begin
      ShowMessage('g <> 1');
      //result:=false;
      exit;
    end;
  end;

  if not((x>0) and (x<q)) then
  begin
    ShowMessage(' 0 <> x <> q');
    exit;
  end;

  if not((k>0) and (k<q)) then
  begin
    ShowMessage('0 <> k <> q');
    exit;
  end;

  Result:=true;
end;

///
procedure TTFMAin.btnChecksignatureClick(Sender:TObject);
var
  q, p, y, h, g: longword;
  resSignature: TDigitalSignature;
  fileToSaveName: string;
  OutputResStr: string;
begin
  if (edtQ.Text='') or
     (edtP.Text='') or
     (edtH.Text='') or
     (edtY.Text='') then
  begin
    ShowMessage('Enter p,q,h,y');
    exit;
  end;

  q:=StrToInt(edtQ.Text);
  p:=StrToInt(edtP.Text);
  h:=StrToInt(edtH.Text);
  y:=StrToInt(edtY.Text);

  if not(IsCorrectInput(q, p, h, 1, 1)) then
    exit;

  g:=Round( exp(((p-1) div q) * ln(h)) ) mod p;

  if not(FileWasOpened) then
  begin
    ShowMessage('Choose file for check.');
    exit;
  end;

  if IsCorrectSignature(InitialText,SignatureFromFile, q, p, g, y) then
    outputResStr:='Signature correct!'
  else
    outputResStr:='Signature is''nt correct!';

  ShowMessage(outputResStr+#13#10+
              'W= '+IntToStr(GlobW)+#13#10+
              'U1= '+IntToStr(GlobU1)+#13#10+
              'U2= '+IntToStr(GlobU2)+#13#10+
              'V= '+IntToStr(GlobV)+#13#10);

  HeshMemo.Clear;
  OutputHeshValues(HeshMemo, HeshImsArrForOutput);
  FileWasOpened:=false;
end;

///
procedure TTFMain.btnChooseFileClick(Sender: TObject);
var
  fileName: string;
  flagIsSigned: boolean;
begin
  fileName:='';
  lblSignature.Caption:='Signature from file' +#13#10+
                         'r: '+#13#10+
                         's: ';

  if   ChoseFile.Execute then
  begin
    FileWasOpened:=true;

    fileName:=ChoseFile.FileName;
    flagIsSigned:=false;
    if chkEDSIsInFile.Checked then
    begin
      if ToExtractEDS(fileName, signatureFromFile) then
      begin
        lblSignature.Caption:='Signature from file' +#13#10+
                             'r: '+IntToStr(signatureFromFile.r)+#13#10+
                             's: '+IntToStr(signatureFromFile.s);
        flagIsSigned:=true;
      end
      else
        ShowMessage('No signature in file.');
    end;
    ToFormTextString(fileName,InitialText, flagIsSigned);
  end;

  IshodMemo.Text:=string(InitialText);
end;

///
procedure TTFMain.btnSignFileClick(Sender: TObject);
var
  q, p, h, g, x, k: longword;
  resSignature: TDigitalSignature;
  fileToSaveName: string;
begin
  if (edtQ.Text='') or
     (edtP.Text='') or
     (edtH.Text='') or
     (edtX.Text='') or
     (edtK.Text='') then
  begin
    ShowMessage('Enter p, q, h, x ,k');
    exit;
  end;

  q:=StrToInt(edtQ.Text);
  p:=StrToInt(edtP.Text);
  h:=StrToInt(edtH.Text);
  x:=StrToInt(edtX.Text);
  k:=StrToInt(edtK.Text);

  if not(IsCorrectInput(q, p, h, x, k)) then
    exit;

  if not(FileWasOpened) then
  begin
    ShowMessage('Choose file to make signature.');
    exit;
  end;

  //lblOpenP.Caption:='Открытый p:'+IntToStr(p);
  //lblOpenQ.Caption:='Открытый q:'+IntToStr(q);

  if SaveFile.Execute then
  begin
    fileToSaveName:=SaveFile.FileName;
    g:=round(power(h, (p-1) div q));
    resSignature:=ToGenerateSignature(InitialText, q, p, h, g, x, k);
    if (resSignature.r<>0) and
       (resSignature.s<>0) then
    begin
      SaveSignedText(fileToSaveName, InitialText, resSignature);
      lblResSignature.Caption:='Result signature' +#13#10+
                            'r: '+IntToStr(resSignature.r)+#13#10+
                            's: '+IntToStr(resSignature.s);

      lblOpenY.Caption:='Открытый y:'+IntToStr(OpenY);
      //Signature:=resSignature;
    end
    else
      ShowMessage('r or s =0. Enter other k.');

    HeshMemo.Clear;
    OutputHeshValues(HeshMemo, HeshImsArrForOutput);
  end
  else
    ShowMessage('Signature not create.');

  FileWasOpened:=false;
end;

///
procedure TTFMain.FormShow(Sender: TObject);
begin
  lblSignature.Caption:='Signature from file' +#13#10+
                       'r: '+#13#10+
                       's: ';

  lblResSignature.Caption:='Result signature' +#13#10+
                          'r: '+#13#10+
                          's: ';
end;


{$R *.dfm}





end.
