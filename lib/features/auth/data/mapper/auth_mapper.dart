import 'package:fitness_app/features/auth/domain/entities/response/forget_password_response_entity.dart';

import '../models/response/forget_response_dto.dart';

class AuthMapper{
  static ForgetPasswordResponseEntity toForgetPasswordResponseEntity(ForgetPasswordResponseDto dto){
    return ForgetPasswordResponseEntity(
      message: dto.message,
      info: dto.info,
    );
  }
}