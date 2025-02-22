import 'package:fitness_app/features/profile/data/mapper/profile_mapper.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/networking/api/api_manager.dart';
import '../../../../../core/networking/api_execute.dart';
import '../../../../../core/networking/common/api_result.dart';
import '../../../domain/entities/response/profile_response_entity.dart';
import '../contracts/online_data_sources/profile_online_data_source.dart';

@Injectable(as: ProfileOnlineDataSource)
class ProfileOnlineDataSourceImpl implements ProfileOnlineDataSource {
  final ApiManager _apiManager;

  ProfileOnlineDataSourceImpl(this._apiManager);

  @override
  Future<DataResult<ProfileResponseEntity>> getUserData() {
    return executeApi(() async {
      final response = await _apiManager.getLoggedUserData();
      return ProfileMapper.toEntity(response);
    });
  }
}
