import 'dart:isolate';

void backgroundTask(SendPort sendPort) {
  // Heavy computation or background task
  int result = 0;
  for (int i = 0; i < 100000000; i++) {
    result += i;
  }
  // Send the result back to the main isolate
  sendPort.send(result);
}

void startIsolate() async {
  ReceivePort receivePort = ReceivePort();
  await Isolate.spawn(backgroundTask, receivePort.sendPort);

  receivePort.listen((message) {
    print('Result from isolate: $message');
  });
}

main(){
  startIsolate();
}