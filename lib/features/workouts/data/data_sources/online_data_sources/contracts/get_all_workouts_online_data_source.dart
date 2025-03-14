import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_by_id_entity.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_entity.dart';

abstract class WorkoutsOnlineDataSource {
  Future<DataResult<AllMusclesResponseEntity>> getAllWorkouts();

  Future<DataResult<MusclesByIdResponseEntity>> getWorkoutById();
}
