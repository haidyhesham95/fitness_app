
import '../../../models/offline/message_isar.dart';

abstract interface class OfflineDataSource {
  Future<void> saveMessages(List<MessageIsar> messages);
  Future<List<MessageIsar>> getMessages();
}