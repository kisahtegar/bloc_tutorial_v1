Stream<int> boatStream() async* {
  for (int i = 1; i <= 10; i++) {
    print("SENT boat No. " + i.toString());
    await Future.delayed(const Duration(seconds: 2));
    yield i;
  }
}

void main(List<String> args) async {
  Stream<int> stream = boatStream();

  stream.listen((event) {
    print("RECEIVED boat No. " + event.toString());
  });
}
