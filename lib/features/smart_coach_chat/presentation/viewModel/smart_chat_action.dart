sealed class SmartChatAction {}

class SendMessageAction extends SmartChatAction {
  final String prompt;
  final String userImageUrl;

  SendMessageAction(this.prompt, this.userImageUrl);
}
