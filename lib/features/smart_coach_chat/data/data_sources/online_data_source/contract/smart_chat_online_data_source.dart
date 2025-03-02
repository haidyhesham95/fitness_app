import 'dart:io';

import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/entities/smart_chat_response_entity.dart';

abstract interface class SmartChatOnlineDataSource {
  Stream<DataResult<List<SmartChatResponseEntity>>> fetchSmartChatResponse(
      String prompt, String userImageUrl , File? imageFile);
}
