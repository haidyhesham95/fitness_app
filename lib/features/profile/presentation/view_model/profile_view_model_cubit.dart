import 'package:bloc/bloc.dart';
import 'package:fitness_app/features/profile/domain/entities/response/profile_response_entity.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_action.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../../../../core/networking/error/error_handler.dart';
import '../../../../core/networking/error/error_model.dart';
import '../../domain/use_cases/profile_use_cases.dart';

part 'profile_view_model_state.dart';

@injectable
class ProfileViewModelCubit extends Cubit<ProfileViewModelState> {
  ProfileViewModelCubit(this._useCases) : super(ProfileViewModelInitial());
  final ProfileUseCases _useCases;

  void doAction(ProfileAction action) {
    switch (action) {
      case GetUserData():
        _getUserData();
        break;
    }
  }

  Future<void> _getUserData() async {
    emit(getProfileLoading());
    final result = await _useCases.getUserData();
    switch (result) {
      case Success<ProfileResponseEntity>():
        emit(getProfileSuccess(data: result.data));
      case Fail<ProfileResponseEntity>():
        emit(getProfileError(
            errorMessage: ErrorHandler.handle(result.exception!)));
    }
  }
}

import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/core/networking/error/error_handler.dart';
import 'package:fitness_app/features/auth/data/data_sources/contracts/offline_data_sources/auth_offline_data_source.dart';
import 'package:fitness_app/features/profile/data/models/request/edit_profile_request_dto.dart';
import 'package:fitness_app/features/profile/domain/entities/response/edit_profile_response_entity.dart';
import 'package:fitness_app/features/profile/domain/use_cases/profile_use_case.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_actions.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_view_model_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


@injectable
class ProfileViewModelCubit extends Cubit<ProfileViewModelState> {
  final ProfileUseCase _useCase;
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

  ProfileViewModelCubit(this._useCase,this._offlineDataSource)
      : super(ProfileViewModelInitial());

  void doAction(ProfileActions action) {
    switch (action) {
      case EditProfile():
        _editProfile(action.requestDto);
    }
  }

  Future<void> _editProfile(EditProfileRequestDto request) async {
    emit(EditProfileLoading());
    final result = await _useCase.editProfile(request);
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