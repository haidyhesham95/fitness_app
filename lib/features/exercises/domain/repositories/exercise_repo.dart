import 'package:fitness_app/features/exercises/domain/entities/levels_prime_over_muscle_entity.dart';

import '../../../../core/networking/common/api_result.dart';
import '../entities/exercises_entity.dart';

abstract class ExerciseRepo {
  Future<DataResult<ExercisesEntity>> getExercises(String primeMoverMuscleId , String difficultyLevelId);
  Future<DataResult<LevelsPrimeMoverMuscleEntity>> getLevels(String primeMoverMuscleId);
}
