import 'package:fitness_app/features/exercises/data/model/exercises_response_dto.dart';

import '../domain/entities/exercises_entity.dart';

class ExerciseMapper {
  static ExercisesEntity toEntity(ExercisesResponseDto dto) {
    return ExercisesEntity(
      message: dto.message,
      totalExercises: dto.totalExercises,
      totalPages: dto.totalPages,
      currentPage: dto.currentPage,
      exercises: dto.exercises?.map((e) => toExercise(e)).toList(),
    );
  }

  static ExercisesResponseDto toDto(ExercisesEntity entity) {
    return ExercisesResponseDto(
      message: entity.message,
      totalExercises: entity.totalExercises,
      totalPages: entity.totalPages,
      currentPage: entity.currentPage,
      exercises: entity.exercises?.map((e) => toExerciseDto(e)).toList(),
    );
  }

  static Exercises toExercise(ExercisesDto dto) {
    return Exercises(
      id: dto.Id,
      exercise: dto.exercise,
      shortYoutubeDemonstration: dto.shortYoutubeDemonstration,
      inDepthYoutubeExplanation: dto.inDepthYoutubeExplanation,
      difficultyLevel: dto.difficultyLevel,
      targetMuscleGroup: dto.targetMuscleGroup,
      primeMoverMuscle: dto.primeMoverMuscle,
      secondaryMuscle: dto.secondaryMuscle,
      tertiaryMuscle: dto.tertiaryMuscle,
      primaryEquipment: dto.primaryEquipment,
      primaryItems: dto.PrimaryItems,
      secondaryEquipment: dto.secondaryEquipment,
      secondaryItems: dto.SecondaryItems,
      posture: dto.posture,
      singleOrDoubleArm: dto.singleOrDoubleArm,
      continuousOrAlternatingArms: dto.continuousOrAlternatingArms,
      grip: dto.grip,
      loadPositionEnding: dto.loadPositionEnding,
      continuousOrAlternatingLegs: dto.continuousOrAlternatingLegs,
      footElevation: dto.footElevation,
      combinationExercises: dto.combinationExercises,
      movementPattern1: dto.movementPattern1,
      movementPattern2: dto.movementPattern2,
      movementPattern3: dto.movementPattern3,
      planeOfMotion1: dto.planeOfMotion1,
      planeOfMotion2: dto.planeOfMotion2,
      planeOfMotion3: dto.planeOfMotion3,
      bodyRegion: dto.bodyRegion,
      forceType: dto.forceType,
      mechanics: dto.mechanics,
      laterality: dto.laterality,
      primaryExerciseClassification: dto.primaryExerciseClassification,
      shortYoutubeDemonstrationLink: dto.shortYoutubeDemonstrationLink,
      inDepthYoutubeExplanationLink: dto.inDepthYoutubeExplanationLink,
    );
  }

  static ExercisesDto toExerciseDto(Exercises entity) {
    return ExercisesDto(
      Id: entity.id,
      exercise: entity.exercise,
      shortYoutubeDemonstration: entity.shortYoutubeDemonstration,
      inDepthYoutubeExplanation: entity.inDepthYoutubeExplanation,
      difficultyLevel: entity.difficultyLevel,
      targetMuscleGroup: entity.targetMuscleGroup,
      primeMoverMuscle: entity.primeMoverMuscle,
      secondaryMuscle: entity.secondaryMuscle,
      tertiaryMuscle: entity.tertiaryMuscle,
      primaryEquipment: entity.primaryEquipment,
      PrimaryItems: entity.primaryItems,
      secondaryEquipment: entity.secondaryEquipment,
      SecondaryItems: entity.secondaryItems,
      posture: entity.posture,
      singleOrDoubleArm: entity.singleOrDoubleArm,
      continuousOrAlternatingArms: entity.continuousOrAlternatingArms,
      grip: entity.grip,
      loadPositionEnding: entity.loadPositionEnding,
      continuousOrAlternatingLegs: entity.continuousOrAlternatingLegs,
      footElevation: entity.footElevation,
      combinationExercises: entity.combinationExercises,
      movementPattern1: entity.movementPattern1,
      movementPattern2: entity.movementPattern2,
      movementPattern3: entity.movementPattern3,
      planeOfMotion1: entity.planeOfMotion1,
      planeOfMotion2: entity.planeOfMotion2,
      planeOfMotion3: entity.planeOfMotion3,
      bodyRegion: entity.bodyRegion,
      forceType: entity.forceType,
      mechanics: entity.mechanics,
      laterality: entity.laterality,
      primaryExerciseClassification: entity.primaryExerciseClassification,
      shortYoutubeDemonstrationLink: entity.shortYoutubeDemonstrationLink,
      inDepthYoutubeExplanationLink: entity.inDepthYoutubeExplanationLink,
    );
  }
}
