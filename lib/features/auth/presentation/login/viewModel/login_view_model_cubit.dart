import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/core/networking/error/error_handler.dart';
import 'package:fitness_app/core/networking/error/error_model.dart';
import 'package:fitness_app/features/auth/domain/entities/request/login_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/login_response_entity.dart';
import 'package:fitness_app/features/auth/domain/use_case/login_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'login_action.dart';
part 'login_view_model_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginViewModelState> {
  final LoginUseCase _loginUseCase;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  LoginViewModel(this._loginUseCase) : super(LoginViewModelInitial());

  void doAction(LoginScreenAction action) {
    switch (action) {
      case LoginAction():
        _login(action);
    }
  }

  Future<void> _login(LoginAction action) async {
    emit(LoginViewModelLoading());
    var result = await _loginUseCase.login(action.request);
    switch (result) {
      case Success<LoginResponseEntity>():
        emit(LoginViewModelSuccess(result.data));
      case Fail<LoginResponseEntity>():
        emit(LoginViewModelError(ErrorHandler.handle(result.exception!)));
    }
  }

  void signInButtonPressed() {
    if (signInFormKey.currentState!.validate()) {
      _login(LoginAction(LoginRequestEntity(
        email: emailController.text,
        password: passwordController.text,
      )));
    }
  }
}
