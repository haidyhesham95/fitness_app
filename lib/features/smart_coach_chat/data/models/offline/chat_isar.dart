import 'package:isar/isar.dart';
import 'message_isar.dart';

part 'chat_isar.g.dart';

@Collection()
class ChatIsar {
  Id chatId = Isar.autoIncrement;
  late String chatTitle;
  final messages = IsarLinks<MessageIsar>();

  ChatIsar({required this.chatTitle});
}
