import 'package:fitness_app/features/smart_coach_chat/domain/entities/smart_chat_response_entity.dart';
import '../../models/offline/message_isar.dart';

class MessageMapper {
  /// Converts a [MessageIsar] model to a [SmartChatResponseEntity].
  static SmartChatResponseEntity toEntity(MessageIsar isarModel) {
    return SmartChatResponseEntity(
      senderImageUrl: isarModel.imageUrl ?? '',
      text: isarModel.text ?? '',
      isUser: isarModel.isUser ?? false,
    );
  }

  /// Converts a [SmartChatResponseEntity] to a [MessageIsar] model.
  static MessageIsar toIsarModel(SmartChatResponseEntity entity) {
    return MessageIsar(
      imageUrl: entity.senderImageUrl,
      text: entity.text,
      isUser: entity.isUser,
    );
  }

  /// Converts a list of [MessageIsar] models to a list of [SmartChatResponseEntity].
  static List<SmartChatResponseEntity> toEntityListFromMessages(List<MessageIsar> messages) {
    return messages.map((e) => toEntity(e)).toList();
  }

  /// Converts a list of [SmartChatResponseEntity] to a list of [MessageIsar] models.
  static List<MessageIsar> toIsarList(List<SmartChatResponseEntity> entityList) {
    return entityList.map((e) => toIsarModel(e)).toList();
  }

  /// Converts a [ChatIsar] model to a list of [SmartChatResponseEntity].
  static List<SmartChatResponseEntity> toEntityList(ChatIsar chats) {
    return chats.messages.map((e) => toEntity(e)).toList();
  }

  /// Converts a [ChatIsar] object into a list of [SmartChatResponseEntity].
  static List<SmartChatResponseEntity> extractMessagesFromChat(ChatIsar chat) {
    return toEntityListFromMessages(chat.messages);
  }

  /// Creates a [ChatIsar] model from a chat title and a list of messages.
  static ChatIsar toChatIsar(String chatTitle, List<SmartChatResponseEntity> messages) {
    return ChatIsar(
      chatTitle: chatTitle,
      messages: toIsarList(messages),
    );
  }

  /// Converts a list of [SmartChatResponseEntity] to a list of [ChatIsar].
  static List<ChatIsar> toChatIsarList(List<SmartChatResponseEntity> chatEntities) {
    return chatEntities.map((e) => toChatIsar(e.text, [e])).toList();
  }
}
