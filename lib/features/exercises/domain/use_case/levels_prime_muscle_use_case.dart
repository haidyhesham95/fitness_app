import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/exercises/domain/entities/levels_prime_over_muscle_entity.dart';
import 'package:injectable/injectable.dart';
import '../repositories/exercise_repo.dart';

@injectable
class LevelsPrimeMuscleUseCase {
  final ExerciseRepo _repository;

  LevelsPrimeMuscleUseCase(this._repository);

  Future<DataResult<LevelsPrimeMoverMuscleEntity>> getLevels(
      String primeMoverMuscleId) async {
    return await _repository.getLevels(primeMoverMuscleId);
  }
}
