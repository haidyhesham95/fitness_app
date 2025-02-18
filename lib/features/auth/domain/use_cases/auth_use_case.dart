import 'package:fitness_app/features/auth/domain/entities/request/forget_password_request_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../contracts/auth_repo.dart';
import '../entities/request/reset_password_request_entity.dart';
import '../entities/request/verify_otp_request_enity.dart';
import '../entities/response/forget_password_response_entity.dart';
import '../entities/response/reset_password_response_entity.dart';

@injectable
class ForgetPasswordUseCase {
  final AuthRepo _authRepo;

  ForgetPasswordUseCase(this._authRepo);

  Future<DataResult<ForgetPasswordResponseEntity>> forgetPassword(
          ForgetPasswordRequestEntity request) async =>
      await _authRepo.forgetPassword(request);

  Future<DataResult<void>> verifyOtp(VerifyOtpRequestEntity request) async =>
      await _authRepo.verifyOtp(request);

  Future<DataResult<ResetPasswordResponseEntity>> resetPassword(
          ResetPasswordRequestEntity request) async =>
      await _authRepo.resetPassword(request);
}
