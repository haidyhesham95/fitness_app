import 'package:fitness_app/features/smart_coach_chat/data/models/smart_chat_model_response.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/entities/smart_chat_response_entity.dart';

class SmartChatMappers {
  /// Maps a `SmartChatModelResponse` (API Model) to `SmartChatResponseEntity` (Domain Model)
  static SmartChatResponseEntity mapToEntity(SmartChatModelResponse model) {
    return SmartChatResponseEntity(
      text: model.text,
      isUser: model.isUser,
      senderImageUrl: model.senderImageUrl,
      imageFile: model.imageFile,
    );
  }

  /// Maps a list of `SmartChatModelResponse` to a list of `SmartChatResponseEntity`
  static List<SmartChatResponseEntity> mapListToEntity(List<SmartChatModelResponse> models) {
    return models.map((model) => mapToEntity(model)).toList();
  }

  /// Maps a `SmartChatResponseEntity` (Domain Model) back to `SmartChatModelResponse` (API Model)
  static SmartChatModelResponse mapToModel(SmartChatResponseEntity entity) {
    return SmartChatModelResponse(
      text: entity.text,
      isUser: entity.isUser,
      senderImageUrl: entity.senderImageUrl,
      imageFile: entity.imageFile,
    );
  }

  /// Maps a list of `SmartChatResponseEntity` back to a list of `SmartChatModelResponse`
  static List<SmartChatModelResponse> mapListToModel(List<SmartChatResponseEntity> entities) {
    return entities.map((entity) => mapToModel(entity)).toList();
  }
}
