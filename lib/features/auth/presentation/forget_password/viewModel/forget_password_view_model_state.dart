part of 'forget_password_view_model_cubit.dart';

@immutable
sealed class ForgetPasswordViewModelState {}

final class ForgetPasswordViewModelInitial extends ForgetPasswordViewModelState {}

final class ForgetPasswordViewModelLoading extends ForgetPasswordViewModelState {}

final class ForgetPasswordViewModelSuccess extends ForgetPasswordViewModelState {
  final ForgetPasswordResponseEntity response;
  ForgetPasswordViewModelSuccess(this.response);
}

final class ForgetPasswordViewModelError extends ForgetPasswordViewModelState {
  final ErrorModel errorMessage;
  ForgetPasswordViewModelError(this.errorMessage);
}
