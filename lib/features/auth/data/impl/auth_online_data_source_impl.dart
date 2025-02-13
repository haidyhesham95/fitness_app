import 'package:fitness_app/core/networking/api/api_manager.dart';
import 'package:fitness_app/core/networking/api_execute.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/auth/data/contracts/auth_online_data_source.dart';
import 'package:fitness_app/features/auth/data/mappers/auth_mapper.dart';
import 'package:fitness_app/features/auth/domain/entities/request/signup_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/request/login_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/login_response_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/sign_up_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDataSourceImpl implements AuthOnlineDataSource {
  final ApiManager _apiManager;

  @factoryMethod
  AuthOnlineDataSourceImpl(this._apiManager);

  @override
  Future<DataResult<LoginResponseEntity>> login(
      LoginRequestEntity request) async {
    return await executeApi(() async {
      var response = await _apiManager.login(AuthMapper.toDto(request));
      return AuthMapper.toEntity(response);
    });
  }

  @override
  Future<DataResult<SignUpResponseEntity>> signUp(
      {required SignUpRequestEntity request}) {
    return executeApi(() async {
      var response = await _apiManager.signup(AuthMapper.signUpToDto(request));
      return AuthMapper.signUpToEntity(response);
    });
  }
}