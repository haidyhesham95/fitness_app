import 'dart:convert';
import 'dart:io';

import 'package:fitness_app/features/smart_coach_chat/data/models/offline/message_hive.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/entities/smart_chat_response_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class MessageMapper {
  static Future<MessageHive> toMessageHive(
      SmartChatResponseEntity entity) async {
    if (entity is TextMessage) {
      return MessageHive(text: entity.text, isUser: entity.isUser);
    } else if (entity is ImageMessage) {
      String imageUrl = await fileToBase64(entity.imageFile);
      return MessageHive(imageUrl: imageUrl, isUser: entity.isUser);
    }
    throw Exception("Unknown message type");
  }

  /// Convert a [MessageHive] to a [SmartChatResponseEntity]
  static Future<SmartChatResponseEntity> toSmartChatResponse(
      MessageHive message) async {
    if (message.imageUrl != null && message.imageUrl!.isNotEmpty) {
      File imageFile = await base64ToFile(message.imageUrl!);
      return ImageMessage(
        isUser: message.isUser ?? false,
        senderImageUrl: message.imageUrl ?? '',
        imageFile: imageFile,
        text: message.text ?? '',
      );
    } else {
      return TextMessage(
        isUser: message.isUser ?? false,
        senderImageUrl: message.imageUrl ?? '',
        text: message.text ?? '',
      );
    }
  }

  /// Convert a list of [SmartChatResponseEntity] to a [ChatHive] object.
  static Future<ChatHive> toChatHive(
      List<SmartChatResponseEntity> entities) async {
    List<MessageHive> messages = [];
    for (var entity in entities) {
      messages.add(await toMessageHive(entity));
    }
    return ChatHive(
      chatId: DateTime.now().millisecondsSinceEpoch.toString(),
      chatTitle: entities.isNotEmpty
          ? entities.first is TextMessage
              ? (entities.first as TextMessage).text
              : "Saved Chat"
          : "Saved Chat",
      messages: messages,
    );
  }

  static Future<ChatHive> toChatHiveList(
      List<SmartChatResponseEntity> entities) async {
    List<MessageHive> messages = [];
    for (var entity in entities) {
      messages.add(await toMessageHive(entity));
    }

    String chatTitle = "Saved Chat";
    for (var entity in entities) {
      if (entity is TextMessage) {
        chatTitle = entity.text;
        break;
      }
    }

    return ChatHive(
      chatId: DateTime.now().millisecondsSinceEpoch.toString(),
      chatTitle: chatTitle,
      messages: messages,
    );
  }

  /// Convert a [ChatHive] object to a list of [SmartChatResponseEntity].
  static Future<List<SmartChatResponseEntity>> fromChatHive(
      ChatHive chat) async {
    if (chat.messages == null || chat.messages!.isEmpty) return [];
    List<SmartChatResponseEntity> responses = [];
    for (var message in chat.messages!) {
      responses.add(await toSmartChatResponse(message));
    }
    return responses;
  }

  /// Convert a list of [ChatHive] objects to a list of [SmartChatResponseEntity].
  static Future<List<SmartChatResponseEntity>> fromChatHiveList(
      List<ChatHive> chats) async {
    List<SmartChatResponseEntity> responses = [];
    for (var chat in chats) {
      responses.addAll(await fromChatHive(chat));
    }
    return responses;
  }

  static Future<String> fileToBase64(File file) async {
    try {
      List<int> fileBytes = await file.readAsBytes();
      return base64Encode(fileBytes);
    } catch (e) {
      debugPrint(" Error converting file to base64: $e");
      return '';
    }
  }

  static Future<File> base64ToFile(String base64String) async {
    try {
      List<int> bytes = base64Decode(base64String);
      Directory tempDir = await getTemporaryDirectory();
      File file =
          File('${tempDir.path}/file_${DateTime.now().millisecondsSinceEpoch}');
      await file.writeAsBytes(bytes);
      return file;
    } catch (e) {
      debugPrint(" Error converting base64 to file: $e");
      return File('');
    }
  }
}
