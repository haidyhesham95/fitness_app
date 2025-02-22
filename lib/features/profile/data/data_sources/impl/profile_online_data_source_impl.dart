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
import 'package:fitness_app/core/networking/api/api_manager.dart';
import 'package:fitness_app/core/networking/api_execute.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/profile/data/data_sources/contracts/profile_online_data_source.dart';
import 'package:fitness_app/features/profile/data/mappers/profile_mappers.dart';
import 'package:fitness_app/features/profile/data/models/request/edit_profile_request_dto.dart';
import 'package:fitness_app/features/profile/domain/entities/response/edit_profile_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileOnlineDataSource)
class ProfileOnlineDataSourceImpl implements ProfileOnlineDataSource {
  final ApiManager _apiManager;
  ProfileOnlineDataSourceImpl(this._apiManager);
  @override
  Future<DataResult<EditProfileResponseEntity>> editProfile(
      EditProfileRequestDto request) {
    return executeApi(() async {
      var response = await _apiManager.editProfile(request);
      return ProfileMapper.editProfileResponseToEntity(response);
    });
  }

}
