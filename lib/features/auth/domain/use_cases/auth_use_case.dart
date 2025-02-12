import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../contracts/auth_repo.dart';
import '../entities/response/forget_password_response_entity.dart';

@injectable
class AuthUseCase {
  final AuthRepo _authRepo;

  @factoryMethod
  AuthUseCase(this._authRepo);

  Future<DataResult<ForgetPasswordResponseEntity>> forgetPassword(String email) async => await _authRepo.forgetPassword(email);
}