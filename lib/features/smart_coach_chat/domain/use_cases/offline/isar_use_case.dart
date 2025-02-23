import 'package:fitness_app/features/smart_coach_chat/domain/repositories/offline/offline_contracts.dart';
import 'package:injectable/injectable.dart';

import '../../entities/offline/message.dart';

@injectable
class IsarUseCase {
  final OfflineRepo _offlineRepo;

  IsarUseCase(this._offlineRepo);

  Future<void> saveMessages(List<Message> messages) async => await _offlineRepo.saveMessages(messages);

  Future<List<Message>> getMessages() async => await _offlineRepo.getMessages();
}