import '../../../../../../core/networking/common/api_result.dart';
import '../../../../domain/entities/response/profile_response_entity.dart';

abstract class ProfileOnlineDataSource {
  Future<DataResult<ProfileResponseEntity>> getUserData();
}