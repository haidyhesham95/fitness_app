sealed class SmartChatAction {}

class SendMessageAction extends SmartChatAction {
  final String prompt;
  final String userImageUrl;

  SendMessageAction(this.prompt, this.userImageUrl);
}

class SaveMessagesAction extends SmartChatAction {}

class GetTitlesAction extends SmartChatAction {}
