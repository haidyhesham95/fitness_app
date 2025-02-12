import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/auth/data/data_sources/contracts/online_data_sources/auth_online_data_source.dart';
import 'package:fitness_app/features/auth/domain/contracts/auth_repo.dart';
import 'package:fitness_app/features/auth/domain/entities/response/forget_password_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo{

  final AuthOnlineDataSource _onlineDataSource;

  @factoryMethod
  AuthRepoImpl(this._onlineDataSource);
  @override
  Future<DataResult<ForgetPasswordResponseEntity>> forgetPassword(String email) async{
    return await _onlineDataSource.forgetPassword(email);
  }
}