import 'package:fitness_app/features/auth/domain/entities/request/forget_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/forget_password_response_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/reset_password_response_entity.dart';

import '../../../../../../core/networking/common/api_result.dart';
import '../../../../domain/entities/request/reset_password_request_entity.dart';
import '../../../../domain/entities/request/verify_otp_request_enity.dart';

abstract class AuthOnlineDataSource {
  Future<DataResult<ForgetPasswordResponseEntity>> forgetPassword(
      ForgetPasswordRequestEntity request);

  Future<DataResult<void>> verifyOtp(VerifyOtpRequestEntity request);

  Future<DataResult<ResetPasswordResponseEntity>> resetPassword(
      ResetPasswordRequestEntity request);
}
