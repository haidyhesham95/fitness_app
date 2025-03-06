part of 'profile_view_model_cubit.dart';

@immutable
sealed class ProfileViewModelState {}

 class ProfileViewModelInitial extends ProfileViewModelState {}

 class getProfileLoading extends ProfileViewModelState {}

 class getProfileSuccess extends ProfileViewModelState {
  final ProfileResponseEntity data;

  getProfileSuccess({required this.data});
}

 class getProfileError extends ProfileViewModelState {
  final ErrorModel errorMessage;

  getProfileError({required this.errorMessage});
}

 class EditProfileViewModelInitial extends ProfileViewModelState {}

 class EditProfileLoading extends ProfileViewModelState {}

 class EditProfileSuccess extends ProfileViewModelState {
  final EditProfileResponseEntity data;

  EditProfileSuccess({required this.data});

}

 class EditProfileError extends ProfileViewModelState {
  final ErrorModel error;

  EditProfileError({required this.error});

}
 class UploadPhotoLoading extends ProfileViewModelState {}

 class UploadPhotoError extends ProfileViewModelState {
  final ErrorModel error;

  UploadPhotoError({required this.error});

}
 class UploadPhotoSuccess extends ProfileViewModelState {
  final UploadPhotoResponseEntity data;
  UploadPhotoSuccess({required this.data});
}
