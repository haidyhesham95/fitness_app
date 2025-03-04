import 'package:isar/isar.dart';

import '../../../models/offline/message_isar.dart';

abstract interface class OfflineDataSource {
  Future<void> saveMessages(List<ChatIsar> chats);
  Future<List<ChatIsar>> getMessages();

  Future<List<ChatIsar>> getMessagesById(Id chatId);
}