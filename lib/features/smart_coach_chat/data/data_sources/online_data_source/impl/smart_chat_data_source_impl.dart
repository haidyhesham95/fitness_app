import 'dart:io';

import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/core/services/gemini_helper.dart';
import 'package:fitness_app/features/smart_coach_chat/data/data_sources/online_data_source/contract/smart_chat_online_data_source.dart';
import 'package:fitness_app/features/smart_coach_chat/data/mappers/smart_chat_mappers.dart';
import 'package:fitness_app/features/smart_coach_chat/data/models/smart_chat_model_response.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/entities/smart_chat_response_entity.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SmartChatOnlineDataSource)
class SmartChatDataSourceImpl implements SmartChatOnlineDataSource {
  final GeminiHelper _geminiHelper;

  SmartChatDataSourceImpl(this._geminiHelper);

  @override
  Stream<DataResult<List<SmartChatResponseEntity>>> fetchSmartChatResponse(
      String prompt, String userImageUrl, File? imageFile) {
    try {
      var parts = <Part>[];
      parts.add(Part.text(prompt));
      if (imageFile != null) {
        parts.add(Part.uint8List(imageFile.readAsBytesSync()));
      }

      var responseStream = _geminiHelper.gemini.promptStream(parts: parts);

      return responseStream.map((event) {
        if (event == null || event.output == null) {
          return Fail(Exception("Empty response from Gemini"));
        }

        final userRequestModel = SmartChatModelResponse(
          text: prompt,
          isUser: true,
          senderImageUrl: userImageUrl,
          imageFile: imageFile,
        );

        final botResponseModel = SmartChatModelResponse(
          text: event.output!,
          isUser: false,
          senderImageUrl: Assets.imagesBot,
          imageFile: null,
        );

        final userRequestEntity =
        SmartChatMappers.mapToEntity(userRequestModel);
        final botResponseEntity =
        SmartChatMappers.mapToEntity(botResponseModel);

        return Success([userRequestEntity, botResponseEntity]);
      });
    } catch (e) {
      return Stream.value(Fail(e as Exception?));
    }
  }

}
