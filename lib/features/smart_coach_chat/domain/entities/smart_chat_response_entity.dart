import 'dart:io';

import 'package:equatable/equatable.dart';

class SmartChatResponseEntity extends Equatable {
  final String text;
  final bool isUser; // not bot
  final String senderImageUrl;
  final File? imageFile;


  const SmartChatResponseEntity({
    required this.text,
    required this.isUser,
    required this.senderImageUrl,
    this.imageFile,
  });

  @override
  List<Object?> get props => [text,isUser,senderImageUrl , imageFile];
}