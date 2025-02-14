import 'package:fitness_app/features/auth/domain/entities/request/forget_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/forget_password_response_entity.dart';

import '../../../../../../core/networking/common/api_result.dart';

abstract class AuthOnlineDataSource {
  Future<DataResult<ForgetPasswordResponseEntity>> forgetPassword(ForgetPasswordRequestEntity request);
}