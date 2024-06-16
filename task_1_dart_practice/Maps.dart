void main() {
  // Creating a map
  Map<String, int> ages = {
    'Alice': 25,
    'Bob': 30,
    'Charlie': 35,
  };

  // Accessing values
  print(ages['Alice']); // Output: 25

  // Adding a new key-value pair
  ages['David'] = 40;

  // Updating a value
  ages['Bob'] = 31;

  // Removing a key-value pair
  ages.remove('Charlie');

  // Checking if a key exists
  print(ages.containsKey('Alice')); // Output: true

  // Iterating over a map
  ages.forEach((key, value) {
    print('$key: $value');
  });
}