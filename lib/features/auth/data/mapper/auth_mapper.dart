import 'package:fitness_app/features/auth/data/models/request/forget_password_request_dto.dart';
import 'package:fitness_app/features/auth/data/models/request/reset_password_request_dto.dart';
import 'package:fitness_app/features/auth/data/models/request/verify_otp_request_dto.dart';
import 'package:fitness_app/features/auth/domain/entities/request/forget_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/request/reset_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/request/verify_otp_request_enity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/forget_password_response_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/reset_password_response_entity.dart';

import '../models/response/forget_response_dto.dart';
import '../models/response/reset_password_response_dto.dart';

class AuthMapper{
  static ForgetPasswordResponseEntity toForgetPasswordResponseEntity(ForgetPasswordResponseDto dto){
    return ForgetPasswordResponseEntity(
      message: dto.message,
      info: dto.info,
    );
  }

  static ForgetPasswordRequestDto toForgetPasswordRequestDto(ForgetPasswordRequestEntity entity){
    return ForgetPasswordRequestDto(
      entity.email,
    );
  }

  static VerifyOtpRequestDto mapToVerifyOtpRequestDto(
      VerifyOtpRequestEntity entity) {
    return VerifyOtpRequestDto(entity.resetCode);
  }

  static ResetPasswordRequestDto mapToResetPasswordRequestDto(
      ResetPasswordRequestEntity entity) {
    return ResetPasswordRequestDto(entity.email, entity.newPassword);
  }

  static ResetPasswordResponseEntity mapToResetPasswordResponseEntity(
      ResetPasswordResponseDto dto) {
    return ResetPasswordResponseEntity(message: dto.message, token: dto.token);
  }
}
