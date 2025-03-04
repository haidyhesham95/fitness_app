import '../../domain/entities/response/profile_response_entity.dart';
import '../models/response/profile_response_model.dart';

class ProfileMapper {

  static ProfileResponseEntity toEntity(ProfileResponseDto response) {
    return ProfileResponseEntity(
        message: response.message,
        user: mapUserFromDtoToEntity(response.user!),);
  }

  static ProfileUserEntity mapUserFromDtoToEntity(ProfileUserDto userDto) {
    return ProfileUserEntity(
      firstName: userDto.firstName,
      lastName: userDto.lastName,
      email: userDto.email,
      gender: userDto.gender,
      age: userDto.age,
      weight: userDto.weight,
      height: userDto.height,
      activityLevel: userDto.activityLevel,
      goal: userDto.goal,
      photo: userDto.photo,
    );
  }
}