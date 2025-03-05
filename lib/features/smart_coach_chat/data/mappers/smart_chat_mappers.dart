import 'package:fitness_app/features/smart_coach_chat/domain/entities/smart_chat_response_entity.dart';

import '../models/image_message_model.dart';
import '../models/smart_chat_message_model.dart';
import '../models/text_message_model.dart';

class SmartChatMappers {
  /// Factory method to map API models to Entities
  static SmartChatResponseEntity mapToEntity(SmartChatModelResponse model) {
    if (model is ImageMessageModel) {
      return ImageMessage(
        isUser: model.isUser,
        senderImageUrl: model.senderImageUrl,
        imageFile: model.imageFile!,
        text: model.text,
      );
    } else if (model is TextMessageModel) {
      return TextMessage(
        isUser: model.isUser,
        senderImageUrl: model.senderImageUrl,
        text: model.text,
      );
    } else {
      throw Exception("Unsupported model type");
    }
  }

  /// Factory method to map Entities back to API Models
  static SmartChatModelResponse mapToModel(SmartChatResponseEntity entity) {
    if (entity is ImageMessage) {
      return ImageMessageModel(
        isUser: entity.isUser,
        senderImageUrl: entity.senderImageUrl,
        imageFile: entity.imageFile,
        text: entity.text,
      );
    } else if (entity is TextMessage) {
      return TextMessageModel(
        isUser: entity.isUser,
        senderImageUrl: entity.senderImageUrl,
        text: entity.text,
      );
    } else {
      throw Exception("Unsupported entity type");
    }
  }

  /// Maps a list of API models to Entities
  static List<SmartChatResponseEntity> mapListToEntity(
      List<SmartChatModelResponse> models) {
    return models.map(mapToEntity).toList();
  }

  /// Maps a list of Entities back to API Models
  static List<SmartChatModelResponse> mapListToModel(
      List<SmartChatResponseEntity> entities) {
    return entities.map(mapToModel).toList();
  }
}
