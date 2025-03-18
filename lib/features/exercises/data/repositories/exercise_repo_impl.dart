import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../../domain/entities/exercises_entity.dart';
import '../../domain/repositories/exercise_repo.dart';
import '../data_sources/contract/exercise_data_sources.dart';

@Injectable(as: ExerciseRepo)
class ExerciseRepoImpl implements ExerciseRepo {
  final ExerciseDataSource _exerciseDataSource;

  ExerciseRepoImpl(this._exerciseDataSource);

  @override
  Future<DataResult<ExercisesEntity>> getExercises() async {
    return await _exerciseDataSource.getExercises();
  }
}
