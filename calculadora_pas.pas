unit calculadora_pas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Character;

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

var
  Form1: TForm1;

implementation

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
type
  operands = array[0..100] of String;
var
  funnyString: String;
  var c: Char;
  var x: Integer;
  var i: Integer;
  var firstOperand: String;
  var secondOperand: String;
  var numbers: operands;
  var oper: operands;
begin
  funnyString := Edit1.Text;
  i := 0;
  firstOperand := '';
  for x := 1 to funnyString.length + 1 do
  begin
    c := funnyString[x];
    if (TCharacter.IsNumber(c) = False) or (x = funnyString.length + 1) then
    begin
      numbers[i] := firstOperand;
      oper[i] := c;
      i := i + 1;
      firstOperand := '';
      continue;
    end;
    firstOperand := firstOperand + c;
  //begin
  //     Edit2.Text := x + Edit2.Text;
  //end;

end;
  Edit2.Text := numbers[1]

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

