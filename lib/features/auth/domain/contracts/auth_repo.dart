import 'package:fitness_app/features/auth/domain/entities/request/forget_password_request_entity.dart';

import '../../../../core/networking/common/api_result.dart';
import '../entities/response/forget_password_response_entity.dart';

abstract class AuthRepo{
  Future<DataResult<ForgetPasswordResponseEntity>> forgetPassword(ForgetPasswordRequestEntity request);
}