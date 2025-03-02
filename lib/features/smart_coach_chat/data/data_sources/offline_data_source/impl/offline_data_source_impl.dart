import 'package:fitness_app/features/smart_coach_chat/data/models/offline/message_isar.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import '../contracts/offline_data_source.dart';

@Injectable(as: OfflineDataSource)
class OfflineDataSourceImpl implements OfflineDataSource {
  final Isar isar;

  @factoryMethod
  OfflineDataSourceImpl(this.isar);
  @override
  Future<List<ChatIsar>> getMessages() async {
    return await isar.chatIsars.where().findAll();
  }


  @override
  Future<void> saveMessages(List<ChatIsar> messages) async {
    return await isar.writeTxn(() async => await isar.chatIsars.putAll(messages));
  }

}