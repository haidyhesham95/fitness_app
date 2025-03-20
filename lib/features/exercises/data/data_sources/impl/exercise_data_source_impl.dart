import 'package:fitness_app/features/exercises/domain/entities/levels_prime_over_muscle_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/networking/api/api_manager.dart';
import '../../../../../core/networking/api_execute.dart';
import '../../../../../core/networking/common/api_result.dart';
import '../../../domain/entities/exercises_entity.dart';
import '../../exercise_mappers.dart';
import '../contract/exercise_data_sources.dart';

@Injectable(as: ExerciseDataSource)
class ExerciseDataSourceImpl implements ExerciseDataSource {
  final ApiManager _apiManager;

  ExerciseDataSourceImpl(this._apiManager);

  @override
  Future<DataResult<ExercisesEntity>> getExercises(String primeMoverMuscleId ,String difficultyLevelId) {
    return executeApi(() async {
      final response = await _apiManager.getExercises(primeMoverMuscleId: primeMoverMuscleId, difficultyLevelId: difficultyLevelId);
      return ExerciseMapper.toEntity(response);
    });
  }

  @override
  Future<DataResult<LevelsPrimeMoverMuscleEntity>> getLevels(
      String primeMoverMuscleId) {
    return executeApi(() async {
      final response = await _apiManager
          .getDifficultyLevelsByPrimeMoverMuscle(primeMoverMuscleId: primeMoverMuscleId);
      return ExerciseMapper.toLevels(response);
    });
  }
}
