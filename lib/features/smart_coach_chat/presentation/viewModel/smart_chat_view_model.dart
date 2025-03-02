import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/smart_coach_chat/data/mappers/offline/message_mapper.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/entities/smart_chat_response_entity.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/use_cases/fetch_smart_chat_case.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/use_cases/offline/local_storage_use_case.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/viewModel/smart_chat_action.dart';
import 'package:injectable/injectable.dart';
import 'smart_chat_state.dart';

@injectable
class SmartChatViewModel extends Cubit<SmartChatState> {
  final FetchSmartChatCase fetchSmartChatUseCase;
  final IsarUseCase _isarUseCase;

  SmartChatViewModel(this.fetchSmartChatUseCase, this._isarUseCase) : super(SmartChatInitial());
  List<SmartChatResponseEntity> chatMessages = [];


  Future<void> doAction(SmartChatAction action) async {
    switch (action) {
      case SendMessageAction():
        await _sendMessage(action.prompt, action.userImageUrl);
    }
  }

  Future<void> _sendMessage(String prompt, String userImageUrl) async {


    final responseStream = fetchSmartChatUseCase.call(prompt, userImageUrl);

    responseStream.listen((result) {
      switch (result) {
        case Success<List<SmartChatResponseEntity>>():

        // Ensure AI response isn't added twice
          for (var msg in result.data) {

            if (!chatMessages.contains(msg)) {
              chatMessages.add(msg);
              _isarUseCase.saveMessages(MessageMapper.toChatIsarList(chatMessages));
            }
          }

          emit(SmartChatSuccess(List.from(chatMessages))); // UI update
        case Fail<List<SmartChatResponseEntity>>():
          emit(SmartChatError(result.exception.toString()));
      }
    });
  }
}
