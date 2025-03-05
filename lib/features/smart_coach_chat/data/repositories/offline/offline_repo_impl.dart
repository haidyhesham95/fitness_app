import 'package:fitness_app/features/smart_coach_chat/data/data_sources/offline_data_source/contracts/offline_data_source.dart';
import 'package:fitness_app/features/smart_coach_chat/data/models/offline/message_isar.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/repositories/offline/offline_contracts.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

@Injectable(as: OfflineRepo)
class OfflineRepoImpl implements OfflineRepo {
  final OfflineDataSource _offlineDataSource;

  @factoryMethod
  OfflineRepoImpl(this._offlineDataSource);

  @override
  Future<List<ChatIsar>> getMessages() async {
    return await _offlineDataSource.getMessages();
  }

  @override
  Future<void> saveMessages(List<ChatIsar> messages) async {
    await _offlineDataSource.saveMessages(messages);
  }

  @override
  Future<List<ChatIsar>> getMessagesById(Id chatId) async {
    return await _offlineDataSource.getMessagesById(chatId);
  }
}