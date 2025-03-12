// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workouts_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutsResponseDto _$WorkoutsResponseDtoFromJson(Map<String, dynamic> json) =>
    WorkoutsResponseDto(
      message: json['message'] as String?,
      musclesGroup: (json['musclesGroup'] as List<dynamic>?)
          ?.map((e) => MusclesGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkoutsResponseDtoToJson(
        WorkoutsResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'musclesGroup': instance.musclesGroup,
    };

MusclesGroup _$MusclesGroupFromJson(Map<String, dynamic> json) => MusclesGroup(
      Id: json['_id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$MusclesGroupToJson(MusclesGroup instance) =>
    <String, dynamic>{
      '_id': instance.Id,
      'name': instance.name,
    };
