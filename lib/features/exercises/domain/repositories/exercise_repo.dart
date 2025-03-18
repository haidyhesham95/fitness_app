import '../../../../core/networking/common/api_result.dart';
import '../entities/exercises_entity.dart';

abstract class ExerciseRepo {
  Future<DataResult<ExercisesEntity>> getExercises();
}
