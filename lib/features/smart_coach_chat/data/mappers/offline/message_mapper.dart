import 'package:fitness_app/features/smart_coach_chat/domain/entities/smart_chat_response_entity.dart';
import 'package:fitness_app/features/smart_coach_chat/data/models/offline/message_isar.dart';

class MessageMapper {
  static MessageIsar toMessageIsar(SmartChatResponseEntity entity) {
    return MessageIsar(
      text: entity.text,
      isUser: entity.isUser,
      imageUrl: entity.senderImageUrl,
    );
  }

  static ChatIsar toChatIsar(SmartChatResponseEntity entity) {
    return ChatIsar(
      chatTitle: entity.text,
      messages: [toMessageIsar(entity)],
    );
  }

  static SmartChatResponseEntity toSmartChatResponse(MessageIsar message) {
    return SmartChatResponseEntity(
      text: message.text ?? '',
      isUser: message.isUser ?? false,
      senderImageUrl: message.imageUrl ?? '',
    );
  }

  static ChatIsar toChatIsarList(List<SmartChatResponseEntity> entities) {
    return ChatIsar(
      chatTitle: entities.length > 2 ? entities[2].text : "Saved Chat",
      messages: entities.map(toMessageIsar).toList(),
    );
  }

  static List<SmartChatResponseEntity> fromChatIsar(ChatIsar chat) {
    return chat.messages?.map(toSmartChatResponse).toList() ?? [];
  }

  static List<SmartChatResponseEntity> fromChatIsarList(List<ChatIsar> chats) {
    return chats.expand((chat) => fromChatIsar(chat)).toList();
  }
}
