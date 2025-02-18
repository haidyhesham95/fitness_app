import 'package:fitness_app/features/auth/domain/contracts/auth_repo.dart';
import 'package:fitness_app/features/auth/domain/entities/request/signup_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/sign_up_response_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';

@injectable
class SignUpUseCase {
  final AuthRepo _authRepo;

  SignUpUseCase(this._authRepo);

  Future<DataResult<SignUpResponseEntity>> signUp(
      SignUpRequestEntity request) async {
    return await _authRepo.signUp(request: request);
  }
}
