import 'package:fitness_app/features/exercises/domain/entities/exercises_entity.dart';

import '../../../../../core/networking/common/api_result.dart';

abstract class ExerciseDataSource {
  Future<DataResult<ExercisesEntity>> getExercises();
}