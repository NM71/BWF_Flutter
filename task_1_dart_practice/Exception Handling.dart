void main() {
  try {
    // Code that might throw an exception
    int result = 10 ~/ 0; // Throws IntegerDivisionByZeroException
    print(result);
  } catch (e) {
    // Code to handle the exception
    print('An error occurred: $e');
  } finally {
    // Code that will always execute, regardless of whether an exception was thrown or not
    print('Finally block executed');
  }
}