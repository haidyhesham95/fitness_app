import 'package:fitness_app/core/networking/api/api_manager.dart';
import 'package:fitness_app/core/networking/api_execute.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/auth/data/mapper/auth_mapper.dart';
import 'package:fitness_app/features/auth/domain/entities/request/forget_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/forget_password_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../models/request/forget_password_request_dto.dart';
import '../contracts/online_data_sources/auth_online_data_source.dart';

@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDataSourceImpl implements AuthOnlineDataSource {

  final ApiManager _apiManager;

  @factoryMethod
  AuthOnlineDataSourceImpl(this._apiManager);

  @override
  Future<DataResult<ForgetPasswordResponseEntity>> forgetPassword(ForgetPasswordRequestEntity request) {
    return executeApi(()async {
      final response = await _apiManager.forgetPassword(AuthMapper.toForgetPasswordRequestDto(request));
      return AuthMapper.toForgetPasswordResponseEntity(response);
    });
  }
}