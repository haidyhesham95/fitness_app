import 'package:fitness_app/features/auth/domain/entities/request/forget_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/request/verify_otp_request_enity.dart';

sealed class ForgetPasswordActions {}

class ForgetPasswordSubmit extends ForgetPasswordActions {
  final ForgetPasswordRequestEntity request;

  ForgetPasswordSubmit(this.request);
}

class VerifyOtpSubmit extends ForgetPasswordActions {
  final VerifyOtpRequestEntity request;

  VerifyOtpSubmit(this.request);
}