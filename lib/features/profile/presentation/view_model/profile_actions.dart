import 'package:fitness_app/features/profile/data/models/request/edit_profile_request_dto.dart';

sealed class ProfileActions {}

class EditProfile extends ProfileActions {
  EditProfileRequestDto requestDto;

  EditProfile(this.requestDto);
}

