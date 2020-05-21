unit Unit1;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,Shifrator_deshifratorjiVishiner;

type
  TForm1 = class(TForm)
    Key: TEdit;
    ISHOD: TMemo;
    RESULT: TMemo;
    LabelISHOD: TLabel;
    LabelRESULT: TLabel;
    LabelKEY: TLabel;
    RBIzgorod: TRadioButton;
    SHIFR: TButton;
    RBPlay: TRadioButton;
    RBVishiner: TRadioButton;
    DESHIFR: TButton;
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    English: TButton;
    Russian: TButton;
    Ready: TButton;
    Button1: TButton;
    procedure SHIFRClick(Sender: TObject);
    procedure RBPlayClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DESHIFRClick(Sender: TObject);
    procedure EnglishClick(Sender: TObject);
    procedure RussianClick(Sender: TObject);
    procedure RBIzgorodClick(Sender: TObject);
    procedure RBVishinerClick(Sender: TObject);
    procedure ReadyClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Ishod_File,Shifr_File:TextFile;
  strtoshifr,shifrik:Ansistring;
  ShifrKey:Integer;
  chiper,mess,strkey,truekeystr: string;
  FinalKey: TResultKey;
  truekey:integer;
  checkflagl:boolean=true;
  language:boolean=True;



implementation


{$R *.dfm}

procedure TForm1.SHIFRClick(Sender: TObject);
var
  shifrstr:string;

begin

  if RBIzgorod.Checked=true then
  begin
    if checkflagl then
      strtoshifr:= MemoLanguage(language)
    else
      strtoshifr:=MemoLanguageFile(language);
    truekey:=EditNumber;
    if truekey=0 then
      ShowMessage('Нет смысла кодировать с нулевым ключом')
    else
      Shifrik:=RailwaySHIFR(strtoshifr,truekey);
  end;
 // write(Shifr_file,result);

 if RbVishiner.checked=true then
  begin
    language:=False;
    if checkflagl then
      strtoshifr:=Memolanguage(language)
    else
      strtoshifr:=MemoLanguageFile(language);
    truekeystr:=EditLatina_Kirilliza(language);
    if truekeystr='' then
      ShowMessage('Нет подходящего ключа')
    else
    begin
        Shifrik:=SHIFRVisiner(strtoshifr,truekeystr)
    end;
  end;

  if RBPlay.Checked=True then
  begin
     language:=True;
     if checkflagl then
      strtoshifr:=Memolanguage(language)
    else
      strtoshifr:=MemoLanguageFile(language);
      Shifrik:=PlayFairShifr(strtoshifr);
  end;

  SaveChiperToFileandMemo(Shifrik);
end;

procedure TForm1.RBPlayClick(Sender: TObject);
begin

   Edit1.Enabled:=False;
   ISHOD.Enabled:=True;
   SHIFR.Enabled:=True;
   DESHIFR.Enabled:=True;
   English.Enabled:=False;
   Russian.Enabled:=False;
   Key.Enabled:=False;

end;

procedure TForm1.BitBtn1Click(Sender: TObject);

begin
  if Form1.OpenDialog1.Execute then
    Form1.Edit1.Text:=Form1.OpenDialog1.FileName;

  checkflagl:=false;

end;


procedure TForm1.DESHIFRClick(Sender: TObject);
begin

if RBIzgorod.Checked=true then
  begin
    if checkflagl then
      strtoshifr:= MemoLanguagede(language)
      else
      strtoshifr:=MemoLanguageFilede(language);
    truekey:=EditNumber;
    if truekey=0 then
      ShowMessage('Нет смысла кодировать с нулевым ключом')
    else
      Shifrik:=RailwaydeSHIFR(strtoshifr,truekey);
  end;

  if RBPlay.Checked=True then
  begin
     if checkflagl then
      strtoshifr:=MemolanguageDe(language)
    else
      strtoshifr:=MemoLanguageFileDe(language);
      Shifrik:=PlayFairDeShifr(strtoshifr);
  end;

  if Form1.RBVishiner.Checked then
  begin
    if checkflagl then
      strtoshifr:=MemolanguageDe(language)
    else
      strtoshifr:=MemoLanguageFileDe(language);
    truekeystr:=EditLatina_Kirilliza(language);
    if truekeystr='' then
      ShowMessage('Нет подходящего ключа')
    else
    begin
        Shifrik:=DESHIFRVisiner(strtoshifr,truekeystr)
    end;
  end;

  SaveChiperToFileandMemoDE(Shifrik);
  checkflagl:=True;
end;


procedure TForm1.EnglishClick(Sender: TObject);
begin
 language:=True;
end;

procedure TForm1.RussianClick(Sender: TObject);
begin
  language:=False;
end;

procedure TForm1.RBIzgorodClick(Sender: TObject);
begin
  // RBIzgorod.Enabled:=False;
  // RBVishiner.Enabled:=False;
   Edit1.Enabled:=True;
   ISHOD.Enabled:=True;
   SHIFR.Enabled:=True;
   DESHIFR.Enabled:=True;
   English.Enabled:=True;
   Russian.Enabled:=True;
   Key.Enabled:=True;
end;

procedure TForm1.RBVishinerClick(Sender: TObject);
begin
  // RBIzgorod.Enabled:=False;
  // RBVishiner.Enabled:=False;
   Edit1.Enabled:=True;
   ISHOD.Enabled:=True;
   SHIFR.Enabled:=True;
   DESHIFR.Enabled:=True;
   English.Enabled:=false;
   Russian.Enabled:=false;
   Key.Enabled:=True;
   language:=False;
end;

procedure TForm1.ReadyClick(Sender: TObject);
var
  f:TextFile;
  j:Integer;
  str,temp:String;
begin
  AssignFile(F,Form1.Edit1.Text);
  Reset(f);
  while not eof(F) do
  begin
    readln(F,str);
    for j:=1 to length(str) do
    begin
      if (language) then
      begin
        if ((str[j]>='A') and (str[j]<='Z')) or ((str[j]>='a') and (str[j]<='z')) then
          temp:=temp+str[j];
      end
      else
      begin
        if ((str[j]>='А') and (str[j]<='Я')) or ((str[j]>='а') and (str[j]<='я')) or (str[j]='Ё') or (str[j]='ё') then
          temp:=(temp+(str[j]));
      end;
    end;
  end;
  CloseFile(f);
  Form1.ISHOD.Lines[0]:=(temp);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
 ls:TStringList;
 WTX:PWideChar;
begin
if OpenDialog1.Execute then  // эсли выбрали файл
begin
  ls:=TStringList.Create; // создаем контейнер куда поместим наш текст
  ls.LoadFromFile(OpenDialog1.FileName); // загрузаем текст
  WTX:=StringToOleStr(ls.Text); // переделываем со стринга в видестринг
  ls.Text:=Utf8Encode(WTX);    // перекодировка
  ls.SaveToFile('gg.txt'); // сохраняем перекодированый файл
  ls.Free;   // освобождаем память
end
end;


end.
