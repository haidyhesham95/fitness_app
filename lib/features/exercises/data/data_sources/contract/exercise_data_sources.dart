import 'package:fitness_app/features/exercises/domain/entities/exercises_entity.dart';

import '../../../../../core/networking/common/api_result.dart';
import '../../../domain/entities/levels_prime_over_muscle_entity.dart';

abstract class ExerciseDataSource {
  Future<DataResult<ExercisesEntity>> getExercises( String primeMoverMuscleId ,String difficultyLevelId);
  Future<DataResult<LevelsPrimeMoverMuscleEntity>> getLevels(String primeMoverMuscleId);


}