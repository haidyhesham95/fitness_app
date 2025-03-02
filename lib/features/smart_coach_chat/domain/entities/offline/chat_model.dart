import 'package:fitness_app/features/smart_coach_chat/domain/entities/smart_chat_response_entity.dart';
class ChatModel {
  final int chatId;
  final String chatTitle;
  final List<SmartChatResponseEntity> messages;

  ChatModel({required this.chatId, required this.messages, required this.chatTitle});
}