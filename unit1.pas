unit Unit1; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, TAGraph, TASeries;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form1: TForm1; 

implementation

{ TForm1 }


procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var a,b,e,pred,x,s:real;
    i:integer;
function f(x:real):real;
         begin
         f:=exp(ln(5-x)*1/3)-x
         end;
begin
a:=strtofloat(edit1.text);
b:=strtofloat(edit2.text);
e:=strtofloat(edit3.text);
pred:=b;
x:=a;
repeat
      s:=x;
      x:=x-(f(x)*(x-pred))/(f(x)-f(pred));
      pred:=s;
      memo1.Lines.Add(floatToStrF(x,FFFixed,6,4));
      for i:=1 to 5 do
      Chart1LineSeries1.AddXY(pred+(x-pred)*i/5,f(pred+(x-pred)*i/5));
until (abs(x-pred)<e);
if (x>=a) and (x<=b) then
   label4.caption:=('Iskomii koren'+floatToStrF(x,FFFixed,6,4))
   else label4.caption:=('Na promejutke korneu ne naudeno');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  label4.caption:='';
  edit1.text:='';
  edit2.text:='';
  edit3.text:='';
  memo1.lines.clear;
  chart1lineseries1.clear;
end;

procedure TForm1.Label2Click(Sender: TObject);
begin

end;

procedure TForm1.Label5Click(Sender: TObject);
begin

end;

initialization
  {$I unit1.lrs}

end.

