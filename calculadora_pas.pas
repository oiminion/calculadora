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
var
  funnyString: String;
  var c: Char;
  var i: Integer;
  var firstOperand: Integer;
  var secondOperand: String;
  var elemArray: Array[] of String;
begin
  i := 0;
  {funnyString := Edit1.Text;
  for c in funnyString do
      if c = '*' then
      begin
        firstOperand := '';
        secondOperand := '';
        for i := (funnyString.Length - 1) downto 0 do
            if(funnyString[i] = '*') then
            begin
              Edit1.Text := secondOperand;
              break;
            end;
            secondOperand := secondOperand + funnyString[i];
            Edit2.Text := funnyString[i] + Edit2.Text;
      end;}
  for c in funnyString do
  begin
    if TCharacter.IsNumber(c) = false then
    begin
      arrayElem[i] = firstOperand;
      i := i + 1;
      firstOperand = '';
    end;
    firstOperand = c + firstOperand;
  end;


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

