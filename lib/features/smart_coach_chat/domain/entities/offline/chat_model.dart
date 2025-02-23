import 'message.dart';
class ChatModel {
  final int chatId;
  final String chatTitle;
  final List<Message> messages;

  ChatModel({required this.chatId, required this.messages, required this.chatTitle});
}