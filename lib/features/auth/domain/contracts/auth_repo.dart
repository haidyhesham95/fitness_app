import '../../../../core/networking/common/api_result.dart';
import '../entities/response/forget_password_response_entity.dart';

abstract class AuthRepo{
  Future<DataResult<ForgetPasswordResponseEntity>> forgetPassword(String email);
}