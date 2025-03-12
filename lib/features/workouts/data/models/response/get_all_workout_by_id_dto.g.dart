// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_workout_by_id_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllWorkoutsByIdDto _$GetAllWorkoutsByIdDtoFromJson(
        Map<String, dynamic> json) =>
    GetAllWorkoutsByIdDto(
      message: json['message'] as String?,
      muscleGroup: json['muscleGroup'] == null
          ? null
          : MuscleGroup.fromJson(json['muscleGroup'] as Map<String, dynamic>),
      muscles: (json['muscles'] as List<dynamic>?)
          ?.map((e) => Muscles.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllWorkoutsByIdDtoToJson(
        GetAllWorkoutsByIdDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'muscleGroup': instance.muscleGroup,
      'muscles': instance.muscles,
    };

MuscleGroup _$MuscleGroupFromJson(Map<String, dynamic> json) => MuscleGroup(
      Id: json['_id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$MuscleGroupToJson(MuscleGroup instance) =>
    <String, dynamic>{
      '_id': instance.Id,
      'name': instance.name,
    };

Muscles _$MusclesFromJson(Map<String, dynamic> json) => Muscles(
      Id: json['_id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$MusclesToJson(Muscles instance) => <String, dynamic>{
      '_id': instance.Id,
      'name': instance.name,
      'image': instance.image,
    };
