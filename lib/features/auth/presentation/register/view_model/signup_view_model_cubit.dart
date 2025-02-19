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
  int selectedHeight = 170;
  int selectedWeight = 65;
  int selectedAge = 25;
  String selectedGender = '';

  Future<void> doAction(SignupAction action) async {
    switch (action) {
      case SignupActionSelected():
        _signUpButtonPressed();
        break;
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
    _signUp(SignUpRequestEntity(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      rePassword: passwordController.text.trim(),
      gender: selectedGender,
      age: selectedAge,
      height: selectedHeight,
      weight: selectedWeight,
      goal: goal,
      activityLevel: activity,
    ));
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

  void _setGender(String gender) {
    selectedGender = gender;
    emit(GenderUpdateState(selectedGender));
  }


  void _setHeight(int height) {
    if (selectedHeight != height) {
      selectedHeight = height;
      emit(HeightUpdateState());
    }
  }

  void _setWeight(int weight) {
    if (selectedWeight != weight) {
      selectedWeight = weight;
      emit(WeightUpdateState());
    }
  }

  void _setAge(int age) {
    if (selectedAge != age) {
      selectedAge = age;
      emit(AgeUpdateState());
    }
  }

}
