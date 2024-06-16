Future<String> fetchData() {
  // Simulating an asynchronous operation
  return Future.delayed(Duration(seconds: 2), () => 'Data fetched');
}

Future<void> main() async {
  // Calling an asynchronous function with await
  String data = await fetchData();
  print(data); // Output: Data fetched
}