import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/core/networking/error/error_handler.dart';
import 'package:fitness_app/core/networking/error/error_model.dart';
import 'package:fitness_app/features/auth/domain/entities/request/login_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/login_response_entity.dart';
import 'package:fitness_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/networking/common/register_context_module.dart';
import '../../../data/data_sources/contracts/offline_data_sources/auth_offline_data_source.dart';
import 'login_action.dart';

part 'login_view_model_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginViewModelState> {
  final LoginUseCase _loginUseCase;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final AuthOfflineDataSource _offlineDataSource = getIt<AuthOfflineDataSource>();


  LoginViewModel(this._loginUseCase) : super(LoginViewModelInitial());

  void doAction(LoginScreenAction action) {
    switch (action) {
      case LoginAction():
        _login(action);
    }
  }

  Future<void> _login(LoginAction action) async {
    emit(LoginViewModelLoading());

    final result = await _loginUseCase.login(action.request);

    switch (result) {
      case Success<LoginResponseEntity>():
        await _offlineDataSource.cacheToken(result.data.token ?? "");

        if (!isClosed) {
          emit(LoginViewModelSuccess(result.data));
        }

      case Fail<LoginResponseEntity>():
        if (!isClosed) {
          emit(LoginViewModelError(ErrorHandler.handle(result.exception!)));
        }
    }
  }

  Future<void> signInButtonPressed(BuildContext context) async {
    if (signInFormKey.currentState!.validate()) {
      final loginAction = LoginAction(LoginRequestEntity(
        email: emailController.text.trim(),
        password: passwordController.text,
      ));

      await _login(loginAction); // ← استنى النتيجة الأول

      // if (!isClosed && state is LoginViewModelSuccess) {
      //   Navigator.of(context).pushReplacementNamed(AppRoutes.profileView);
      // }
    }
  }
}
