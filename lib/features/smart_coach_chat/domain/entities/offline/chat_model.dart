import 'package:fitness_app/features/smart_coach_chat/domain/entities/message.dart';

class ChatModel {
  final int chatId;
  final List<Message> messages;

  ChatModel({required this.chatId, required this.messages});
}