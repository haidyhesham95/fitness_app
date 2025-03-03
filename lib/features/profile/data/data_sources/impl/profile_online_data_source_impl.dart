import 'dart:io';

import 'package:fitness_app/core/networking/api/api_manager.dart';
import 'package:fitness_app/core/networking/api_execute.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/profile/data/data_sources/contracts/online_data_sources/profile_online_data_source.dart';
import 'package:fitness_app/features/profile/data/mappers/profile_mappers.dart';
import 'package:fitness_app/features/profile/domain/entities/response/edit_profile_response_entity.dart';
import 'package:fitness_app/features/profile/domain/entities/response/profile_response_entity.dart';
import 'package:fitness_app/features/profile/domain/entities/response/upload_photo_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileOnlineDataSource)
class ProfileOnlineDataSourceImpl implements ProfileOnlineDataSource {
  final ApiManager _apiManager;
  ProfileOnlineDataSourceImpl(this._apiManager);
  @override
  Future<DataResult<EditProfileResponseEntity>> editProfile(
      Map<String, dynamic> profileData) {
    return executeApi(() async {
      var response = await _apiManager.editProfile(profileData);
      return ProfileMapper.editProfileResponseToEntity(response);
    });
  }
  @override
  Future<DataResult<ProfileResponseEntity>> getUserData() {
    return executeApi(() async {
      final response = await _apiManager.getLoggedUserData();
      return ProfileMapper.toEntity(response);
    });
  }


  @override
  Future<DataResult<UploadPhotoResponseEntity>> uploadPhoto(File photo) {
    return executeApi(() async {
      var response = await _apiManager.uploadPhoto(photo);
      return ProfileMapper.uploadPhotoResponseToEntity(response);
    });
  }

}
