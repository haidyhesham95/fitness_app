import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/profile/data/models/request/edit_profile_request_dto.dart';
import 'package:fitness_app/features/profile/domain/entities/response/edit_profile_response_entity.dart';

abstract class ProfileRepo {

  Future<DataResult<EditProfileResponseEntity>> editProfile(
      EditProfileRequestDto request);
}
