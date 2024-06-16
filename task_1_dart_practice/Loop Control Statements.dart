import 'dart:io';

void main(){

  // Statement execution no. of times
  // for, while, do-while, break, continue, labels

  // Loop Structure
  // * Counter Variable
  // * Condition Check
  // * Increment/Decrement

  // For loop (Definite): You know exactly how many time the loop will execute
  print('Using For Loop');
  // for(initialize; condition check; increment/decrement)
  for(int i = 0; i<=30; i++){
    if(i%2==0){
      print(i);
    }
  }

  print('\nFor loop using break statement');
  for (int i=1; i<=10;i++)
    {
      print(i);
      if(i==6)
        break;
    }

  print('\nFor loop using continue statement');
  for (int i=1; i<=10;i++)
  {
    if(i==6)
      continue;
    print(i);
  }

  List planetList = ["Mercury", "Venus", "Earth", "Mars"];
  print("\n\nUsing for...in loop");
  for(String planet in planetList){
    print(planet);
  }

  // While/Do-While Loop (Indefinite): You don't know exactly how many time the loop will execute
  print('\nUsing While Loop');
  int i = 1;
  while (i <= 10) {
    print(i);
    i++;
  }

  print('\nUsing do-while loop');
  int j =1;
  do{
    print(j);
    j++;
  }while(j<=10);

}