import 'dart:io';

sealed class ProfileActions {}
class GetUserData extends ProfileActions {}


class EditProfile extends ProfileActions {
  final Map<String, dynamic> profileData;

  EditProfile(this.profileData);
}

class UploadPhoto extends ProfileActions {
  final File photo;
  UploadPhoto(this.photo);
}
class updateWeight extends ProfileActions {
  final int weight;
  updateWeight(this.weight);
}


