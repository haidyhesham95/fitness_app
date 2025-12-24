import 'package:fitness_app/features/smart_coach_chat/data/data_sources/offline_data_source/contract/offline_data_source.dart';
import 'package:fitness_app/features/smart_coach_chat/data/models/offline/message_hive.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/repositories/offline/offline_contracts.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OfflineRepo)
class OfflineRepoImpl implements OfflineRepo {
  final OfflineDataSource _offlineDataSource;

  @factoryMethod
  OfflineRepoImpl(this._offlineDataSource);

  @override
  Future<List<ChatHive>> getMessages() async {
    return await _offlineDataSource.getMessages();
  }

  @override
  Future<void> saveMessages(List<ChatHive> messages) async {
    await _offlineDataSource.saveMessages(messages);
  }

  @override
  Future<List<ChatHive>> getMessagesById(String chatId) async {
    return await _offlineDataSource.getMessagesById(chatId);
  }

  @override
  Future<void> deleteMessagesById(String chatId) async {
    await _offlineDataSource.deleteMessagesById(chatId);
  }
}
