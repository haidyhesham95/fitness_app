import 'package:fitness_app/features/smart_coach_chat/data/models/isar/message_isar.dart';

import '../contracts/offline_data_source.dart';

class OfflineDataSourceImpl implements OfflineDataSource {
  @override
  Future<List<MessageIsar>> getMessages() {
    // TODO: implement getMessages
    throw UnimplementedError();
  }

  @override
  Future<void> saveMessages(List<MessageIsar> messages) {
    // TODO: implement saveMessages
    throw UnimplementedError();
  }
  
}