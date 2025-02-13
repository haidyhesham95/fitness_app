import 'package:fitness_app/features/auth/data/models/request/login_request_dto.dart';
import 'package:fitness_app/features/auth/data/models/request/signup_request_dto.dart';
import 'package:fitness_app/features/auth/data/models/response/login_response_dto.dart';
import 'package:fitness_app/features/auth/data/models/response/signup_response_dto.dart';
import 'package:fitness_app/features/auth/domain/entities/request/signup_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/request/login_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/login_response_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/sign_up_response_entity.dart';
class AuthMapper{
  static SignUpRequestDto signUpToDto(SignUpRequestEntity request){
    return SignUpRequestDto(
      firstName: request.firstName,
      lastName: request.lastName,
      email: request.email,
      gender: request.gender,
      age: request.age,
      weight: request.weight,
      height: request.height,
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

  // static SignUpRequestDto signUpToDto(SignUpRequestEntity request){
  //   return SignUpRequestDto(
  //     firstName: request.firstName,
  //     lastName: request.lastName,
  //     email: request.email,
  //     gender: request.gender,
  //     age: request.age,
  //     weight: request.weight,
  //     height: request.height,
  //     activityLevel: request.activityLevel,
  //     goal: request.goal,
  //   );
  // }
  // static SignUpResponseEntity signUpToEntity(SignUpResponseDto response) {
  //   return SignUpResponseEntity(
  //     message: response.message,
  //     token: response.token,
  //     user: mapUserFromDtoToEntity(response.user),
  //   );
  // }
  // static User mapUserFromDtoToEntity(UserDto? userDto) {
  //   if (userDto == null) return const User();
  //     return User(
  //       firstName: userDto.firstName,
  //       lastName: userDto.lastName,
  //       email: userDto.email,
  //       gender: userDto.gender,
  //       age: userDto.age,
  //       weight: userDto.weight,
  //       height: userDto.height,
  //       activityLevel: userDto.activityLevel,
  //       goal: userDto.goal,
  //       photo: userDto.photo,
  //       id: userDto.Id,
  //       createdAt: userDto.createdAt,
  //     );
  //   }
  static LoginRequestDto toDto(LoginRequestEntity request) {
    return LoginRequestDto(email: request.email, password: request.password);
  }

  static LoginResponseEntity toEntity(LoginResponseDto response) {
    return LoginResponseEntity(
        message: response.message, token: response.token);
  }


}
