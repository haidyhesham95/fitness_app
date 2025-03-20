import 'package:json_annotation/json_annotation.dart';

part 'get_random_exercises_response_dto.g.dart';

@JsonSerializable()
class GetRandomExercisesResponseDto {
  final String? message;
  final int? totalExercises;
  final List<GetRandomExercisesResponseDtoExercises?>? exercises;

  GetRandomExercisesResponseDto(
      this.message, this.totalExercises, this.exercises);

  factory GetRandomExercisesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GetRandomExercisesResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetRandomExercisesResponseDtoToJson(this);
}

@JsonSerializable()
class GetRandomExercisesResponseDtoExercises {
  @JsonKey(name: '_id')
  final String? id;
  final String? exercise;
  @JsonKey(name: 'short_youtube_demonstration')
  final String? shortYoutubeDemonstration;
  @JsonKey(name: 'in_depth_youtube_explanation')
  final String? inDepthYoutubeExplanation;
  @JsonKey(name: 'difficulty_level')
  final String? difficultyLevel;
  @JsonKey(name: 'target_muscle_group')
  final String? targetMuscleGroup;
  @JsonKey(name: 'prime_mover_muscle')
  final String? primeMoverMuscle;
  @JsonKey(name: 'secondary_muscle')
  final dynamic secondaryMuscle;
  @JsonKey(name: 'tertiary_muscle')
  final dynamic tertiaryMuscle;
  @JsonKey(name: 'primary_equipment')
  final String? primaryEquipment;
  @JsonKey(name: '_primary_items')
  final int? primaryItems;
  @JsonKey(name: 'secondary_equipment')
  final dynamic secondaryEquipment;
  @JsonKey(name: '_secondary_items')
  final int? secondaryItems;
  final String? posture;
  @JsonKey(name: 'single_or_double_arm')
  final String? singleOrDoubleArm;
  @JsonKey(name: 'continuous_or_alternating_arms')
  final String? continuousOrAlternatingArms;
  final String? grip;
  @JsonKey(name: 'load_position_ending')
  final String? loadPositionEnding;
  @JsonKey(name: 'continuous_or_alternating_legs')
  final String? continuousOrAlternatingLegs;
  @JsonKey(name: 'foot_elevation')
  final String? footElevation;
  @JsonKey(name: 'combination_exercises')
  final String? combinationExercises;
  @JsonKey(name: 'movement_pattern_1')
  final String? movementPattern1;
  @JsonKey(name: 'movement_pattern_2')
  final dynamic movementPattern2;
  @JsonKey(name: 'movement_pattern_3')
  final dynamic movementPattern3;
  @JsonKey(name: 'plane_of_motion_1')
  final String? planeOfMotion1;
  @JsonKey(name: 'plane_of_motion_2')
  final dynamic planeOfMotion2;
  @JsonKey(name: 'plane_of_motion_3')
  final dynamic planeOfMotion3;
  @JsonKey(name: 'body_region')
  final String? bodyRegion;
  @JsonKey(name: 'force_type')
  final String? forceType;
  final String? mechanics;
  final String? laterality;
  @JsonKey(name: 'primary_exercise_classification')
  final String? primaryExerciseClassification;
  @JsonKey(name: 'short_youtube_demonstration_link')
  final String? shortYoutubeDemonstrationLink;
  @JsonKey(name: 'in_depth_youtube_explanation_link')
  final String? inDepthYoutubeExplanationLink;

  GetRandomExercisesResponseDtoExercises(
      this.id,
      this.exercise,
      this.shortYoutubeDemonstration,
      this.inDepthYoutubeExplanation,
      this.difficultyLevel,
      this.targetMuscleGroup,
      this.primeMoverMuscle,
      this.secondaryMuscle,
      this.tertiaryMuscle,
      this.primaryEquipment,
      this.primaryItems,
      this.secondaryEquipment,
      this.secondaryItems,
      this.posture,
      this.singleOrDoubleArm,
      this.continuousOrAlternatingArms,
      this.grip,
      this.loadPositionEnding,
      this.continuousOrAlternatingLegs,
      this.footElevation,
      this.combinationExercises,
      this.movementPattern1,
      this.movementPattern2,
      this.movementPattern3,
      this.planeOfMotion1,
      this.planeOfMotion2,
      this.planeOfMotion3,
      this.bodyRegion,
      this.forceType,
      this.mechanics,
      this.laterality,
      this.primaryExerciseClassification,
      this.shortYoutubeDemonstrationLink,
      this.inDepthYoutubeExplanationLink);

  factory GetRandomExercisesResponseDtoExercises.fromJson(
          Map<String, dynamic> json) =>
      _$GetRandomExercisesResponseDtoExercisesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetRandomExercisesResponseDtoExercisesToJson(this);
}
