import 'package:sirialization/services/local/user_local_data_service.dart';
import 'package:sirialization/services/logger/logger.dart';
import 'package:sirialization/services/network/user_remote_data_service.dart';

void start() async {
  // final userRemote = UserRemoteSourceDataService();
  // userRemote.readAllUser();
  // final user = await userRemote.findUser(20);
  // Logger.log('name => ${user.firstName}');

  final historyService = HistoryLocalDataService();
  historyService.init('histories.json');
  await historyService.generateHistories();
  historyService.saveHistories();
  historyService.loadHistories();

  for (var history in historyService.histories) {
    final str = 'createdAt => ${history.createdAt} \n'
        '${history.history}\n'
        '${history.user.firstName}';
    Logger.log(str);
  }

  // historyService.saveHistories();
}
