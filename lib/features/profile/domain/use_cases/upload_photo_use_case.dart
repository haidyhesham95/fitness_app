import 'dart:io';

import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/profile/domain/entities/response/upload_photo_response_entity.dart';
import 'package:fitness_app/features/profile/domain/repositories/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
 class UploadPhotoUseCase{
  final ProfileRepo _repository;
   UploadPhotoUseCase(this._repository);

  Future<DataResult<UploadPhotoResponseEntity>> uploadPhoto(File photo) =>
      _repository.uploadPhoto(photo);
 }