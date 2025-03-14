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
  Future<DataResult<ExercisesEntity>> getExercises() {
    return executeApi(() async {
      final response = await _apiManager.getExercises();
      return ExerciseMapper.toEntity(response);
    });
  }
}
