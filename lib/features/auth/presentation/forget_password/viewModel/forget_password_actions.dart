import 'package:fitness_app/features/auth/domain/entities/request/forget_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/request/verify_otp_request_enity.dart';

import '../../../domain/entities/request/reset_password_request_entity.dart';

sealed class ForgetPasswordActions {}

class ForgetPasswordSubmit extends ForgetPasswordActions {
  final ForgetPasswordRequestEntity request;

  ForgetPasswordSubmit(this.request);
}

class VerifyOtpSubmit extends ForgetPasswordActions {
  final VerifyOtpRequestEntity request;

  VerifyOtpSubmit(this.request);
}

class ResetPasswordSubmit extends ForgetPasswordActions {
  final ResetPasswordRequestEntity request;

  ResetPasswordSubmit(this.request);
}
