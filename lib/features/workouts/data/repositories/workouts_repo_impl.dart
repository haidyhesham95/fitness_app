import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/workouts/data/data_sources/online_data_sources/contracts/get_all_workouts_online_data_source.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_by_id_entity.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_entity.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/muscles_by_muscle_group_id_entity.dart';
import 'package:fitness_app/features/workouts/domain/repositories/workouts_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WorkoutsRepo)
class WorkoutsRepoImpl extends WorkoutsRepo {
  final WorkoutsOnlineDataSource _onlineDataSource;

  WorkoutsRepoImpl(this._onlineDataSource);

  @override
  Future<DataResult<AllMusclesResponseEntity>> getAllWorkouts() {
    return _onlineDataSource.getAllWorkouts();
  }

  @override
  Future<DataResult<MusclesByIdResponseEntity>> getWorkoutById(String id) {
    return _onlineDataSource.getWorkoutById(id);
  }

  @override
  Future<DataResult<List<MusclesByMuscleGroupIdEntity>>> getMusclesByMuscleGroupId(String id) {
    return _onlineDataSource.getMusclesByMuscleGroupId(id);
  }
}
