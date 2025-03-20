import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:injectable/injectable.dart';

import '../entities/exercises_entity.dart';
import '../repositories/exercise_repo.dart';

@injectable
class ExerciseUseCase {
  final ExerciseRepo _repository;

  ExerciseUseCase(this._repository);

  Future<DataResult<ExercisesEntity>> getExercises( String primeMoverMuscleId ,String difficultyLevelId) async {
    return await _repository.getExercises( primeMoverMuscleId,difficultyLevelId);
  }
}
