import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/core/services/hive_debug_helper.dart';
import 'package:fitness_app/features/smart_coach_chat/data/mappers/offline/message_mapper.dart';
import 'package:fitness_app/features/smart_coach_chat/data/models/offline/message_hive.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/entities/smart_chat_response_entity.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/use_cases/fetch_smart_chat_case.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/use_cases/offline/local_storage_use_case.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/viewModel/smart_chat_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'smart_chat_state.dart';

@injectable
class SmartChatViewModel extends Cubit<SmartChatState> {
  final FetchSmartChatCase fetchSmartChatUseCase;
  final HiveUseCase _hiveUseCase;
  List<String> titles = [];
  List<String> chatIds = [];
  bool hasNewMessages = false;
  String? currentChatId;

  SmartChatViewModel(this.fetchSmartChatUseCase, this._hiveUseCase)
      : super(SmartChatInitial());
  List<SmartChatResponseEntity> chatMessages = [];

  Future<void> doAction(SmartChatAction action) async {
    switch (action) {
      case SendMessageAction():
        hasNewMessages = true;
        await _sendMessage(action.prompt, action.imageProfile, action.imageFile);
        break;
      case SaveMessagesAction():
        if (hasNewMessages) {
          _saveMessages();
          hasNewMessages = false;
        }
        break;
      case GetChatAction():
        hasNewMessages = false;
        _getMessagesById(action.chatId);
        break;
      case GetTitlesAction():
        _getTitlesWithId();
        break;
    }
  }

  Future<void> _sendMessage(
      String prompt, String userImageUrl, File? imageFile) async {
    final responseStream =
        fetchSmartChatUseCase.call(prompt, userImageUrl, imageFile);
    responseStream.listen((result) {
      switch (result) {
        case Success<List<SmartChatResponseEntity>>():
          for (var msg in result.data) {
            if (!chatMessages.contains(msg)) {
              chatMessages.add(msg);
            }
          }
          emit(SmartChatSuccess(List.from(chatMessages)));

          // Auto-save messages after successful response
          _saveMessages();
        case Fail<List<SmartChatResponseEntity>>():
          emit(SmartChatError(result.exception.toString()));
      }
    });
  }

  void _saveMessages() async {
    if (chatMessages.isNotEmpty) {
      if (currentChatId != null) {
        await _hiveUseCase.deleteMessagesById(currentChatId!);
      }
      await _hiveUseCase
          .saveMessages([await MessageMapper.toChatHiveList(chatMessages)]);

      // Debug: Print Hive contents after save
      debugPrint('\n📦 Messages saved! Checking Hive contents...');
      await HiveDebugHelper.printAllChats();
    }
  }

  Future<void> _getTitlesWithId() async {
    debugPrint('\n📋 Loading chat titles from Hive...');
    await HiveDebugHelper.printAllChats();

    List<ChatHive> savedChats = await _hiveUseCase.getMessages();
    titles = savedChats.map((chat) => chat.chatTitle).toList();
    chatIds = savedChats.map((chat) => chat.chatId).toList();
    emit(SmartChatTitlesLoaded(List.from(titles), chatIds));
  }

  Future<void> _getMessagesById(String chatId) async {
    final messages = await _hiveUseCase.getMessagesById(chatId);
    chatMessages = await MessageMapper.fromChatHiveList(messages);
    emit(SmartChatSuccess(List.from(chatMessages)));
  }

// compare currentChatId with chatId from list of saved chats
// if exist --> create new list and add old list in new list then clear
// save new and old messages
}
