import 'dart:io';

import 'package:fitness_app/features/profile/domain/entities/response/edit_profile_response_entity.dart';
import 'package:fitness_app/features/profile/domain/entities/response/upload_photo_response_entity.dart';
import '../../../../../../core/networking/common/api_result.dart';
import '../../../../domain/entities/response/profile_response_entity.dart';

abstract class ProfileOnlineDataSource {
  Future<DataResult<EditProfileResponseEntity>> editProfile(
      Map<String, dynamic> profileData);

  Future<DataResult<ProfileResponseEntity>> getUserData();
  Future<DataResult<UploadPhotoResponseEntity>> uploadPhoto(File photo);

}