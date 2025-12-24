import 'package:fitness_app/features/smart_coach_chat/data/models/offline/message_hive.dart';
import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';

import '../contract/offline_data_source.dart';

@Injectable(as: OfflineDataSource)
class OfflineDataSourceImpl implements OfflineDataSource {
  final Box<ChatHive> chatBox;

  @factoryMethod
  OfflineDataSourceImpl(this.chatBox);

  @override
  Future<List<ChatHive>> getMessages() async {
    return chatBox.values.toList();
  }

  @override
  Future<void> saveMessages(List<ChatHive> messages) async {
    for (var message in messages) {
      await chatBox.put(message.chatId, message);
    }
  }

  @override
  Future<List<ChatHive>> getMessagesById(String chatId) async {
    final chat = chatBox.get(chatId);
    return chat != null ? [chat] : [];
  }

  @override
  Future<void> deleteMessagesById(String chatId) async {
    await chatBox.delete(chatId);
  }
}
