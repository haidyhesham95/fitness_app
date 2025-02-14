import 'package:fitness_app/features/auth/domain/entities/request/forget_password_request_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../contracts/auth_repo.dart';
import '../entities/response/forget_password_response_entity.dart';

@injectable
class AuthUseCase {
  final AuthRepo _authRepo;

  @factoryMethod
  AuthUseCase(this._authRepo);

  Future<DataResult<ForgetPasswordResponseEntity>> forgetPassword(ForgetPasswordRequestEntity request) async => await _authRepo.forgetPassword(request);
}