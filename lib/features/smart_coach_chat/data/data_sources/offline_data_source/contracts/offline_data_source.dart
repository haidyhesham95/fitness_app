
import '../../../models/offline/message_isar.dart';

abstract interface class OfflineDataSource {
  Future<void> saveMessages(List<ChatIsar> chats);
  Future<List<ChatIsar>> getMessages();
}