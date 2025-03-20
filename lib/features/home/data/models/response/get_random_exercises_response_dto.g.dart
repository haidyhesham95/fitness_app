// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_random_exercises_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRandomExercisesResponseDto _$GetRandomExercisesResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetRandomExercisesResponseDto(
      json['message'] as String?,
      (json['totalExercises'] as num?)?.toInt(),
      (json['exercises'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GetRandomExercisesResponseDtoExercises.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetRandomExercisesResponseDtoToJson(
        GetRandomExercisesResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'totalExercises': instance.totalExercises,
      'exercises': instance.exercises,
    };

GetRandomExercisesResponseDtoExercises
    _$GetRandomExercisesResponseDtoExercisesFromJson(
            Map<String, dynamic> json) =>
        GetRandomExercisesResponseDtoExercises(
          json['_id'] as String?,
          json['exercise'] as String?,
          json['short_youtube_demonstration'] as String?,
          json['in_depth_youtube_explanation'] as String?,
          json['difficulty_level'] as String?,
          json['target_muscle_group'] as String?,
          json['prime_mover_muscle'] as String?,
          json['secondary_muscle'],
          json['tertiary_muscle'],
          json['primary_equipment'] as String?,
          (json['_primary_items'] as num?)?.toInt(),
          json['secondary_equipment'],
          (json['_secondary_items'] as num?)?.toInt(),
          json['posture'] as String?,
          json['single_or_double_arm'] as String?,
          json['continuous_or_alternating_arms'] as String?,
          json['grip'] as String?,
          json['load_position_ending'] as String?,
          json['continuous_or_alternating_legs'] as String?,
          json['foot_elevation'] as String?,
          json['combination_exercises'] as String?,
          json['movement_pattern_1'] as String?,
          json['movement_pattern_2'],
          json['movement_pattern_3'],
          json['plane_of_motion_1'] as String?,
          json['plane_of_motion_2'],
          json['plane_of_motion_3'],
          json['body_region'] as String?,
          json['force_type'] as String?,
          json['mechanics'] as String?,
          json['laterality'] as String?,
          json['primary_exercise_classification'] as String?,
          json['short_youtube_demonstration_link'] as String?,
          json['in_depth_youtube_explanation_link'] as String?,
        );

Map<String, dynamic> _$GetRandomExercisesResponseDtoExercisesToJson(
        GetRandomExercisesResponseDtoExercises instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'exercise': instance.exercise,
      'short_youtube_demonstration': instance.shortYoutubeDemonstration,
      'in_depth_youtube_explanation': instance.inDepthYoutubeExplanation,
      'difficulty_level': instance.difficultyLevel,
      'target_muscle_group': instance.targetMuscleGroup,
      'prime_mover_muscle': instance.primeMoverMuscle,
      'secondary_muscle': instance.secondaryMuscle,
      'tertiary_muscle': instance.tertiaryMuscle,
      'primary_equipment': instance.primaryEquipment,
      '_primary_items': instance.primaryItems,
      'secondary_equipment': instance.secondaryEquipment,
      '_secondary_items': instance.secondaryItems,
      'posture': instance.posture,
      'single_or_double_arm': instance.singleOrDoubleArm,
      'continuous_or_alternating_arms': instance.continuousOrAlternatingArms,
      'grip': instance.grip,
      'load_position_ending': instance.loadPositionEnding,
      'continuous_or_alternating_legs': instance.continuousOrAlternatingLegs,
      'foot_elevation': instance.footElevation,
      'combination_exercises': instance.combinationExercises,
      'movement_pattern_1': instance.movementPattern1,
      'movement_pattern_2': instance.movementPattern2,
      'movement_pattern_3': instance.movementPattern3,
      'plane_of_motion_1': instance.planeOfMotion1,
      'plane_of_motion_2': instance.planeOfMotion2,
      'plane_of_motion_3': instance.planeOfMotion3,
      'body_region': instance.bodyRegion,
      'force_type': instance.forceType,
      'mechanics': instance.mechanics,
      'laterality': instance.laterality,
      'primary_exercise_classification': instance.primaryExerciseClassification,
      'short_youtube_demonstration_link':
          instance.shortYoutubeDemonstrationLink,
      'in_depth_youtube_explanation_link':
          instance.inDepthYoutubeExplanationLink,
    };
