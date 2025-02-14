import 'package:fitness_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/auth/domain/entities/request/login_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/login_response_entity.dart';

@injectable
class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<DataResult<LoginResponseEntity>> login(
      LoginRequestEntity request) async {
    return await _authRepository.login(request);
  }
}
