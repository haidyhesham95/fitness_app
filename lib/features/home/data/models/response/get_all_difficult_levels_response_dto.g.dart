// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_difficult_levels_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllDifficultLevelsResponseDto _$GetAllDifficultLevelsResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetAllDifficultLevelsResponseDto(
      json['message'] as String?,
      (json['levels'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GetAllDifficultLevelsResponseDtoLevels.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllDifficultLevelsResponseDtoToJson(
        GetAllDifficultLevelsResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'levels': instance.levels,
    };

GetAllDifficultLevelsResponseDtoLevels
    _$GetAllDifficultLevelsResponseDtoLevelsFromJson(
            Map<String, dynamic> json) =>
        GetAllDifficultLevelsResponseDtoLevels(
          json['_id'] as String?,
          json['name'] as String?,
        );

Map<String, dynamic> _$GetAllDifficultLevelsResponseDtoLevelsToJson(
        GetAllDifficultLevelsResponseDtoLevels instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
    };
