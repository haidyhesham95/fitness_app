import '../../../../core/networking/common/api_result.dart';
import '../entities/response/profile_response_entity.dart';

abstract class ProfileRepo {
  Future<DataResult<ProfileResponseEntity>> getUserData();
}