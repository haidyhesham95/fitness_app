import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/networking/error/error_model.dart';
import 'package:fitness_app/features/auth/data/data_sources/contracts/offline_data_sources/auth_offline_data_source.dart';
import 'package:fitness_app/features/profile/domain/entities/response/edit_profile_response_entity.dart';
import 'package:fitness_app/features/profile/domain/entities/response/profile_response_entity.dart';
import 'package:fitness_app/features/profile/domain/use_cases/edit_profile_use_case.dart';
import 'package:fitness_app/features/profile/domain/use_cases/profile_use_case.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_actions.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/networking/common/api_result.dart';
import '../../../../core/networking/error/error_handler.dart';
part 'profile_view_model_state.dart';


@injectable
class ProfileViewModelCubit extends Cubit<ProfileViewModelState> {
  ProfileViewModelCubit(this._profileUseCase, this._offlineDataSource, this._editProfileUseCase) : super(ProfileViewModelInitial());

  final ProfileUseCase _profileUseCase;
  final EditProfileUseCase _editProfileUseCase;
  final AuthOfflineDataSource _offlineDataSource;
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  String firstName = '';
  String lastName = '';
  String email = '';
  String weight = '';
  String activityLevel = '';
  String goal = '';
  bool isModified = false;


  void doAction(ProfileActions action) {
    switch (action) {
      case GetUserData():
        _getUserData();
        break;
      case EditProfile():
        _editProfile(action.profileData);
    }
  }

  Future<void> _getUserData() async {
    emit(getProfileLoading());
    final result = await _profileUseCase.getUserData();
    switch (result) {
      case Success<ProfileResponseEntity>():
        emit(getProfileSuccess(data: result.data));
      case Fail<ProfileResponseEntity>():
        emit(getProfileError(
            errorMessage: ErrorHandler.handle(result.exception!)));
    }
  }


  Future<void> _editProfile(Map<String, dynamic> profileData) async {
    emit(EditProfileLoading());
    final result = await _editProfileUseCase.editProfile(profileData);
    switch (result) {
      case Success<EditProfileResponseEntity>():
        await _offlineDataSource.cacheToken(result.data.token ?? "");
        debugPrint("${_offlineDataSource.getToken()}");
        emit(EditProfileSuccess(data: result.data));
      case Fail<EditProfileResponseEntity>():
        emit(EditProfileError(error: ErrorHandler.handle(result.exception!)));
    }
  }

}