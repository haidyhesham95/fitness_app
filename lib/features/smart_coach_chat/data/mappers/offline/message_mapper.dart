import '../../../domain/entities/offline/message.dart';
import '../../models/offline/message_isar.dart';

class MessageMapper {
  static Message toEntity(MessageIsar isarModel) {
    return Message(
      imageUrl: isarModel.imageUrl,
      text: isarModel.text,
      isUser: isarModel.isUser,
    );
  }

  static MessageIsar toIsarModel(Message entity) {
    return MessageIsar(
      imageUrl: entity.imageUrl,
      text: entity.text,
      isUser: entity.isUser,
    );
  }

  static List<Message> toEntityList(List<MessageIsar> isarList) {
    return isarList.map((e) => toEntity(e)).toList();
  }

  static List<MessageIsar> toIsarList(List<Message> entityList) {
    return entityList.map((e) => toIsarModel(e)).toList();
  }
}
