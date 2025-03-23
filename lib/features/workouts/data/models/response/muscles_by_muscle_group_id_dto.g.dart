// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muscles_by_muscle_group_id_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusclesByMuscleGroupIdResponseDto _$MusclesByMuscleGroupIdResponseDtoFromJson(
        Map<String, dynamic> json) =>
    MusclesByMuscleGroupIdResponseDto(
      json['message'] as String?,
      (json['totalMuscles'] as num?)?.toInt(),
      (json['muscles'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MusclesByMuscleGroupIdMusclesDto.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );

// ignore: unused_element
Map<String, dynamic> _$MusclesByMuscleGroupIdResponseDtoToJson(
        MusclesByMuscleGroupIdResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'totalMuscles': instance.totalMuscles,
      'muscles': instance.muscles,
    };

MusclesByMuscleGroupIdMusclesDto _$MusclesByMuscleGroupIdMusclesDtoFromJson(
        Map<String, dynamic> json) =>
    MusclesByMuscleGroupIdMusclesDto(
      json['_id'] as String?,
      json['name'] as String?,
      json['image'] as String?,
    );

// ignore: unused_element
Map<String, dynamic> _$MusclesByMuscleGroupIdMusclesDtoToJson(
        MusclesByMuscleGroupIdMusclesDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
