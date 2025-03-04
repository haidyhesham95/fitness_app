import 'package:fitness_app/features/smart_coach_chat/data/models/offline/message_isar.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/entities/smart_chat_response_entity.dart';
import 'package:isar/isar.dart';

abstract interface class OfflineRepo {
  Future<void> saveMessages(List<ChatIsar> messages);
  Future<List<ChatIsar>> getMessages();

  Future<List<ChatIsar>> getMessagesById(Id chatId);
}