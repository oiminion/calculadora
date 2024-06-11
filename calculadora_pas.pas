unit calculadora_pas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Character, contnrs, StrUtils;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button0: TButton;
    Button5: TButton;
    Button6: TButton;
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
    ButtonComma: TButton;
    ButtonPlus: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ButtonPoint: TButton;
    Button4: TButton;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure Button9Click(Sender: TObject);
    procedure Button0Click(Sender: TObject);
    procedure ButtonEqualClick(Sender: TObject);
    procedure ButtonSinClick(Sender: TObject);
    procedure ButtonSquareClick(Sender: TObject);
  private

  public

  end;
  OperatorClass = class
    public
      value: Char;
      precedencia: Integer;
      constructor create(v: Char);
      function ToString: AnsiString; override;
  end;


var
  Form1: TForm1;

implementation
{$mode objfpc} // directive to be used for defining classes
{$m+}
constructor OperatorClass.create(v: Char);
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
   if(v = '/') or (v = '*') then
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
end;
function OperatorClass.ToString(): AnsiString;
begin
     ToString := value;
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
       11: falseValue := ',';
       12: falseValue := '+';
       13: falseValue := '.';
       14: falseValue := '*';
       15: falseValue := '/';
  end;
  if TheButton.tag < 10 then
  begin
    falseValue := TheButton.Tag.toString();
  end;
  Edit1.Text:= Edit1.Text + falseValue;

end;

procedure TForm1.ButtonEqualClick(Sender: TObject);
var
   calc: String;
   c: Char;
   P1 : TObjectStack;
   L1: String;
   i : Integer;
   number: String;
   debugVar: String;
   operador: OperatorClass;
   operadorAtual: OperatorClass;
begin
  calc := Edit1.Text;
  L1 := '';
  number := '';
  P1 := TObjectStack.create();
  for i := 1 to calc.length + 1 do
  begin
    c := calc[i];
    if(IsNumber(c) = false) or (i = calc.length + 1) then
    begin
      L1 := L1 + number;
      number := '';
      if(c = '+') or (c = '-') or (c = '*') or (c = '/') or (c = '^') or (c = '~') or (c = '(') or (c = ')') then
      begin
        operadorAtual := OperatorClass.create(c);
           while(P1.Peek().ToString() <> '') do
           begin
                operador := P1.Pop();
                if(operador.precedencia >= operadorAtual.precedencia) then
                begin
                  L1 = operadorAtual + L1;
                end;
           end;
      end;
        P1.Push(operador);
    end;
      number := number + c;
  end;
  Edit2.Text := P1.Peek().ToString();
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

end.

