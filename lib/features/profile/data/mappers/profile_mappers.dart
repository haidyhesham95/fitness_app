import 'package:fitness_app/features/profile/data/models/response/edit_profile_response_dto.dart';
import 'package:fitness_app/features/profile/domain/entities/response/edit_profile_response_entity.dart';

class ProfileMapper {
  static EditProfileResponseEntity editProfileResponseToEntity(
      EditProfileResponseDto dto) {
    return EditProfileResponseEntity(
      user: editProfileToUserEntity(dto.user!),
    );
  }

  static UserEntity editProfileToUserEntity(User userEntity) {
    return UserEntity(
      firstName: userEntity.firstName,
      lastName: userEntity.lastName,
      email: userEntity.email,
      age: userEntity.age,
      weight: userEntity.weight,
      height: userEntity.height,
      gender: userEntity.gender,
      activityLevel: userEntity.activityLevel,
      goal: userEntity.goal,
      photo: userEntity.photo,
      id: userEntity.Id,
      createdAt: userEntity.createdAt,
      passwordChangedAt: userEntity.passwordChangedAt,
      passwordResetCode: userEntity.passwordResetCode,
      passwordResetExpires: userEntity.passwordResetExpires,
      resetCodeVerified: userEntity.resetCodeVerified,
    );
  }
}
