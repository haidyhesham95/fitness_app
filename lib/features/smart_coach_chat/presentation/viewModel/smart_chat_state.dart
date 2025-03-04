import 'package:equatable/equatable.dart';
import '../../domain/entities/smart_chat_response_entity.dart';

sealed class SmartChatState extends Equatable {
  const SmartChatState();
  @override
  List<Object?> get props => [];
}

class SmartChatInitial extends SmartChatState {}

class SmartChatLoading extends SmartChatState {}

class SmartChatSuccess extends SmartChatState {
  final List<SmartChatResponseEntity> messages;
  final List<String> chatIds;
  final List<String> titles;

  const SmartChatSuccess(this.messages,
      {this.chatIds = const [], this.titles = const []});

  @override
  List<Object?> get props => [messages, chatIds, titles];
}

class SmartChatError extends SmartChatState {
  final String error;
  const SmartChatError(this.error);
  @override
  List<Object?> get props => [error];
}

class SmartChatTitlesLoaded extends SmartChatState {
  final List<String> titles;

  SmartChatTitlesLoaded(this.titles);
}
