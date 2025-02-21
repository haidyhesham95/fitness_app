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

