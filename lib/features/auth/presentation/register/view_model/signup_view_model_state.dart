part of 'signup_view_model_cubit.dart';

@immutable
sealed class SignUpViewModelState {}

final class SignupInitial extends SignUpViewModelState {}

final class SignupLoading extends SignUpViewModelState {}

final class SignupSuccess extends SignUpViewModelState {
  final SignUpResponseEntity response;

  SignupSuccess(this.response);
}

class SignupError extends SignUpViewModelState {
  final ErrorModel message;

  SignupError(this.message);
}

final class GoalUpdateState extends SignUpViewModelState {}

final class ActivityUpdateState extends SignUpViewModelState {}
final class HeightUpdateState extends SignUpViewModelState {}
final class WeightUpdateState extends SignUpViewModelState {}
final class AgeUpdateState extends SignUpViewModelState {}
final class GenderUpdateState extends SignUpViewModelState {
  final String gender;

  GenderUpdateState(this.gender);
}
final class StepUpdatedState extends SignUpViewModelState {

  final SignUpStep step;
  StepUpdatedState( this.step);
}
final class BackPressed extends SignUpViewModelState {

  final SignUpStep currentStep;
  BackPressed( this.currentStep);
}

