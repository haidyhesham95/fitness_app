import 'package:fitness_app/features/home/data/models/response/get_all_difficult_levels_response_dto.dart';

import '../../domain/entities/response/get_all_difficult_levels_response_entity.dart';
import '../../domain/entities/response/get_random_exercises_response_entity.dart';
import '../../domain/entities/response/get_random_muscles_response_entity.dart';
import '../models/response/get_random_exercises_response_dto.dart';
import '../models/response/get_random_muscles_response_dto.dart';

class HomeMapper {
  static GetRandomMusclesResponseEntity mapRandomMusclesToEntity(
      GetRandomMusclesResponseDto dto) {
    return GetRandomMusclesResponseEntity(
      dto.muscles
          ?.map((muscle) => muscle == null
              ? null
              : GetRandomMusclesResponseEntityMuscles(
                  muscle.id, muscle.name, muscle.image))
          .toList(),
    );
  }


  static GetRandomExercisesResponseEntity mapRandomExercisesToEntity(
      GetRandomExercisesResponseDto dto) {
    return GetRandomExercisesResponseEntity(
      dto.message,
      dto.totalExercises,
      dto.exercises?.map((exercise) {
        if (exercise == null) return null;
        return GetRandomExercisesResponseEntityExercises(
          exercise.id,
          exercise.exercise,
          exercise.shortYoutubeDemonstration,
          exercise.inDepthYoutubeExplanation,
          exercise.difficultyLevel,
          exercise.targetMuscleGroup,
          exercise.primeMoverMuscle,
          exercise.secondaryMuscle,
          exercise.tertiaryMuscle,
          exercise.primaryEquipment,
          exercise.primaryItems,
          exercise.secondaryEquipment,
          exercise.secondaryItems,
          exercise.posture,
          exercise.singleOrDoubleArm,
          exercise.continuousOrAlternatingArms,
          exercise.grip,
          exercise.loadPositionEnding,
          exercise.continuousOrAlternatingLegs,
          exercise.footElevation,
          exercise.combinationExercises,
          exercise.movementPattern1,
          exercise.movementPattern2,
          exercise.movementPattern3,
          exercise.planeOfMotion1,
          exercise.planeOfMotion2,
          exercise.planeOfMotion3,
          exercise.bodyRegion,
          exercise.forceType,
          exercise.mechanics,
          exercise.laterality,
          exercise.primaryExerciseClassification,
          exercise.shortYoutubeDemonstrationLink,
          exercise.inDepthYoutubeExplanationLink,
        );
      }).toList(),
    );
  }

  static GetAllDifficultLevelsResponseEntity mapAllDifficultLevelsToEntity(
      GetAllDifficultLevelsResponseDto dto) {
    return GetAllDifficultLevelsResponseEntity(
      dto.levels
          ?.map((level) => level == null
              ? null
              : GetAllDifficultLevelsResponseEntityLevels(level.id, level.name))
          .toList(),
    );
  }
}
