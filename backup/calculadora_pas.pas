//Feito por Arthur Koichi Nakao e Paulo Sergio Campos de Lima
unit calculadora_pas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Character, contnrs, StrUtils;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button0: TButton;
    Button10: TButton;
    ButtonClear: TButton;
    Button5: TButton;
    Button6: TButton;
    ButtonPi: TButton;
    ButtonSquare1: TButton;
    ButtonSquare2: TButton;
    ButtonTrueE: TButton;
    ButtonMult: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    ButtonDiv: TButton;
    ButtonLn: TButton;
    ButtonLog: TButton;
    ButtonFac: TButton;
    ButtonSign: TButton;
    ButtonDav: TButton;
    ButtonEqual: TButton;
    ButtonSin: TButton;
    ButtonCos: TButton;
    ButtonTan: TButton;
    ButtonRoot: TButton;
    ButtonE: TButton;
    ButtonSquareVar: TButton;
    ButtonSquare: TButton;
    ButtonInvSquare: TButton;
    ButtonMinus: TButton;
    ButtonPlus: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ButtonPoint: TButton;
    Button4: TButton;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure Button10Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button0Click(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonEqualClick(Sender: TObject);
    procedure ButtonSinClick(Sender: TObject);
    procedure ButtonSquareClick(Sender: TObject);
  private

  public

  end;
  OperatorClass = class
    public
      value: String;
      precedencia: Integer;
      constructor create(v: String);
      function ToString: AnsiString; override;
  end;
  NumberClass = class
    public
      value: String;
      constructor create(v: String);
  end;


var
  Form1: TForm1;
  GrausRadianos: boolean;

const
  e = 2.718281828459045;
  p = Pi;
implementation
{$mode objfpc} // directive to be used for defining classes
{$m+}
constructor OperatorClass.create(v: String);
begin
   value := v;
   if (v = '+') or (v = '-') then
   begin
     precedencia := 3;
   end;
   if(v = '~') then
   begin
     precedencia := 6
   end;
   if(v = '^') then
   begin
       precedencia := 5
   end;
   if(v = '/') or (v = '*') or (v = '!') then
   begin
       precedencia := 4
   end;
   if(v = '(') then
   begin
       precedencia := 1
   end;
   if(v = ')') then
   begin
       precedencia := 0
   end;
   if((v = 's') or (v = 'c') or (v = 't') or (v = 'i') or (v = 'o') or (v = 'l') or (v = 'q') or (v = 'a')) then
   begin
       precedencia := 7
   end;
end;
function OperatorClass.ToString(): AnsiString;
begin
     ToString := value;
end;

constructor NumberClass.create(v: String);
begin
   value := v;
end;

{$R *.lfm}

{ TForm1 }


procedure TForm1.Button0Click(Sender: TObject);
var
  TheButton: TButton;
  falseValue: String;
begin
  TheButton := Sender as Tbutton;
  case (TheButton.Tag) of
       271: falseValue := 'e';
       31: falseValue := 'pi';
       10: falseValue := '~';
       11: falseValue := '-';
       12: falseValue := '+';
       13: falseValue := ',';//marca
       14: falseValue := '*';
       15: falseValue := '/';
       16: falseValue := '!';
       17: falseValue := '^-1';
       18: falseValue := 'log(';
       19: falseValue := 'ln(';
       21: falseValue := 'root(';

       25: falseValue := 'e^';
       26: falseValue := '^';
       27: falseValue := '^2';
       28: falseValue := 'sqr(';
       29: falseValue := '(';
       30: falseValue := ')';
  end;
  if(CheckBox1.Checked) then
  begin
      case (TheButton.Tag) of
           24: falseValue := 'sin^-1(';
           23: falseValue := 'cos^-1(';
           22: falseValue := 'tan^-1(';
      end;
  end else
  begin
    case (TheButton.Tag) of
         24: falseValue := 'sin(';
         23: falseValue := 'cos(';
         22: falseValue := 'tan(';
    end;
  end;
  if TheButton.tag < 10 then
  begin
    falseValue := TheButton.Tag.toString();
  end;
  Edit1.Text:= Edit1.Text + falseValue;
end;

procedure TForm1.ButtonClearClick(Sender: TObject);
begin
  Edit1.Text := '';
end;

function soma(a,b:string):string;
var
  x :double;
  y :double;
  r :double;
  t:string;
begin
     x := StrToFloat(a);
     y := StrToFloat(b);
     r := 0;
   {$ASMMODE intel}
   asm
      finit
      fld y
      fld x
      fadd
      fst r
   end;
   t := FloatToStr(r);
   soma := t;
end;

function subtracao(a,b:string):string;
var
  x :double;
  y :double;
  r :double;
  t:string;
begin
     x := StrToFloat(a);
     y := StrToFloat(b);
     r := 0;
   {$ASMMODE intel}
   asm
      finit
      fld x
      fld y
      fsub
      fst r
   end;
   t := FloatToStr(r);
   subtracao := t;
end;

function multiplicacao(a,b:string):string;
var
  x :double;
  y :double;
  r :double;
  t:string;
begin
     x := StrToFloat(a);
     y := StrToFloat(b);
     r := 0;
   {$ASMMODE intel}
   asm
      finit
      fld y
      fld x
      fmul
      fst r
   end;
   t := FloatToStr(r);
   multiplicacao := t;
end;

function divisao(a,b:string):string;
var
  x :double;
  y :double;
  r :double;
  t:string;
begin
     x := StrToFloat(a);
     y := StrToFloat(b);
     r := 0;
   {$ASMMODE intel}
   asm
      finit
      fld x
      fld y
      fdiv
      fst r
   end;
   t := FloatToStr(r);
   divisao := t;
end;

function log(a:string):string;
var
  x :double;
  d :double;
  r :double;
  t:string;
begin
     x := StrToFloat(a);
     d := 10;
     r := 0;
   {$ASMMODE intel}
   asm
      finit
      fld1
      fld d
      fyl2x
      fld1
      fdivr
      fld x
      fyl2x
      fst r
   end;
   t := FloatToStr(r);
   log := t;
end;

function ln(a:string):string;
var
  x :double;
  d :double;
  r :double;
  q :double;
  t :string;
begin
     x := StrToFloat(a);
     q := e;
     r := 0;
   {$ASMMODE intel}
   asm
      finit
      fld1
      fld q
      fyl2x
      fld1
      fdivr
      fld x
      fyl2x
      fst r
   end;
   t := FloatToStr(r);
   ln := t;
end;

function potencia(a,b:string):string;
var
  x :double;
  y :double;
  r :double;
  t:string;
begin
     x := StrToFloat(a);
     y := StrToFloat(b);
     r := 0;
   {$ASMMODE intel}
   asm
      finit
      fld y
      fld1
      fld x
      fyl2x
      fmul
      fld st
      fld1
      fxch
      fprem
      fxch
      fstp r
      fsub st(1),st
      f2xm1
      fld1
      fadd
      fscale
      fst r
   end;
   t := FloatToStr(r);
   potencia := t;
end;

function raizquadrada(a:string):string;
var
  x :double;
  d :double;
  r :double;
  t:string;
begin
     x := StrToFloat(a);
     r := 0;
   {$ASMMODE intel}
   asm
      fld x
      fsqrt
      fst r
   end;
   t := FloatToStr(r);
   raizquadrada := t;
end;

function raiz(a,b:string):string;
var
  x :double;
  y :double;
  r :double;
  t:string;
begin
     x := StrToFloat(b);
     y := StrToFloat(a);
     r := 0;
   {$ASMMODE intel}
   asm
      finit
      fld1
      fld y
      fdiv
      fld1
      fld x
      fyl2x
      fmul
      fld st
      fld1
      fxch
      fprem
      fxch
      fstp r
      fsub st(1),st
      f2xm1
      fld1
      fadd
      fscale
      fst r
   end;
   t := FloatToStr(r);
   raiz := t;
end;

function sen(a:string):string;
var
   x:double;
    r:double;
    t:string;
begin
   x := StrToFloat(a);
     if(GrausRadianos = false) then
     begin
       x := GrausToRadianos(x);
     end;
     r := 0;
   {$ASMMODE intel}
   asm
      finit
      fld x
      fsin
      fst r
   end;
   t := FloatToStr(r);
   sen := t;
end;

function cos(a:string):string;
var
   x:double;
    r:double;
    t:string;
begin
   x := StrToFloat(a);
     if(GrausRadianos = false) then
     begin
       x := x * (p/ 180);
     end;
     r := 0;
   {$ASMMODE intel}
   asm
      finit
      fld x
      fcos
      fst r
   end;
   t := FloatToStr(r);
   cos := t;
end;

function tg(a:string):string;
var
   x:double;
    r:double;
    t:string;
begin
   x := StrToFloat(a);
     if(GrausRadianos = false) then
     begin
       x := x * (p/ 180);
     end;
     r := 0;
   {$ASMMODE intel}
   asm
      finit
      fld x
      fsincos
      fxch
      fdiv
      fst r
   end;
   t := FloatToStr(r);
   tg := t;
end;

function arcsen(a:string):string;
var
   x:double;
    r:double;
    v:double;
    t:string;
begin
   x := StrToFloat(a);
   v := 0.00000000001;
     r := 0;
   {$ASMMODE intel}
   asm
      finit
      fld x

      fld1
      fcom
      fstsw ax
      sahf
      je @max

      fchs
      fcom
      fstsw ax
      sahf
      je @min

      @ini:
      fld1
      fsubr
      fld1
      fld x
      fadd
      fmul
      fsqrt
      fld x
      fxch
      fpatan
      fst r
      jmp @fim
      @max:
      fstp r
      fld v
      fsub
      fst x
      jmp @ini
      @min:
      fstp r
      fld v
      fadd
      fst x
      jmp @ini
      @fim:
   end;
   if(GrausRadianos = false) then
     begin
       r := r * (180/ p);
     end;
   t := FloatToStr(r);
   arcsen := t;
end;

function arctg(a:string):string;
var
   x:double;
    r:double;
    t:string;
begin
   x := StrToFloat(a);
     r := 0;
   {$ASMMODE intel}
   asm
      finit
      fld x
      fld1
      fpatan
      fst r
   end;
   if(GrausRadianos = false) then
     begin
       r := r * (180/ p);
     end;
   t := FloatToStr(r);
   arctg := t;
end;

function arccos(a:string):string;
var
   x:double;
    r:double;
    v:double;
    t:string;
begin
   x := StrToFloat(a);
   v := 0.00000000001;
     r := 0;
   {$ASMMODE intel}
   asm
      finit
      fld x
      ftst
      fstsw ax
      sahf
      je @zer

      @ini:

      fld1
      fsubr
      fld x
      fld1
      fadd
      fmul
      fsqrt
      fld x
      fpatan

      jmp @fim
      @zer:

      fld v
      fstp x

      jmp @ini
      @fim:
      fst r
   end;
   if(GrausRadianos = false) then
     begin
       r := r * (180/ p);
     end;
   t := FloatToStr(r);
   arccos := t;
end;

function fatorial(a:string):string;
var
   x:double;
    r:double;
    t:string;
begin
   x := StrToFloat(a);
     r := 0;
     {$ASMMODE intel}
     asm
     finit
     fld x
     ftst
     fstsw ax
     sahf
     je @exc
     @ini:
     fld x
     ftst
     fstsw ax
     sahf
     je @fim

     fld1
     fsub
     fst x
     ftst
     fstsw ax
     sahf
     je @fim
     fmul

     jmp @ini
     jmp @fim
     @exc:
     fld1
     fst r
     jmp @fin
     @fim:
     fstp r
     fst r
     @fin:
     end;
     t := FloatToStr(r);
     fatorial := t;
end;

function oposto(a:string):string;
var
   x:double;
    r:double;
    t:string;
begin
   x := StrToFloat(a);
   r := 0;

   {$ASMMODE intel}
   asm
   finit
   fld x
   fchs
   fst r
   end;
   t := FloatToStr(r);
   oposto := t;
end;

function isOperator(c: Char): boolean;
begin
  if(c = '+') or (c = '-') or (c = '*') or (c = '/') or (c = '^') or (c = '~') or (c = '(') or (c = ')') or (c = '!') or (c = '~') then
  begin
    isOperator := true;
  end else
  begin
       isOperator := false;
  end;

end;

function RemoveExtraSpaces(str: string): string;
var
  i: integer;
  newStr: string;
begin
  newStr := '';
  i := 1;

  while i <= length(str) do
  begin
    if (str[i] <> ' ') then
    begin
      newStr := newStr + str[i];
    end
    else
    begin
      newStr := newStr + ' ';
      while (i <= length(str)) and (str[i] = ' ') do
        inc(i);
      dec(i);
    end;
    inc(i);
  end;

  RemoveExtraSpaces := newStr;
end;

function ReplacePiInString(const Input: string): string;
const
  PiString = '3,141592653589793'; //marca
var
  Output: string;
  Position: Integer;
begin
  Output := Input;
  Position := Pos('pi', Output);

  while Position <> 0 do
  begin
    Delete(Output, Position, 2);
    Insert(PiString, Output, Position);
    Position := Pos('pi', Output);
  end;

  Result := Output;
end;

function ReplaceEInString(const Input: string): string;
const
  PiString = '2,718281828459045';//marca
var
  Output: string;
  Position: Integer;
begin
  Output := Input;
  Position := Pos('e', Output);

  while Position <> 0 do
  begin
    Delete(Output, Position, 1);
    Insert(PiString, Output, Position);
    Position := Pos('e', Output);
  end;

  Result := Output;
end;

procedure TForm1.ButtonEqualClick(Sender: TObject);
var
   calc: String;
   cleanCalc: String;
   midCalc : String;
   c: Char;
   P1 : TObjectStack;
   P2 : TObjectStack;
   L1: String;
   i : Integer;
   number: String;
   debugClass: OperatorClass;
   operador: OperatorClass;
   operadorAtual: OperatorClass;
   numberOperator: NumberClass;
   debugNumber: NumberClass;
   firstObject: String;
   secondObject: String;
   flagReading: boolean;
   booleanTest: boolean;
   booleanTest1: boolean;
begin
  calc := ReplacePiInString(Edit1.Text);
  calc := ReplaceEInString(calc);
  L1 := '';
  number := '';
  cleanCalc := '';
  P1 := TObjectStack.create();
  P2 := TObjectStack.create();
  debugClass :=  OperatorClass(P1.Peek());
  midCalc := '';
  flagReading := false;
  if RadioButton1.Checked then GrausRadianos := false;
  if RadioButton2.Checked then GrausRadianos := true;
  for i := 1 to calc.length + 1 do
  begin
       if(IsNumber(calc[i]) or isOperator(calc[i]) or (calc[i] = ',')) and (flagReading = false) then
       begin//marca
            cleanCalc := cleanCalc + calc[i];
       end;
       if(calc[i] = '(') then
       begin
         case (midCalc) of
            'sin': midCalc := 's(';
            'cos': midCalc := 'c(';
            'tan': midCalc := 't(';
            'sin^-1': midCalc := 'i(';
            'cos^-1': midCalc := 'o(';
            'tan^-1': midCalc := 'a(';
            'sqr': midCalc := 'q(';
            'rt': midCalc := 'r(';
            'log': midCalc := 'l(';
            'ln': midCalc := 'n(';
            'root': midcalc := 'r(';
            end;
          cleanCalc := cleanCalc + midCalc;
          flagReading := false;
          midCalc := '';
       end;
       if(IsLetter(calc[i])) then
       begin
         flagReading := true;
       end;
       if(flagReading) then
       begin
         midCalc := midCalc + calc[i];
       end;
  end;
  calc := cleanCalc;
  for i := 1 to calc.length + 1 do
  begin
    c := calc[i];
    if((IsNumber(c) = false) and (c <> ',')) or (i = calc.length + 1) then
    begin //marca
      L1 := L1 + ' ' + number;
      number := '';
      if(c = '+') or (c = '-') or (c = '*') or (c = '/') or (c = '^') or (c = '~') or (c = '(') or (c = ')') or (c = 's') or (c = 'c') or (c = 't') or (c = 'i') or (c = 'o') or (c = 'a') or (c = 'q') or (c = 'r') or (c = 'l') or (c = 'n') then
      begin
        operadorAtual := OperatorClass.create(c);
        if((c = ')') and (P1.Peek() <> nil)) then
        begin
          while((P1.Peek() <> nil)  and (OperatorClass(P1.Peek()).value <> '(')) do
          begin
               L1 := L1 + ' ' + OperatorClass(P1.Pop()).value;
          end;
          P1.Pop();
          continue;
        end;
        debugClass := OperatorClass(P1.Peek());
           if(debugClass <> nil) then
           begin;
                operador := OperatorClass(P1.Peek());
                if(operadorAtual.value = '(') then
                begin
                  P1.Push(operadorAtual);
                  continue;
                end;
                if(operador.precedencia >= operadorAtual.precedencia) then
                begin
                  if(operador.value <> ')') and (operador.value <> '(') then
                  begin
                    L1 := L1 + ' ' + operador.value;
                  end;
                  P1.Pop();
                end;
                debugClass := OperatorClass(P1.Peek());
           end;
           P1.Push(operadorAtual);
           continue;
      end;
    end;
      number := number + c;
  end;
  while(P1.Peek() <> nil) do
  begin
       if(OperatorClass(P1.Peek()).value = ')') or (OperatorClass(P1.Peek()).value = '(') then
       begin
            P1.Pop();
            continue;
       end;
       L1 := L1 + ' ' + OperatorClass(P1.Pop()).value;
  end;

  L1 := RemoveExtraSpaces(L1);
  Delete(L1,1,1);
  number := '';
  for i := 1 to L1.length + 1 do
  begin
    c := L1[i];
    booleanTest := (number <> ' ') and (number <> '');
    booleanTest1 := c = ' ';
    if booleanTest and booleanTest1 then
    begin
      numberOperator := NumberClass.create(number);
      P2.Push(numberOperator);
      number := '';
      continue;
    end;
    if(IsOperator(c) or (c = 'r') or (c = 'q') or (c = 's') or (c = 'c') or (c = 't') or (c = 'i') or (c = 'o') or (c = 'a') or (c = 'q') or (c = 'r') or (c = 'l') or (c = 'n') or (c = '~')) then
    begin
      firstObject := NumberClass(P2.Pop()).value;
      if(c = '+') or (c = '-') or (c = '*') or (c = '/') or (c = 'r') or (c = '^') then
      begin
        secondObject := NumberClass(P2.Pop()).value;
      end;
      case (c) of
         '+': P2.Push(NumberClass.create(soma(firstObject, secondObject)));
         '-': P2.Push(NumberClass.create(subtracao(secondObject, firstObject)));
         '/': P2.Push(NumberClass.create(divisao(secondObject, firstObject)));
         '*': P2.Push(NumberClass.create(multiplicacao(firstObject, secondObject)));
         '^': P2.Push(NumberClass.create(potencia(secondObject, firstObject)));
         'r': P2.Push(NumberClass.create(raiz(firstObject, secondObject)));
         'q': P2.Push(NumberClass.create(raiz('2', firstObject)));
         's': P2.Push(NumberClass.create(sen(firstObject)));
         'c': P2.Push(NumberClass.create(cos(firstObject)));
         't': P2.Push(NumberClass.create(tg(firstObject)));
         'i': P2.Push(NumberClass.create(arcsen(firstObject)));
         'o': P2.Push(NumberClass.create(arccos(firstObject)));
         'a': P2.Push(NumberClass.create(arctg(firstObject)));
         'l': P2.Push(NumberClass.create(log(firstObject)));
         'n': P2.Push(NumberClass.create(ln(firstObject)));
         '!': P2.Push(NumberClass.create(fatorial(firstObject)));
         '~': P2.Push(NumberClass.create(oposto(firstObject)));

      end;
      debugNumber := NumberClass(P2.Peek());
      continue;
    end;
    if(c = ' ') then begin
      continue;
    end;
    number := number + c;
  end;
  Edit1.Text := NumberClass(P2.Peek()).value;

end;


procedure TForm1.ButtonSinClick(Sender: TObject);
begin

end;

procedure TForm1.ButtonSquareClick(Sender: TObject);
begin

end;

procedure TForm1.Button9Click(Sender: TObject);
begin

end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  Edit1.Text := Copy (Edit1.Text,0,(length(Edit1.text)-1));

end;

end.

