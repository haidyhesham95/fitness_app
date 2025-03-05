import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/profile/domain/entities/response/edit_profile_response_entity.dart';
import 'package:fitness_app/features/profile/domain/repositories/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfileUseCase {
  final ProfileRepo _repository;

  EditProfileUseCase(this._repository);


  Future<DataResult<EditProfileResponseEntity>> editProfile(
      Map<String, dynamic> profileData) =>
      _repository.editProfile(profileData);
}