import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class SmartChatResponseEntity extends Equatable {
  final bool isUser;
  final String imageUrl;

  const SmartChatResponseEntity({
    required this.isUser,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [isUser, imageUrl];
}

class TextMessage extends SmartChatResponseEntity {
  final String text;

  TextMessage({
    required super.isUser,
    required super.imageUrl,
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
    required super.imageUrl,
    required this.imageFile,
     this.text,

  });

  @override
  List<Object?> get props => super.props..addAll([imageFile.path, text]);
}


