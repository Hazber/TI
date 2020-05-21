unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls,Assist,Shifrator_deshifrator;

type
  TForm1 = class(TForm)
    Lfsr1: TEdit;
    lfsr2: TEdit;
    lfsr3: TEdit;
    Label1: TLabel;
    labellsfr2: TLabel;
    labellsfr3: TLabel;
    BitKey: TMemo;
    labelKey: TLabel;
    FileEdit: TEdit;
    BitBtnFile: TBitBtn;
    OpenDialog1: TOpenDialog;
    Filelabel: TLabel;
    Chiper: TMemo;
    Label2: TLabel;
    ShifrRB: TRadioButton;
    DeshifrRB: TRadioButton;
    Go: TButton;
    ProgressBar1: TProgressBar;
    Ishod: TMemo;
    labelishod: TLabel;
    btLFSRreal: TButton;
    KeyLfsr1MEMO: TMemo;
    KeyLfsr2MEMO: TMemo;
    keyLfsr3MEMO: TMemo;
    SeeBTN: TButton;
     procedure FormCreate(Sender: TObject);
    procedure BitBtnFileClick(Sender: TObject);
    procedure Lfsr1KeyPress(Sender: TObject; var Key: Char);
    procedure lfsr2KeyPress(Sender: TObject; var Key: Char);

    procedure GoClick(Sender: TObject);
    procedure lfsr3KeyPress(Sender: TObject; var Key: Char);
    procedure rbGooDLFSRClick(Sender: TObject);
    procedure btLFSRrealClick(Sender: TObject);
    procedure SeeBTNClick(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
    str: string;
    flagLFSR:boolean=true;
    flagsee:Integer=1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  str:=GetCurrentDir+'\';
end;

procedure TForm1.BitBtnFileClick(Sender: TObject);
begin
  if Form1.OpenDialog1.Execute then
    Form1.FileEdit.Text:=Form1.OpenDialog1.FileName;
end;

procedure TForm1.Lfsr1KeyPress(Sender: TObject; var Key: Char);
begin
  case key of
    '0'..'1':;
  else key:=#0;
  end;
end;



procedure TForm1.lfsr2KeyPress(Sender: TObject; var Key: Char);
begin
  case key of
    '0'..'1':;
  else key:=#0;
  end;
end;


procedure TForm1.GoClick(Sender: TObject);
var
  F,F1: File of byte;
  F2,F3: TextFile;
  bayt,chiper,j,key,key1,key2,key3: byte;
  i,n,counter: integer;
  FileName: string;
  size: real;
  state1,state2,state3:string;
  Line,Offset: int64;
begin
  Form1.Chiper.Lines.Clear;
  Form1.BitKey.Lines.Clear;
  Form1.Ishod.Lines.Clear;
  Form1.KeyLfsr1MEMO.Lines.Clear;
  Form1.KeyLfsr2MEMO.Lines.Clear;
  Form1.KeyLfsr3MEMO.Lines.Clear;
  FileName:=Form1.FileEdit.Text;
  AssignFile(F2,str+'Key.txt');
  AssignFile(F3,str+'Chiper.txt');
FileName:=Form1.FileEdit.Text;
 if (Form1.ShifrRB.Checked) then
    begin
      AssignFile(F,Form1.FileEdit.Text);
      AssignFile(F1,str+'Encrypted'+MakeExtention(FileName));
    end
  else
  begin
    AssignFile(F,str+'Encrypted'+MakeExtention(FileName));
    AssignFile(F1,str+'Decrypted'+MakeExtention(FileName));
  end;
  Reset(F);
  Rewrite(F1);
  Rewrite(F2);
  Rewrite(F3);
  if (flagLFSR) then
  begin
  SeeBTN.Visible:=true;
  if (length(Form1.LFSR1.Text)<29)or(length(Form1.LFSR2.Text)<37)or(length(Form1.LFSR3.Text)<27) then
    ShowMessage('Add decimal numbers to key')
  else
  begin
  state1:=(Lfsr1.Text);
  state2:=(lfsr2.Text);
  state3:=(lfsr3.Text);
  Line:=0;
  Offset:=0;
  n:=0;
  counter:=0;
  while not eof(F) do
  begin
    read(F,bayt);
    key:=Gefe(state1,state2,state3,key1,key2,key3);
    chiper:=key xor bayt;
    write(F1,chiper);
    writeln(F2,InttoBin(key));
    writeln(F3,InttoBin(chiper));
    inc(Offset);
    inc(n);
    inc(counter);
    size:=filesize(F)/100;
    if Offset=round(size) then
    begin
      Offset:=0;
      Form1.ProgressBar1.Position:=Form1.ProgressBar1.Position+1;
    end;
    if counter<=100 then
    begin

    begin
      Form1.Ishod.Lines[Line]:=Form1.Ishod.Lines[Line]+inttobin(bayt)+' ';

    Form1.Chiper.Lines[Line]:=Form1.Chiper.Lines[Line]+InttoBin(chiper)+' ';
    Form1.BitKey.Lines[Line]:=Form1.BitKey.Lines[Line]+InttoBin(key)+' ';
    Form1.keylfsr3MEMo.Lines[Line]:=Form1.keylfsr3MEMO.Lines[Line]+InttoBin(key1)+' ';
    Form1.keylfsr1MEMO.Lines[Line]:=Form1.keylfsr1MEMO.Lines[Line]+InttoBin(key2)+' ';
    Form1.keylfsr2MEMO.Lines[Line]:=Form1.keylfsr2MEMO.Lines[Line]+InttoBin(key3)+' ';
    if n=5 then
    begin
      n:=0;
      inc(Line);
      Form1.Chiper.Lines.Add('');
      Form1.Bitkey.Lines.Add('');
      Form1.keylfsr3MEMo.Lines.Add('');
      Form1.keylfsr1MEMo.Lines.Add('');
      Form1.keylfsr2MEMo.Lines.Add('');
      Form1.ISHOD.Lines.Add('');
    end;
    end;
    end;
    end;
  end;
  end
  else
  begin
  if (length(Form1.LFSR1.Text)<29) then
    ShowMessage('Add decimal numbers to key or check for not zero value')
  else
  begin
  state1:=(Lfsr1.Text);
  Line:=0;
  Offset:=0;
  n:=0;
  counter:=0;
  while not eof(F) do
  begin
    read(F,bayt);
    key:=GoodLFSR(state1,1,28);
    chiper:=key xor bayt;
    write(F1,chiper);
    writeln(F2,InttoBin(key));
    writeln(F3,InttoBin(chiper));
    inc(Offset);
    inc(n);
    inc(counter);
    size:=filesize(F)/100;
    if Offset=round(size) then
    begin
      Offset:=0;
      Form1.ProgressBar1.Position:=Form1.ProgressBar1.Position+1;
    end;
    if counter<=100 then
    begin

    begin
      Form1.Chiper.Lines[Line]:=Form1.Chiper.Lines[Line]+InttoBin(chiper)+' ';
      Form1.BitKey.Lines[Line]:=Form1.BitKey.Lines[Line]+InttoBin(key)+' ';
      Form1.Ishod.Lines[Line]:=Form1.Ishod.Lines[Line]+inttobin(bayt)+' ';
      if n=5 then
      begin
        n:=0;
        inc(Line);
        Form1.Chiper.Lines.Add('');
        Form1.BitKey.Lines.Add('');
        Form1.Ishod.Lines.Add('');
      end;
    end;
    end;
    end;
  end;
  end;

  Form1.ProgressBar1.Position:=0;
  CloseFile(F);
  CloseFile(F1);
  CloseFile(F2);
  CloseFile(F3);
end;

procedure TForm1.lfsr3KeyPress(Sender: TObject; var Key: Char);
begin
  case key of
    '0'..'1':;
  else key:=#0;
  end;

end;



procedure TForm1.rbGooDLFSRClick(Sender: TObject);
begin
  lfsr2.Enabled:=false;
  lfsr3.Enabled:=False;
end;

procedure TForm1.btLFSRrealClick(Sender: TObject);
begin
  lfsr2.Enabled:=false;
  lfsr3.Enabled:=False;
  flagLFSR:=False;
end;






procedure TForm1.SeeBTNClick(Sender: TObject);
begin
  if flagsee=1 then
  begin
    KeyLfsr1MEMO.Visible:=True;
    KeyLfsr2MEMO.Visible:=True;
    KeyLfsr3MEMO.Visible:=True;
    BitKey.Visible:=False;
    flagsee:=0;

  end
  else
  begin
KeyLfsr1MEMO.Visible:=false;
    KeyLfsr2MEMO.Visible:=false;
    KeyLfsr3MEMO.Visible:=false;
    flagsee:=1;
    BitKey.Visible:=True;
  end;
  end;

end.
