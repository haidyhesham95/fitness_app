import 'package:isar/isar.dart';

part 'message_isar.g.dart';


@Collection()
class ChatIsar {
  Id chatId = Isar.autoIncrement;
  late String chatTitle;
  final List<MessageIsar> messages;

  ChatIsar({required this.chatTitle, required this.messages});
}
@Embedded()
class MessageIsar {
  String? imageUrl;
  late String? text;
  late bool? isUser;
  String imageFile = '';
  MessageIsar({this.imageUrl,  this.text,  this.isUser , this.imageFile = ''});
}