import 'dart:convert';
import 'dart:math';

import 'package:sirialization/models/history.dart';
import 'package:sirialization/services/logger/logger.dart';
import 'package:sirialization/services/network/user_remote_data_service.dart';
import 'package:sirialization/storage/local_storage.dart';

class HistoryLocalDataService extends LocalStorage {
  final List<History> histories = List.empty(growable: true);

  @override
  bool init(String fileName) {
    if (super.init(fileName)) {
      return true;
    } else {
      loadHistories();
      return false;
    }
  }

  Future<void> generateHistories() async {
    final dummyData = [
      'dummy contents 1',
      'dummy contents 2',
      'dummy contents 3',
      'dummy contents 4',
      'dummy contents 5',
      'dummy contents 6',
      'dummy contents 7',
      'dummy contents 8',
      'dummy contents 9',
      'dummy contents 10',
    ];
    final userRemote = UserRemoteSourceDataService();
    final users = await userRemote.readAllUser();

    for (var i = 0; i < 10; i++) {
      final rand1 = Random().nextInt(10000);
      final rand2 = Random().nextInt(10);
      final rand3 = Random().nextInt(30);

      final history = History(
        createdAt: DateTime.now().toIso8601String(),
        history: '$rand1 history ${dummyData[rand2]}',
        user: users[rand3],
      );

      histories.add(history);
    }
    Logger.log('length => ${histories.length}');
  }

  bool saveHistories() {
    return saveFile(jsonEncode(histories));
  }

  void loadHistories() {
    _parseAllHistories(super.readFile());
    Logger.log(json);
  }

  List<History> _parseAllHistories(String jsonString) {
    final json = jsonDecode(jsonString);
    histories.addAll((json as List<dynamic>).map((e) => History.fromJson(e)));
    return histories;
  }
}
