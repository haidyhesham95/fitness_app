part of 'profile_view_model_cubit.dart';

@immutable
sealed class ProfileViewModelState {}

final class ProfileViewModelInitial extends ProfileViewModelState {}

final class getProfileLoading extends ProfileViewModelState {}

final class getProfileSuccess extends ProfileViewModelState {
  final ProfileResponseEntity data;

  getProfileSuccess({required this.data});
}

final class getProfileError extends ProfileViewModelState {
  final ErrorModel errorMessage;

  getProfileError({required this.errorMessage});
}
import 'package:fitness_app/core/networking/error/error_model.dart';
import 'package:fitness_app/features/profile/domain/entities/response/edit_profile_response_entity.dart';

sealed class ProfileViewModelState {}

 class ProfileViewModelInitial extends ProfileViewModelState {}

 class EditProfileLoading extends ProfileViewModelState {}

 class EditProfileSuccess extends ProfileViewModelState {
  final EditProfileResponseEntity data;

  EditProfileSuccess({required this.data});

}

 class EditProfileError extends ProfileViewModelState {
  final ErrorModel error;

  EditProfileError({required this.error});

}

