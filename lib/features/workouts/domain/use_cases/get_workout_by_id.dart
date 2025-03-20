import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_by_id_entity.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/muscles_by_muscle_group_id_entity.dart';
import 'package:fitness_app/features/workouts/domain/repositories/workouts_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetWorkoutsByIdUseCase {
  final WorkoutsRepo _repository;

  GetWorkoutsByIdUseCase(this._repository);

  Future<DataResult<MusclesByIdResponseEntity>> getWorkoutById(String id) {
    return _repository.getWorkoutById(id);
  }

  Future<DataResult<List<MusclesByMuscleGroupIdEntity>>> call(String id) {
    return _repository.getMusclesByMuscleGroupId(id);
  }
}
