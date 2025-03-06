import 'dart:io';

import 'package:isar/isar.dart';

sealed class SmartChatAction {}

class SendMessageAction extends SmartChatAction {
  final String prompt;
  final String userImageUrl;
  final File? image;


  SendMessageAction(this.prompt, this.userImageUrl , this.image);
}

class SaveMessagesAction extends SmartChatAction {}

class GetTitlesAction extends SmartChatAction {}

class GetChatAction extends SmartChatAction {
  final Id chatId;

  GetChatAction(this.chatId);
}
