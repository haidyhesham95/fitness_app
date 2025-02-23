import 'package:fitness_app/features/smart_coach_chat/data/models/isar/message_isar.dart';

abstract interface class OfflineDataSource {
  Future<void> saveMessages(List<MessageIsar> messages);
  Future<List<MessageIsar>> getMessages();
}