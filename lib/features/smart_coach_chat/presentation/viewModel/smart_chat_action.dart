import 'dart:io';

sealed class SmartChatAction {}

class SendMessageAction extends SmartChatAction {
  final String prompt;
  final String userImageUrl;
  final File? image;


  SendMessageAction(this.prompt, this.userImageUrl , this.image);
}
