void main() {
  // Creating a stream
  Stream<int> countStream = Stream.periodic(Duration(seconds: 1), (count) => count);

  // Listening to the stream
  countStream.listen(
        (data) => print('Received: $data'),
    onError: (error) => print('Error: $error'),
    onDone: () => print('Stream completed'),
  );
}