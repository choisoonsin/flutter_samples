Stream<int> countStream(int to) async* {
  for (var i = 1; i <= to; i++) {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield i;
  }
}

Future<void> printStream(Stream<int> stream) async {
  print(await stream.first);
}

void main() async {
  var stream = countStream(10);
  await printStream(stream);
}
