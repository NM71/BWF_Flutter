void main(){

  // String representation: In Dart we have the flexibility of representing string in both single ('') and double ("") quotes.
  // Literals: 2, "Nousher", 4.5, true;

  String s1 = 'Single';
  String s2 = "Double";

  // String s3 = 'It's easy';
  // For apostrophe representation we use escape characters, we can write the above example like:
  String s3 = 'It\'s easy';
  print(s3);
  String s4 = "It's easy"; // If we use double quotes, then we don't have to use escape characters
  print(s4);

  // In Dart we can write two strings like the below example, but it will considered a single long string by the compiler
  String s5 = 'This is going to be a very long string.'
      'This is just a sample String demo in Dart programming Language';

  // String Interpolation ($)
  String Name = "Nousher";
  // String message = "My name is " +  name; // A bad practice
  print('My name is $Name');
  // Use the {} braces for any method applying on variable in Interpolation, for displaying variable only don't use {} braces.
  print('My number of characters in the String Nousher are ${Name.length}.');

  // -------------------------------------------------------------

  // Constants

  final age = 20;
  const PI = 3.14;

  // final vs const
  // final variable can only be set once and it is initialized when accessed (Memory is not allocated to the variable unless it is used somewhere in the program).
  // const variable is implicitly final but it is a compile-time constant (Memory is allocated when program is compiled whether we have used it or not)
  // Instance variables can be final but not const, for making it const we have to use static keyword.

  final cityName = 'Islamabad';


}