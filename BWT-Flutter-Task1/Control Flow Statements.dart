import 'dart:io';

void main(){

  // IF-Else
  var salary = 50000;
  if (salary>15000){
    print('Congrats!, You are worthy');
  } else{
    print('You need to work hard');
  }

  // IF-ELSE Ladder statements
  var marks = -80;
  if(marks>=90 && marks<100){
    print('A+ Grade');
  }else if(marks>=80 && marks<90){
    print('A Grade');
  }else if(marks>=70 && marks<80){
    print('B Grade');
  }else if(marks>=60 && marks<70){
    print('C Grade');
  }else if(marks>=50 && marks<60){
    print('D Grade');
  }else if(marks<50 && marks>0){
    print('Failed');
  }else if(marks<0){
    print("Marks can't be negative!");
  }


  // Conditional Expressions: Ternary operator
  var a = 40;
  var b = 60;
  // condition ? expl : exp2, If condition is true, evaluates expr 1 (and returns its value);
  // otherwise, evaluates and returns the value of expr2.
  a<b ? print('a is smaller') : print('b is smaller');

  // exp1 ?? exp2, If expr1 is non-null, returns its value; otherwise, evaluates and
  // returns the value of expr2.
  String name = "Nousher";
  String nameToPrint = name ?? "Guest User";
  print(nameToPrint);


  // Switch Case Statements: Applicable for 'int' and 'String' only (can't use bool or double)
  String grade = 'C';

  switch(grade){
    case 'A':
      print('Excellent!');
      break;

    case 'B':
      print('Good');
      break;

    case 'C':
      print('Fair');
      break;

    case 'D':
      print('Not Good');
      break;

    case 'F':
      print("You've failed");
      break;

    default:
      print('Invalid Grade');
      break;
  }

}