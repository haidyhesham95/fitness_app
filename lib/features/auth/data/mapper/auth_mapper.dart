import 'package:fitness_app/features/auth/data/models/request/forget_password_request_dto.dart';
import 'package:fitness_app/features/auth/domain/entities/request/forget_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/forget_password_response_entity.dart';

import '../models/response/forget_response_dto.dart';

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
}