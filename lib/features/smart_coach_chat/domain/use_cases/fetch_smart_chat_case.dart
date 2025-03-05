import 'dart:io';

import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/entities/smart_chat_response_entity.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/repositories/smart_chat_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchSmartChatCase {
  final SmartChatRepo smartChatRepo;

  FetchSmartChatCase(this.smartChatRepo);

  Stream<DataResult<List<SmartChatResponseEntity>>> call(
          String prompt, String userImageUrl, File? imageFile) =>
      smartChatRepo.fetchSmartChatResponse(prompt, userImageUrl, imageFile);
}
