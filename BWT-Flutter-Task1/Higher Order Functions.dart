void main() {
  List<int> numbers = [1, 2, 3, 4, 5];

  // Using a higher-order function (map)
  List<int> doubledNumbers = numbers.map((num) => num * 2).toList();
  print(doubledNumbers);

  // Using another higher-order function (forEach)
  numbers.forEach(print);

}