import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/core/networking/error/error_handler.dart';
import 'package:fitness_app/core/networking/error/error_model.dart';
import 'package:fitness_app/features/auth/domain/entities/request/signup_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/sign_up_response_entity.dart';
import 'package:fitness_app/features/auth/domain/use_case/signup_use_case.dart';
import 'package:fitness_app/features/auth/presentation/register/view_model/signup_action.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
part 'signup_view_model_state.dart';
@injectable
class SignUpViewModel extends Cubit<SignUpViewModelState> {
  SignUpViewModel(this._signupUseCase) : super(SignupInitial());
  final AuthUseCase _signupUseCase;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  void doAction(SignupAction action) {
    // print("Password before action: ${passwordController.text}");
    switch (action) {
    case SignupActionSelected():
        signUpButtonPressed();
    }
  }
  void _signUp(SignUpRequestEntity request) async {
    emit(SignupLoading());
    var result = await _signupUseCase.signUp(request);
    switch (result) {
      case Success<SignUpResponseEntity>():
        emit(SignupSuccess(result.data));
        break;
      case Fail<SignUpResponseEntity>():
        final message = ErrorHandler.handle(result.exception!);
        emit(SignupError(message));
        break;
    }
  }
  void signUpButtonPressed() {
    if (signUpFormKey.currentState!.validate()) {
      _signUp(SignUpRequestEntity(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: passwordController.text,
      ));
      // print('Password After Sign Up : ${passwordController.text}');
    }
  }

}
