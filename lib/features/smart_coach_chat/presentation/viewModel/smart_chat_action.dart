import 'dart:io';

import 'package:isar/isar.dart';

sealed class SmartChatAction {}

class SendMessageAction extends SmartChatAction {
  final String prompt;
  final String imageProfile;
  final File? imageFile;

  SendMessageAction(this.prompt, this.imageProfile, this.imageFile);
}

class SaveMessagesAction extends SmartChatAction {}

class GetTitlesAction extends SmartChatAction {}

class GetChatAction extends SmartChatAction {
  final Id chatId;

  GetChatAction(this.chatId);
}
