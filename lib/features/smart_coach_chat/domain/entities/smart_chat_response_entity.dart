import 'package:equatable/equatable.dart';

class SmartChatResponseEntity extends Equatable {
  final String text;
  final bool isUser; // not bot
  final String senderImageUrl;

  const SmartChatResponseEntity({
    required this.text,
    required this.isUser,
    required this.senderImageUrl,
  });

  @override
  List<Object?> get props => [text,isUser,senderImageUrl];
}