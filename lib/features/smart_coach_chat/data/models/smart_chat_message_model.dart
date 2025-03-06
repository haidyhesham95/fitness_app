abstract class SmartChatModelResponse {
  final bool isUser;
  final String senderImageUrl;
  SmartChatModelResponse(this.isUser , this.senderImageUrl);

  Map<String, dynamic> toJson();
}
