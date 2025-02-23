import 'package:fitness_app/features/smart_coach_chat/data/data_sources/offline_data_source/contracts/offline_data_source.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/entities/offline/message.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/repositories/offline/offline_contracts.dart';
import 'package:injectable/injectable.dart';

import '../../mappers/offline/message_mapper.dart';

@Injectable(as: OfflineRepo)
class OfflineRepoImpl implements OfflineRepo {
  final OfflineDataSource _offlineDataSource;

  @factoryMethod
  OfflineRepoImpl(this._offlineDataSource);

  @override
  Future<List<Message>> getMessages() async {
    final isarMessages = await _offlineDataSource.getMessages();
    return MessageMapper.toEntityList(isarMessages);
  }

  @override
  Future<void> saveMessages(List<Message> messages) async {
    final isarMessages = MessageMapper.toIsarList(messages);
    return await _offlineDataSource.saveMessages(isarMessages);
  }
}