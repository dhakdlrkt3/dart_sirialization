import 'dart:convert';

class Logger {
  static void printJson(String json) {
    JsonDecoder decoder = JsonDecoder();
    JsonEncoder encoder = JsonEncoder.withIndent('  ');

    var object = decoder.convert(json);
    var prettyString = encoder.convert(object);
    prettyString.split('\n').forEach((element) => print(element));
  }

  static void log(Object? object) {
    print(object);
  }
}
