import 'dart:io';

import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/core/services/gemini_helper.dart';
import 'package:fitness_app/features/smart_coach_chat/data/data_sources/online_data_source/contract/smart_chat_online_data_source.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/entities/smart_chat_response_entity.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SmartChatOnlineDataSource)
class GeminiSmartChatDataSource implements SmartChatOnlineDataSource {
  final GeminiHelper _geminiHelper;

  GeminiSmartChatDataSource(this._geminiHelper);

  @override
  Stream<DataResult<List<SmartChatResponseEntity>>> fetchSmartChatResponse(
      String prompt, String userImageUrl, File? imageFile) {
    try {
      List<Part> parts = [];

      if (prompt.isNotEmpty) {
        parts.add(Part.text(prompt));
      }

      if (imageFile != null) {
        parts.add(Part.uint8List(imageFile.readAsBytesSync()));
      }

      var responseStream = _geminiHelper.gemini.promptStream(parts: parts);

      return responseStream.map((event) {
        if (event?.output == null) {
          return Fail(Exception("Empty response from Gemini"));
        }

        final userRequestEntity =
        _createEntity(prompt, userImageUrl, imageFile, true);
        final botResponseEntity =
        _createEntity(event!.output!, Assets.imagesBot, null, false);

        return Success([userRequestEntity, botResponseEntity]);
      });
    } catch (e) {
      debugPrint(" Error: ${e.toString()}");
      return Stream.value(
          Fail(Exception("Failed to fetch chat response: ${e.toString()}")));
    }
  }



SmartChatResponseEntity _createEntity(
    String text, String senderImageUrl, File? imageFile, bool isUser) {
  if (imageFile != null) {
    return ImageMessage(
      isUser: isUser,
      senderImageUrl: senderImageUrl,
      imageFile: imageFile,
      text: text.isNotEmpty ? text : null,
    );
  } else if (text.isNotEmpty) {
    return TextMessage(
      isUser: isUser,
      senderImageUrl: senderImageUrl,
      text: text,
    );
  }
  throw Exception("Invalid message: Both text and image are empty");
}
}
