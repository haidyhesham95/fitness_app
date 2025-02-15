part of 'forget_password_view_model_cubit.dart';

@immutable
sealed class ForgetPasswordViewModelState {}

/* forget password states */

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

/* verify otp states */

final class verifyOtpInitial extends ForgetPasswordViewModelState {}

final class verifyOtpLoading extends ForgetPasswordViewModelState {}

final class verifyOtpSuccess extends ForgetPasswordViewModelState {}

final class verifyOtpError extends ForgetPasswordViewModelState {
  final ErrorModel errorMessage;

  verifyOtpError(this.errorMessage);
}

/* reset password states */

final class resetPasswordInitial extends ForgetPasswordViewModelState {}

final class resetPasswordLoading extends ForgetPasswordViewModelState {}

final class resetPasswordSuccess extends ForgetPasswordViewModelState {
  final ResetPasswordResponseEntity response;

  resetPasswordSuccess(this.response);
}

final class resetPasswordError extends ForgetPasswordViewModelState {
  final ErrorModel errorMessage;

  resetPasswordError(this.errorMessage);
}
