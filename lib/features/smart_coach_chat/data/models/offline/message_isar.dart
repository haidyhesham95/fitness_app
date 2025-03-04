import 'package:isar/isar.dart';

part 'message_isar.g.dart';


@Collection()
class ChatIsar {
  Id id = Isar.autoIncrement;
  late String chatTitle;

  @Embedded()
  List<MessageIsar>? messages;

  ChatIsar({required this.chatTitle, this.messages});
}

@Embedded()
class MessageIsar {
  String? imageUrl;
  late String? text;
  late bool? isUser;

  MessageIsar({
    this.imageUrl,
    this.text,
    this.isUser,
  });
}
