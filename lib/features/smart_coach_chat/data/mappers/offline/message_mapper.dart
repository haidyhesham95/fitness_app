import 'dart:convert';
import 'dart:io';

import 'package:fitness_app/features/smart_coach_chat/domain/entities/smart_chat_response_entity.dart';
import 'package:path_provider/path_provider.dart';

import '../../models/offline/message_isar.dart';

class MessageMapper {
  /// Converts a [MessageIsar] model to a [SmartChatResponseEntity].
  static Future<SmartChatResponseEntity> toEntity(MessageIsar isarModel) async {
    File? imageFile;
    if (isarModel.imageUrl!.isNotEmpty) {
      // Convert base64 string back to File
      imageFile = await base64ToFile(isarModel.imageUrl!);
    }

    return SmartChatResponseEntity(
      senderImageUrl: isarModel.imageUrl ?? '',
      text: isarModel.text ?? '',
      isUser: isarModel.isUser ?? false,
      imageFile: imageFile,
    );
  }

  /// Converts a [SmartChatResponseEntity] to a [MessageIsar] model.
  static Future<MessageIsar> toIsarModel(SmartChatResponseEntity entity) async {
    String imageUrl = '';
    if (entity.imageFile != null) {
      // Convert File to base64 string
      imageUrl = await fileToBase64(entity.imageFile!);
    }

    return MessageIsar(
      imageUrl: imageUrl,
      text: entity.text,
      isUser: entity.isUser,
    );
  }

  /// Helper function to convert File to base64 string.
  static Future<String> fileToBase64(File file) async {
    List<int> fileBytes = await file.readAsBytes();
    return base64Encode(fileBytes);
  }

  /// Helper function to convert base64 string to File.
  static Future<File> base64ToFile(String base64String) async {
    List<int> bytes = base64Decode(base64String);
    Directory tempDir = await getTemporaryDirectory();
    File file = File('${tempDir.path}/image.png');
    await file.writeAsBytes(bytes);
    return file;
  }

  /// Converts a list of [MessageIsar] models to a list of [SmartChatResponseEntity].
  static Future<List<SmartChatResponseEntity>> toEntityListFromMessages(
      List<MessageIsar> messages) async {
    return await Future.wait(messages.map((e) => toEntity(e)));
  }

  /// Converts a list of [SmartChatResponseEntity] to a list of [MessageIsar] models.
  static Future<List<MessageIsar>> toIsarList(
      List<SmartChatResponseEntity> entityList) async {
    return await Future.wait(entityList.map((e) => toIsarModel(e)));
  }

  /// Converts a [ChatIsar] model to a list of [SmartChatResponseEntity].
  static Future<List<SmartChatResponseEntity>> toEntityList(
      ChatIsar chats) async {
    return await toEntityListFromMessages(chats.messages);
  }

  /// Creates a [ChatIsar] model from a chat title and a list of messages.
  static Future<ChatIsar> toChatIsar(
      String chatTitle, List<SmartChatResponseEntity> messages) async {
    return ChatIsar(
      chatTitle: chatTitle,
      messages: await toIsarList(messages),
    );
  }

  /// Converts a list of [SmartChatResponseEntity] to a list of [ChatIsar].
  static Future<List<ChatIsar>> toChatIsarList(
      List<SmartChatResponseEntity> chatEntities) async {
    return await Future.wait(chatEntities.map((e) => toChatIsar(e.text, [e])));
  }
}
