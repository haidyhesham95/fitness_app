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
