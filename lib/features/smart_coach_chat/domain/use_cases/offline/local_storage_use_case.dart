import 'package:fitness_app/features/smart_coach_chat/data/models/offline/message_hive.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/repositories/offline/offline_contracts.dart';
import 'package:injectable/injectable.dart';

@injectable
class HiveUseCase {
  final OfflineRepo _offlineRepo;

  HiveUseCase(this._offlineRepo);

  Future<void> saveMessages(List<ChatHive> messages) async {
    final List<ChatHive> msg = [];
    if (!msg.contains(messages)) {
      msg.addAll(messages);
      return await _offlineRepo.saveMessages(msg);
    }
  }

  Future<List<ChatHive>> getMessages() async =>
      await _offlineRepo.getMessages();

  Future<List<ChatHive>> getMessagesById(String chatId) async {
    return await _offlineRepo.getMessagesById(chatId);
  }

  Future<void> deleteMessagesById(String chatId) async =>
      await _offlineRepo.deleteMessagesById(chatId);
}
