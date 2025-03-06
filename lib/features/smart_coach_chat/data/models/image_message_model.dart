import 'dart:io';

import 'smart_chat_message_model.dart';

class ImageMessageModel extends SmartChatModelResponse {
  final File? imageFile;
  final String? text;

  ImageMessageModel({
    required String senderImageUrl,
    required this.imageFile,
     this.text,
    required bool isUser,
  }) : super(isUser, senderImageUrl);

  factory ImageMessageModel.fromJson(Map<String, dynamic> json) {
    return ImageMessageModel(
      senderImageUrl: json['senderImageUrl'] ?? '',
      imageFile: json['imageFile'] != null ? File(json['imageFile']) : null,
      isUser: json['isUser'] ?? false,
      text: json['text'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'senderImageUrl': senderImageUrl,
      'isUser': isUser,
      'imageFile': imageFile?.path,
      'text': text,
    };
  }
}
