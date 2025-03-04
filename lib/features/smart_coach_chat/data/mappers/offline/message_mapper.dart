import 'dart:convert';
import 'dart:io';

import 'package:fitness_app/features/smart_coach_chat/domain/entities/smart_chat_response_entity.dart';
import 'package:fitness_app/features/smart_coach_chat/data/models/offline/message_isar.dart';
import 'package:path_provider/path_provider.dart';

class MessageMapper {
  static Future<MessageIsar> toMessageIsar(SmartChatResponseEntity entity) async {
    String? imageUrl;
    if (entity.imageFile != null) {
      imageUrl = await fileToBase64(entity.imageFile!);
    }
    return MessageIsar(
      text: entity.text,
      isUser: entity.isUser,
      imageUrl: imageUrl,
    );
  }

  static Future<ChatIsar> toChatIsar(SmartChatResponseEntity entity) async{
    return ChatIsar(
      chatTitle: entity.text,
      messages: [await toMessageIsar(entity)],
    );
  }

  static Future<SmartChatResponseEntity> toSmartChatResponse(MessageIsar message) async {
    File? imageFile;
    if (message.imageUrl!.isNotEmpty) {
      // Convert base64 string back to File
      imageFile = await base64ToFile(message.imageUrl!);
    }
    return SmartChatResponseEntity(
      text: message.text ?? '',
      isUser: message.isUser ?? false,
      senderImageUrl: message.imageUrl ?? '',
      imageFile: imageFile,
    );
  }

  static Future<ChatIsar> toChatIsarList(List<SmartChatResponseEntity> entities) async {
    List<MessageIsar> messages = [];
    for (var entity in entities) {
      messages.add(await toMessageIsar(entity));
    }
    return ChatIsar(
      chatTitle: entities.length > 2 ? entities[2].text : "Saved Chat",
      messages: messages,
    );
  }

  static Future<List<SmartChatResponseEntity>> fromChatIsar(ChatIsar chat) async {
    if (chat.messages == null) return [];
    List<SmartChatResponseEntity> responses = [];
    for (var message in chat.messages!) {
      responses.add(await toSmartChatResponse(message));
    }
    return responses;
  }

  static Future<List<SmartChatResponseEntity>> fromChatIsarList(List<ChatIsar> chats) async {
    List<SmartChatResponseEntity> responses = [];
    for (var chat in chats) {
      responses.addAll(await fromChatIsar(chat));
    }
    return responses;
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
}