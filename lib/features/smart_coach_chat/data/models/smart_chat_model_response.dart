import 'dart:convert';

class SmartChatModelResponse {
  final String text;
  final bool isUser;
  final String senderImageUrl;

  SmartChatModelResponse({
    required this.text,
    required this.isUser,
    required this.senderImageUrl,
  });

  factory SmartChatModelResponse.fromJson(Map<String, dynamic> json) {
    return SmartChatModelResponse(
      text: json['text'] ?? '',
      isUser: json['isUser'] ?? false,
      senderImageUrl: json['senderImageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'isUser': isUser,
      'senderImageUrl': senderImageUrl,
    };
  }

  static List<SmartChatModelResponse> fromJsonList(String str) {
    final List<dynamic> jsonData = json.decode(str);
    return jsonData.map((item) => SmartChatModelResponse.fromJson(item)).toList();
  }
}
