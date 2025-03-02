import 'package:fitness_app/features/smart_coach_chat/data/models/offline/message_isar.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/entities/smart_chat_response_entity.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/repositories/offline/offline_contracts.dart';
import 'package:injectable/injectable.dart';


@injectable
class IsarUseCase {
  final OfflineRepo _offlineRepo;

  IsarUseCase(this._offlineRepo);

  Future<void> saveMessages(List<ChatIsar> messages) async {
    final List<ChatIsar> msg = [];
    if(!msg.contains(messages)){
      msg.addAll(messages);
    return await _offlineRepo.saveMessages(msg);
    }
  }

  Future<List<ChatIsar>> getMessages() async => await _offlineRepo.getMessages();
}