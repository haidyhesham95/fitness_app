import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/core/networking/error/error_handler.dart';
import 'package:fitness_app/core/networking/error/error_model.dart';
import 'package:fitness_app/features/auth/domain/entities/request/forget_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/use_cases/auth_use_case.dart';
import 'package:fitness_app/features/auth/presentation/forget_password/viewModel/forget_password_actions.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/response/forget_password_response_entity.dart';

part 'forget_password_view_model_state.dart';

@injectable
class ForgetPasswordViewModelCubit extends Cubit<ForgetPasswordViewModelState> {

  final AuthUseCase _useCase;

  @factoryMethod
  ForgetPasswordViewModelCubit(this._useCase) : super(ForgetPasswordViewModelInitial());

  void doAction(ForgetPasswordActions action) {
    switch (action) {
      case ForgetPasswordSubmit():
        _forgetPassword(action.request);
        break;
    }
  }

  Future<void> _forgetPassword(ForgetPasswordRequestEntity request) async {
    emit(ForgetPasswordViewModelLoading());
    final result = await _useCase.forgetPassword(request);
    switch (result) {
      case Success<ForgetPasswordResponseEntity>():
        emit(ForgetPasswordViewModelSuccess(result.data));
        break;
      case Fail<ForgetPasswordResponseEntity>():
        emit(ForgetPasswordViewModelError(ErrorHandler.handle(result.exception!)));
        break;
    }
  }
}
