import 'package:hive_ce/hive.dart';

part 'message_hive.g.dart';

@HiveType(typeId: 0)
class ChatHive extends HiveObject {
  @HiveField(0)
  late String chatTitle;

  @HiveField(1)
  List<MessageHive>? messages;

  @HiveField(2)
  late String chatId;

  ChatHive({required this.chatTitle, this.messages, required this.chatId});
}

@HiveType(typeId: 1)
class MessageHive {
  @HiveField(0)
  String? imageUrl;

  @HiveField(1)
  late String? text;

  @HiveField(2)
  late bool? isUser;

  @HiveField(3)
  late String? imageFile;

  MessageHive({
    this.imageUrl,
    this.text,
    this.isUser,
    this.imageFile,
  });
}
