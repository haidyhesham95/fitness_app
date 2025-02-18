// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordResponseDto _$ResetPasswordResponseDtoFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordResponseDto(
      json['message'] as String?,
      json['token'] as String?,
    );

Map<String, dynamic> _$ResetPasswordResponseDtoToJson(
        ResetPasswordResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
    };
