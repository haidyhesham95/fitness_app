import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class SmartChatResponseEntity extends Equatable {
  final bool isUser;
  final String senderImageUrl;

  const SmartChatResponseEntity({
    required this.isUser,
    required this.senderImageUrl,
  });

  @override
  List<Object?> get props => [isUser, senderImageUrl];
}

class TextMessage extends SmartChatResponseEntity {
  final String text;

  TextMessage({
    required super.isUser,
    required super.senderImageUrl,
    required this.text,
  });

  @override
  List<Object?> get props => super.props..add(text);
}

class ImageMessage extends SmartChatResponseEntity {
  final File imageFile;
  final String? text;

  ImageMessage({
    required super.isUser,
    required super.senderImageUrl,
    required this.imageFile,
     this.text,

  });

  @override
  List<Object?> get props => super.props..addAll([imageFile.path, text]);
}


