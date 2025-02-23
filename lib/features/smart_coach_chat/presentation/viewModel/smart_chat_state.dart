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
  const SmartChatSuccess(this.messages);
  @override
  List<Object?> get props => [messages];
}

class SmartChatError extends SmartChatState {
  final String error;
  const SmartChatError(this.error);
  @override
  List<Object?> get props => [error];
}
