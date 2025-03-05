import 'package:fitness_app/features/smart_coach_chat/data/models/smart_chat_message_model.dart';

class TextMessageModel extends SmartChatModelResponse {
  final String text;

  TextMessageModel({
    required this.text,
    required String senderImageUrl,
    required bool isUser,
  }) : super(isUser , senderImageUrl);

  factory TextMessageModel.fromJson(Map<String, dynamic> json) {
    return TextMessageModel(
      text: json['text'] ?? '',
      senderImageUrl: json['senderImageUrl'] ?? '',
      isUser: json['isUser'] ?? false,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'senderImageUrl': senderImageUrl,
      'isUser': isUser,
    };
  }
}
