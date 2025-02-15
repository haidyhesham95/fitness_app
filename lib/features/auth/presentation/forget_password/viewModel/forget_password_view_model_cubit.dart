import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/core/networking/error/error_handler.dart';
import 'package:fitness_app/core/networking/error/error_model.dart';
import 'package:fitness_app/features/auth/data/data_sources/contracts/offline_data_sources/auth_offline_data_source.dart';
import 'package:fitness_app/features/auth/domain/entities/request/forget_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/use_cases/auth_use_case.dart';
import 'package:fitness_app/features/auth/presentation/forget_password/viewModel/forget_password_actions.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/networking/common/regester_context_module.dart';
import '../../../domain/entities/request/reset_password_request_entity.dart';
import '../../../domain/entities/request/verify_otp_request_enity.dart';
import '../../../domain/entities/response/forget_password_response_entity.dart';
import '../../../domain/entities/response/reset_password_response_entity.dart';

part 'forget_password_view_model_state.dart';

@injectable
class ForgetPasswordViewModelCubit extends Cubit<ForgetPasswordViewModelState> {
  final AuthUseCase _useCase;
  final AuthOfflineDataSource _offlineDataSource =
      getIt<AuthOfflineDataSource>();

  @factoryMethod
  ForgetPasswordViewModelCubit(this._useCase)
      : super(ForgetPasswordViewModelInitial());

  void doAction(ForgetPasswordActions action) {
    switch (action) {
      case ForgetPasswordSubmit():
        _forgetPassword(action.request);
        break;
      case VerifyOtpSubmit():
        _verifyOtp(action.request);
        break;
      case ResetPasswordSubmit():
        _resetPassword(action.request);
        break;
    }
  }

  Future<void> _forgetPassword(ForgetPasswordRequestEntity request) async {
    emit(ForgetPasswordViewModelLoading());
    final result = await _useCase.forgetPassword(request);
    switch (result) {
      case Success<ForgetPasswordResponseEntity>():
        emit(ForgetPasswordViewModelSuccess(result.data));
        break;
      case Fail<ForgetPasswordResponseEntity>():
        emit(ForgetPasswordViewModelError(
            ErrorHandler.handle(result.exception!)));
        break;
    }
  }

  Future<void> _verifyOtp(VerifyOtpRequestEntity request) async {
    emit(verifyOtpLoading());
    final result = await _useCase.verifyOtp(request);
    switch (result) {
      case Success<void>():
        emit(verifyOtpSuccess());
        break;
      case Fail<void>():
        emit(verifyOtpError(ErrorHandler.handle(result.exception!)));
        break;
    }
  }

  Future<void> _resetPassword(ResetPasswordRequestEntity request) async {
    emit(resetPasswordLoading());
    final result = await _useCase.resetPassword(request);
    switch (result) {
      case Success<ResetPasswordResponseEntity>():
        emit(resetPasswordSuccess(result.data));
        await _offlineDataSource.cacheToken(result.data.token!);
        break;
      case Fail<ResetPasswordResponseEntity>():
        emit(resetPasswordError(ErrorHandler.handle(result.exception!)));
        break;
    }
  }
}
