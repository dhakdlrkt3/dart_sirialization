import 'dart:io';
import 'package:sirialization/global/constants.dart';
import 'package:sirialization/services/logger/logger.dart';

abstract class LocalStorage {
  late final File file;

  bool init(String fileName) {
    try {
      file = File('${Constants.storagePath}/$fileName');
      if (!file.existsSync()) {
        file.createSync();
        file.writeAsStringSync('');
        return false;
      }
      return true;
    } catch (e) {
      Logger.log('e => $e');
      throw 'init fail';
    }
  }

  String readFile() {
    return file.readAsStringSync();
  }

  bool saveFile(String json) {
    try {
      file.writeAsStringSync(json);
      return true;
    } catch (e) {
      return false;
    }
  }
}
