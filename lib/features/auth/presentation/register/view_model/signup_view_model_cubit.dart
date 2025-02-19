import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/core/networking/error/error_handler.dart';
import 'package:fitness_app/core/networking/error/error_model.dart';
import 'package:fitness_app/features/auth/domain/entities/request/signup_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/sign_up_response_entity.dart';
import 'package:fitness_app/features/auth/domain/use_cases/signup_use_case.dart';
import 'package:fitness_app/features/auth/presentation/register/view_model/signup_action.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/enum/enum_gender.dart';

part 'signup_view_model_state.dart';

@injectable
class SignUpViewModel extends Cubit<SignUpViewModelState> {
  SignUpViewModel(this._signupUseCase) : super(SignupInitial());
  final SignUpUseCase _signupUseCase;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  String goal = "";
  String activity = "";
  int SelectedHeight = 170;
  int SelectedWeight = 65;
  int SelectedAge = 25;
  Gender? SelectedGender = null;

  Future<void> doAction(SignupAction action) async {
    switch (action) {
      case SignupActionSelected():
        _signUpButtonPressed();
      case SelectActivityAction():
        _setActivity(action.activity);
        break;
      case SelectGoalAction():
        _setGoal(action.goal);
        break;
      case SelectHeightAction():
        _setHeight(action.height);
        break;
      case SelectAgeAction():
        _setAge(action.age);
        break;
      case SelectWeightAction():
        _setWeight(action.weight);
        break;
      case SelectGenderAction():
        _setGender(action.gender);
        break;
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

  void _signUpButtonPressed() {
    if (signUpFormKey.currentState!.validate() &&
        getGoal.isNotEmpty &&
        getActivity.isNotEmpty
        && SelectedGender != null) {
      _signUp(SignUpRequestEntity(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          password: passwordController.text,
          gender: SelectedGender.toString().split('.').last,
          age: SelectedAge,
          height: SelectedHeight,
          weight: SelectedWeight,
          goal: getGoal,
          activityLevel: getActivity));
    }
  }

  void _setActivity(String activity) {
    this.activity = activity;
    emit(ActivityUpdateState());
  }

  Future<void> _setGoal(String goal) async {
    this.goal = goal;
    emit(GoalUpdateState());
  }

  String get getGoal => goal;

  String get getActivity => activity;

  void _setHeight(int height) {
    SelectedHeight = height;
    emit(HeightUpdateState());
  }

  void _setWeight(int weight) {
    SelectedWeight = weight;
    emit(WeightUpdateState());
  }

  void _setAge(int age) {
    SelectedAge = age;
    emit(AgeUpdateState());
  }

  void _setGender(Gender gender) {
    SelectedGender = gender;
    emit(GenderUpdateState());
  }
}
