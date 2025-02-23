import '../../entities/offline/message.dart';

abstract interface class OfflineRepo {
  Future<void> saveMessages(List<Message> messages);
  Future<List<Message>> getMessages();
}