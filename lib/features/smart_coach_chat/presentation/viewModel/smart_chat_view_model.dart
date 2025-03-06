import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/smart_coach_chat/data/mappers/offline/message_mapper.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/entities/smart_chat_response_entity.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/use_cases/fetch_smart_chat_case.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/use_cases/offline/local_storage_use_case.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/viewModel/smart_chat_action.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'smart_chat_state.dart';

@injectable
class SmartChatViewModel extends Cubit<SmartChatState> {
  final FetchSmartChatCase fetchSmartChatUseCase;
  final IsarUseCase _isarUseCase;
  List<String> titles = [];
  List<Id> chatIds = [];

  SmartChatViewModel(this.fetchSmartChatUseCase, this._isarUseCase) : super(SmartChatInitial());
  List<SmartChatResponseEntity> chatMessages = [];


  Future<void> doAction(SmartChatAction action) async {
    switch (action) {
      case SendMessageAction():
        await _sendMessage(action.prompt, action.userImageUrl, action.image );
        break;
      case SaveMessagesAction():
        _saveMessages();
        break;
      case GetTitlesAction():
        _getTitlesWithId();
        break;
      case GetChatAction():
        _getMessagesById(action.chatId);
        break;
    }
  }
  Future<void> _sendMessage(String prompt, String userImageUrl,File? imageFile) async {
    final responseStream = fetchSmartChatUseCase.call(prompt, userImageUrl, imageFile);
    responseStream.listen((result) {
      switch (result) {
        case Success<List<SmartChatResponseEntity>>():
          for (var msg in result.data) {
            if (!chatMessages.contains(msg)) {
              chatMessages.add(msg);
            }
          }
          emit(SmartChatSuccess(List.from(chatMessages)));
        case Fail<List<SmartChatResponseEntity>>():
          emit(SmartChatError(result.exception.toString()));
      }
    });
  }

  void _saveMessages()async {
    if (chatMessages.isNotEmpty) {
      _isarUseCase.saveMessages([await MessageMapper.toChatIsarList(chatMessages)]);
    }
  }

  Future<void> _getTitlesWithId() async {
    final savedChats = await _isarUseCase.getMessages();
    titles = savedChats.map((chat) => chat.chatTitle).toList();
    chatIds = savedChats.map((chat) => chat.id).toList();
    emit(SmartChatTitlesLoaded(List.from(titles), chatIds));
  }

  Future<void> _getMessagesById(Id chatId) async {
    final messages = await _isarUseCase.getMessagesById(chatId);
    chatMessages = await MessageMapper.fromChatIsarList(messages);
    emit(SmartChatSuccess(List.from(chatMessages)));
  }
}
