// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_random_muscles_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRandomMusclesResponseDto _$GetRandomMusclesResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetRandomMusclesResponseDto(
      json['message'] as String?,
      (json['totalMuscles'] as num?)?.toInt(),
      (json['muscles'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GetRandomMusclesResponseDtoMuscles.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetRandomMusclesResponseDtoToJson(
        GetRandomMusclesResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'totalMuscles': instance.totalMuscles,
      'muscles': instance.muscles,
    };

GetRandomMusclesResponseDtoMuscles _$GetRandomMusclesResponseDtoMusclesFromJson(
        Map<String, dynamic> json) =>
    GetRandomMusclesResponseDtoMuscles(
      json['_id'] as String?,
      json['name'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$GetRandomMusclesResponseDtoMusclesToJson(
        GetRandomMusclesResponseDtoMuscles instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
