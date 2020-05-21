unit Shifrator_deshifratorjiVishiner;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;
type
  TFenceChiper=array of char;
  TResultKey=array of byte;
function ProgressiveKeyGeneration(const str: string; key: string): string;
function PlayFairShifr(ishstr:string):string;
function PlayFairDeShifr(ishstr:string):string;
function SubstituteCreate(var currKey: char): string;
Function MemoLanguageFile(const Ident:boolean): string;
function RailwaySHIFR(const ishstr:string;key:integer):string;
function RailwayDESHIFR(CrypText:string;Key: Integer ): string;
function DESHIFRVisiner(var str: string; const key: string): string;
function SHIFRVisiner(var str: string; const key: string): string;

Function EditNumber:integer;
Function EditLatina_Kirilliza(const Ident:boolean):string;

Function Memolanguage(const Ident:boolean): string;
Function MemoLanguageFileDe(const Ident:boolean): string;
Function  MemoLanguageDe(const Ident:boolean): string;
procedure SaveChiperToFileandMemo(const str:string);
procedure SaveChiperToFileandMemoDe(const str:string);
function StrOemToAnsi(const aStr : String) : String;



implementation
uses
  Unit1;

function StrOemToAnsi(const aStr : String) : String;
begin
  Result := '';
  if aStr = '' then Exit;
  SetLength(Result, Length(aStr));
  OemToChar(PChar(aStr), PChar(Result));
end;

function PlayFairShifr(ishstr:string):string ;
const
  Play_Fair_Mass: array[1..5,1..5] of Char =(
  ('C','R','Y','P','T'),
  ('O','G','A','H','B'),
  ('D','E','F','I','K'),
  ('L','M','N','Q','S'),
  ('U','V','W','X','Z')
  );
var
  counter,strings,columns,strings1,strings2,columns1,columns2:Integer;
  temp_mas:array[1..2] of char;
begin
  counter:=1;
  while counter<=(Length(ishstr)-1)do
  begin
  if (Length(ishstr) mod 2<>0) then
  begin
    ishstr:=ishstr+'X';
  end;
     temp_mas[1]:=UpCase(ishstr[counter]);
     temp_mas[2]:=UpCase(ishstr[counter+1]);

     if temp_mas[1]=temp_mas[2] then
      begin
        temp_mas[2]:='X';
        counter:=counter-1
      end;

     columns1:=1;
     columns2:=1;
     strings1:=1;
     strings2:=1;
     for strings:=1 to 5 do
      for columns:=1 to 5 do
      begin
        if temp_mas[1]=Play_Fair_Mass[strings,columns] then
        begin
          columns1:=columns;
          strings1:=strings;
        end;

        if temp_mas[2]=Play_Fair_Mass[strings,columns] then
        begin
          columns2:=columns;
          strings2:=strings;
        end;

      end;


      if strings1=strings2 then
      begin
        if columns1=5 then
          columns1:=0;

         if columns2=5 then
          columns2:=0;

          temp_mas[1]:=Play_fair_mass[strings1,columns1+1];
          temp_mas[2]:=play_fair_mass[strings2,columns2+1];
          result:=result+temp_mas[1]+temp_mas[2];
      end;

      if columns1=columns2 then
      begin
        if strings1=5 then
          strings1:=0;

         if strings2=5 then
          strings2:=0;

          temp_mas[1]:=Play_fair_mass[strings1+1,columns1];
          temp_mas[2]:=play_fair_mass[strings2+1,columns2];
          result:=result+temp_mas[1]+temp_mas[2];
      end ;
     if  (strings1<>strings2) and (columns1<>columns2) then
      begin
         result:=result+play_fair_mass[strings1,columns2]+play_fair_mass[strings2,columns1];
      end;
     counter:=counter+2;
  end;


end;

function PlayFairDeShifr( ishstr:string):string ;
const
  Play_Fair_Mass: array[1..5,1..5] of Char =(
  ('C','R','Y','P','T'),
  ('O','G','A','H','B'),
  ('D','E','F','I','K'),
  ('L','M','N','Q','S'),
  ('U','V','W','X','Z')
  );
var
  counter,strings,columns,strings1,strings2,columns1,columns2:Integer;
  temp_mas:array[1..2] of char;
begin
  counter:=1;
  while counter<=(Length(ishstr)-1)do
  begin
     temp_mas[1]:=(ishstr[counter]);
     temp_mas[2]:=(ishstr[counter+1]);

     if temp_mas[1]=temp_mas[2] then
      begin
        temp_mas[2]:='X';
        counter:=counter-1
      end;

     columns1:=1;
     columns2:=1;
     strings1:=1;
     strings2:=1;
     for strings:=1 to 5 do
      for columns:=1 to 5 do
      begin
        if temp_mas[1]=Play_Fair_Mass[strings,columns] then
        begin
          columns1:=columns;
          strings1:=strings;
        end;

        if temp_mas[2]=Play_Fair_Mass[strings,columns] then
        begin
          columns2:=columns;
          strings2:=strings;
        end;

      end;


      if strings1=strings2 then
      begin
        if columns1=1 then
          columns1:=6;

         if columns2=1 then
          columns2:=6;

          temp_mas[1]:=Play_fair_mass[strings1,columns1-1];
          temp_mas[2]:=play_fair_mass[strings2,columns2-1];
          result:=result+temp_mas[1]+temp_mas[2];
      end;

      if columns1=columns2 then
      begin
        if strings1=1 then
          strings1:=6;

         if strings2=1 then
          strings2:=6;

          temp_mas[1]:=Play_fair_mass[strings1-1,columns1];
          temp_mas[2]:=play_fair_mass[strings2-1,columns2];
          result:=result+temp_mas[1]+temp_mas[2];
      end ;
     if  (strings1<>strings2) and (columns1<>columns2) then
      begin
         result:=result+play_fair_mass[strings1,columns2]+play_fair_mass[strings2,columns1];
      end;
     counter:=counter+2;
  end;
  

end;


function RailwaySHIFR(const ishstr: string;Key: Integer ): string;
var
   i, x, Period: Integer;
   CryptText: string;
begin
   if (Key <> 1) and (Key < Length(ishstr)) then
   begin
      Period := (Key - 1) * 2;
      x := 0;
      while x < Key do
      begin
         i := 1;
         while (i - x) <= Length(ishstr) do
         begin
            if ((i - x) > 0) and (x * 2 <> Period) then
               CryptText := CryptText + ishstr[i - x];
            if ((i + x) <= Length(ishstr)) and (x > 0) then
               CryptText := CryptText + ishstr[i + x];
            Inc(i, Period);
         end;
         Inc(x);
      end;
   end
   else
   begin
      CryptText := ishstr;
   end;
   RailwaySHIFR:= CryptText;
end;

procedure SaveChiperToFileandMemo(const str:string);
var
  F: Text;
begin
  AssignFile(F,'Зашифрованный текст.txt');
  Rewrite(F);
  writeln(F,str);
  Close(F);
  Form1.RESULT.Lines[0]:=str;
end;

procedure SaveChiperToFileandMemoDe(const str:string);
var
  F: Text;
begin
  AssignFile(F,'Исходный текст.txt');
  Rewrite(F);
  writeln(F,str);
  Close(F);
  Form1.RESULT.Lines[0]:=str;
end;


function RailwayDESHIFR(CrypText:string;Key: Integer ): string;
var
   Peak, i, j, x, Period: Integer;
   ishstr: string;
begin
   if (Key <> 1) and (Key < Length(CrypText)) then
   begin
      Period := (Key - 1) * 2;
      SetLength(ishstr, Length(CrypText));
      Peak := (Length(CrypText) - 1) div Period + 1;
      j := 1;
      for i := 1 to Peak do
      begin
         ishstr[j] := CrypText[i];
         Inc(j, Period);
      end;
      x := 1;
      i := Peak + 1;
      while x < Key do
      begin
         j := 1;
         while (j - x) <= Length(ishstr) do
         begin
            if ((j - x) > 0) and (x * 2 <> Period) then
            begin
               ishstr[j - x] := CrypText[i];
               Inc(i);
            end;
            if ((j + x) <= Length(ishstr)) and (x > 0) then
            begin
               ishstr[j + x] := CrypText[i];
               Inc(i);
            end;
            Inc(j, Period);
         end;
         Inc(x);
      end;
   end
   else
   begin
      ishstr := CrypText;
   end;
   RailwayDESHIFR:= ishstr;
end;

function SHIFRVisiner(var str: string; const key: string): string;
const
    Cesar:string='абвгдеёжзийклмнопрстуфхцчшщъыьэюя';
var
  FinalKey,chiper,SubsTable:string;
  i,n,n1:integer;
  Difference:integer;

begin
  FinalKey:=ProgressiveKeyGeneration(str,key);
  for i:=1 to length(FinalKey) do
  begin
    if str[i]='Ё' then
    begin
      str[i]:='ё';
    end
    else
    begin
    if (ord(str[i])<ord('а')) and (str[i]<>'ё') then
      str[i]:=char(ord(str[i])+ord('а')-ord('А'));
    end;
    n:=ord(str[i])-ord('а')+1;
    if str[i]>'е' then
      n:=n+1;
    if str[i]='ё' then
    begin
      n:=7;
    end;
    n1:=Ord(finalkey[i])-ord('а')+1;
    if FinalKey[i]>'е' then
      n1:=n1+1;
    if FinalKey[i]='ё' then
      n1:=7;

    difference:=(n1-1);
    if n+difference>33 then
    begin
     // str[i]:='а';
      difference:=difference-(33-n);
      n:=0;
    end;

    if (n+difference)=7 then
       chiper:=chiper+'ё'
     else
       chiper:=chiper+Cesar[n+difference];

  end;
  SHIFRVisiner:=chiper;
end;

function DESHIFRVisiner(var str: string; const key: string): string;
const
  Cesar='абвгдеёжзийклмнопрстуфхцчшщъыьэюя';
var
  FinalKey,chiper,SubsTable:string;
  i,n,n1:integer;
  Difference:integer;
begin
  FinalKey:=ProgressiveKeyGeneration(str,key);
  for i:=1 to length(FinalKey) do
  begin
    if (ord(str[i])<ord('а')) and (str[i]<>'ё') then
      str[i]:=char(ord(str[i])+ord('а')-ord('А'));
    n:=ord(str[i])-ord('а')+1;
    if str[i]>'е' then
      n:=n+1;
    if str[i]='ё' then
    begin
      n:=7;
    end;
    n1:=Ord(finalkey[i])-ord('а')+1;
    if FinalKey[i]>'е' then
      n1:=n1+1;
    if FinalKey[i]='ё' then
      n1:=7;

    difference:=(n1-1);
    if n-difference<0 then
    begin
      difference:=difference-(n);
      n:=33;
    end;

    if (n-difference)=7 then
       chiper:=chiper+'ё'
     else
       chiper:=chiper+Cesar[n-difference];

  end;
  DeshifrVisiner:=chiper;
end;

Function Memolanguage(const Ident:boolean): string;
var
  i,j: integer;
  F: Text;
  str,temp:string;
begin
  AssignFile(F,'Исходный текст.txt');
  Rewrite(F);
  for i:=0 to Form1.ISHOD.Lines.Count-1 do
  begin
    str:=Form1.ISHOD.Lines[i];
    for j:=1 to length(str) do
    begin
      if (Ident=true) then
      begin
        if ((str[j]>='A') and (str[j]<='Z')) or ((str[j]>='a') and (str[j]<='z')) then
          temp:=temp+str[j];
      end;
      if ident=false then
      begin
        if ((str[j]>='А') and (str[j]<='Я')) or ((str[j]>='а') and (str[j]<='я')) or (str[j]='Ё') or (str[j]='ё') then
          temp:=temp+str[j];
      end;
    end;
  end;
  writeln(F,temp);
  Close(F);
  MemoLanguage:=temp;
end;

Function MemoLanguageFile(const Ident:boolean): string;
var
  i,j: integer;
  F,F1: Text;
  str,temp:string;
begin
  AssignFile(F,Form1.Edit1.Text);
  AssignFile(F1,'Исходный текст.txt');
  Reset(F);
  Rewrite(F1);
  while not eof(F) do
  begin
    readln(F,str);
    for j:=1 to length(str) do
    begin
      if (Ident) then
      begin
        if ((str[j]>='A') and (str[j]<='Z')) or ((str[j]>='a') and (str[j]<='z')) then
          temp:=temp+str[j];
      end
      else
      begin
        if ((str[j]>='А') and (str[j]<='Я')) or ((str[j]>='а') and (str[j]<='я')) or (str[j]='Ё') or (str[j]='ё') then
          temp:=temp+str[j];
      end;
    end;
  end;
  writeln(F1,temp);
  Close(F1);
  Close(F);
  Form1.ISHOD.Lines[0]:=temp;
  MemoLanguageFile:=temp;
end;


Function MemolanguageDe(const Ident:boolean): string;
var
  i,j: integer;
  F: Text;
  str,temp:string;
begin
  AssignFile(F,'Зашифрованный текст.txt');
  Rewrite(F);
  for i:=0 to Form1.ISHOD.Lines.Count-1 do
  begin
    str:=Form1.ISHOD.Lines[i];
    for j:=1 to length(str) do
    begin
      if (Ident) then
      begin
        if ((str[j]>='A') and (str[j]<='Z')) or ((str[j]>='a') and (str[j]<='z')) then
          temp:=temp+str[j];
      end
      else
      begin
        if ((str[j]>='А') and (str[j]<='Я')) or ((str[j]>='а') and (str[j]<='я')) or (str[j]='Ё') or (str[j]='ё') then
          temp:=temp+str[j];
      end;
    end;
    end;
  writeln(F,temp);
  Close(F);
  MemoLanguageDe:=temp;
end;

Function MemoLanguageFileDe(const Ident:boolean): string;
var
  i,j: integer;
  F,F1: Text;
  str,temp:string;
begin
  AssignFile(F,Form1.Edit1.Text);
  AssignFile(F1,'Шифрованный для файла.txt');
  Reset(F);
  Rewrite(F1);
  while not eof(F) do
  begin
    readln(F,str);
    for j:=1 to length(str) do
    begin
      if (Ident) then
      begin
        if ((str[j]>='A') and (str[j]<='Z')) or ((str[j]>='a') and (str[j]<='z')) then
          temp:=temp+str[j];
      end
      else
      begin
        if ((str[j]>='А') and (str[j]<='Я')) or ((str[j]>='а') and (str[j]<='я')) or (str[j]='Ё') or (str[j]='ё') then
          temp:=temp+str[j];
      end;
    end;
    end;
  writeln(F1,temp);
  Close(F1);
  Close(F);
  Form1.ISHOD.Lines[0]:=temp;
  MemoLanguageFileDe:=temp;
end;



Function EditLatina_Kirilliza(const Ident:boolean):string;
var
  i,j: integer;
  F: Text;
  str,temp:string;
begin
  AssignFile(F,'Key.txt');
  Rewrite(F);
  str:=Form1.Key.Text;
  temp:='';
  for j:=1 to length(str) do
  begin
    if (Ident) then
    begin
      if ((str[j]>='A') and (str[j]<='Z')) or ((str[j]>='a') and (str[j]<='z')) then
      begin
        if (ord(str[j])<ord('а')) and (str[j]<>'ё') then
            str[j]:=char(ord(str[j])+ord('а')-ord('А'));
        temp:=temp+str[j];

      end;

    end
    else
    begin
      if ((str[j]>='А') and (str[j]<='Я')) or ((str[j]>='а') and (str[j]<='я')) or (str[j]='Ё') or (str[j]='ё') then
      begin
     if (ord(str[j])<ord('а')) and (str[j]<>'ё') then
            str[j]:=char(ord(str[j])+ord('а')-ord('А'));
        temp:=temp+str[j];
      end;

    end;
  end;
  writeln(F,temp);
  Close(F);
  EditLatina_Kirilliza:=temp;
end;

Function EditNumber:integer;
var
  i,j,temp: integer;
  F: Text;
  str:string;
begin
  AssignFile(F,'Key.txt');
  Rewrite(F);
  str:=Form1.Key.Text;
  temp:=0;
  for j:=1 to length(str) do
  begin
    if ((str[j]>='0') and (str[j]<='9')) then
    begin
      temp:=temp*10;
      temp:=temp+strtoint(str[j]);
    end;
  end;
  writeln(F,temp);
  Close(F);
  EditNumber:=temp;
end;


function ProgressiveKeyGeneration(const str: string; key: string): string;
var
  i,j,n: integer;
  FinalKey: string;
begin
  for i:=1 to (length(str) div length(key)) do
  begin
  FinalKey:=FinalKey+key;
  for j:=1 to Length(key) do
  begin
    case key[j] of
    'Z':
    key[j]:=Char(Ord('A')-1);
    'z':
    key[j]:=Char(Ord('a')-1);
    'Я':
    key[j]:=Char(Ord('А')-1);
    'я':
    key[j]:=Char(Ord('а')-1);
    'е':
    key[j]:=char(183);
    'Е':
    key[j]:=char(167);
    'Ё':
    key[j]:=Char(Ord('Ж')-1);
    'ё':
    key[j]:=Char(Ord('ж')-1);
    end   ;

    {if key[j]='е' then
      key[j]:='ё'}
  
      key[j]:=Char(Ord(key[j])+1)
  end;
  end;



  FinalKey:=FinalKey+copy(key,1,(length(str) mod length(key)));
  ProgressiveKeyGeneration:=FinalKey;
end;



function SubstituteCreate(var currKey: char): string;
const
  Cezar='абвгдеёжзийклмнопрстуфхцчшщъыьэюя';
var
  i,j,n: integer;
  SubsTable: string;
begin
  SubsTable:=Cezar;
  if currKey='Ё' then
    currKey:='ё'
  else
  begin
  if (ord(currKey)<ord('а')) and (currKey<>'ё') then
    currKey:=char(ord(currKey)+ord('а')-ord('А'));
  end;
  n:=ord(currKey)-ord('а');
  if currKey>'е' then
    n:=n+1;
  if currKey='ё' then
    n:=6;
  for i:=0 to 32 do
    SubsTable[i+1]:=Cezar[((i+n) mod 33)+1];
  SubstituteCreate:=SubsTable;
end;

end.
