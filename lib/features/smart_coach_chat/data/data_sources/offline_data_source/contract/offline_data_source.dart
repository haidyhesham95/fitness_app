import 'package:fitness_app/features/smart_coach_chat/data/models/offline/message_hive.dart';

abstract class OfflineDataSource {
  Future<void> saveMessages(List<ChatHive> messages);
  Future<List<ChatHive>> getMessages();
  Future<List<ChatHive>> getMessagesById(String chatId);
  Future<void> deleteMessagesById(String chatId);
}
