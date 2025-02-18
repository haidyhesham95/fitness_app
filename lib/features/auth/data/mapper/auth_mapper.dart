import 'package:fitness_app/features/auth/data/models/request/forget_password_request_dto.dart';
import 'package:fitness_app/features/auth/data/models/request/reset_password_request_dto.dart';
import 'package:fitness_app/features/auth/data/models/request/verify_otp_request_dto.dart';
import 'package:fitness_app/features/auth/domain/entities/request/forget_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/request/reset_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/request/verify_otp_request_enity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/forget_password_response_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/reset_password_response_entity.dart';

import '../../domain/entities/request/login_request_entity.dart';
import '../../domain/entities/request/signup_request_entity.dart';
import '../../domain/entities/response/login_response_entity.dart';
import '../../domain/entities/response/sign_up_response_entity.dart';
import '../models/request/login_request_dto.dart';
import '../models/request/signup_request_dto.dart';
import '../models/response/forget_response_dto.dart';
import '../models/response/login_response_dto.dart';
import '../models/response/reset_password_response_dto.dart';
import '../models/response/signup_response_dto.dart';

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

  static SignUpRequestDto signUpToDto(SignUpRequestEntity request) {
    return SignUpRequestDto(
      firstName: request.firstName,
      lastName: request.lastName,
      email: request.email,
      gender: request.gender,
      age: request.age,
      weight: request.weight,
      height: request.height,
      password: request.password,
      rePassword: request.rePassword,
      activityLevel: request.activityLevel,
      goal: request.goal,
    );
  }

  static SignUpResponseEntity signUpToEntity(SignUpResponseDto response) {
    return SignUpResponseEntity(
      message: response.message,
      token: response.token,
      user: mapUserFromDtoToEntity(response.user),
    );
  }

  static SignUpUser mapUserFromDtoToEntity(UserDto? userDto) {
    if (userDto == null) return const SignUpUser();
    return SignUpUser(
      firstName: userDto.firstName,
      lastName: userDto.lastName,
      email: userDto.email,
      gender: userDto.gender,
      age: userDto.age,
      weight: userDto.weight,
      height: userDto.height,
      activityLevel: userDto.activityLevel,
      goal: userDto.goal,
      photo: userDto.photo,
      id: userDto.Id,
      createdAt: userDto.createdAt,
    );
  }

  static LoginRequestDto toDto(LoginRequestEntity request) {
    return LoginRequestDto(email: request.email, password: request.password);
  }

  static LoginResponseEntity toEntity(LoginResponseDto response) {
    return LoginResponseEntity(
        message: response.message, token: response.token);
  }
}
