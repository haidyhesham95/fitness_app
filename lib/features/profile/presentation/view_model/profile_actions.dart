import 'package:fitness_app/features/profile/data/models/request/edit_profile_request_dto.dart';

sealed class ProfileActions {}
class GetUserData extends ProfileActions {}


class EditProfile extends ProfileActions {
  final Map<String, dynamic> profileData;

  EditProfile(this.profileData);
}

