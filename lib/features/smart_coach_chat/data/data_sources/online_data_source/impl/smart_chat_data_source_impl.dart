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
    String prompt,
    String userImageUrl,
  ) {
    try {
      var responseStream =
          _geminiHelper.gemini.promptStream(parts: [Part.text(prompt)]);

      return responseStream.map((event) {
        if (event == null || event.output == null) {
          return Fail(Exception("Empty response from Gemini"));
        }

        // Convert API response to model
        final botResponseModel = SmartChatModelResponse(
          text: event.output!,
          isUser: false,
          senderImageUrl: Assets.imagesBot,
        );

        final userRequestModel = SmartChatModelResponse(
          text: prompt,
          isUser: true,
          senderImageUrl: userImageUrl,
        );

        // Convert models to entities using mapper
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
