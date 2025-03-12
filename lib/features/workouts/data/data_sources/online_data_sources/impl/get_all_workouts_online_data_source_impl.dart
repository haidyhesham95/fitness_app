import 'package:fitness_app/core/networking/api/api_manager.dart';
import 'package:fitness_app/core/networking/api_execute.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/workouts/data/data_sources/online_data_sources/contracts/get_all_workouts_online_data_source.dart';
import 'package:fitness_app/features/workouts/data/mappers/workouts_mapper.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_by_id_entity.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WorkoutsOnlineDataSource)
class WorkoutsOnlineDataSourceImpl implements WorkoutsOnlineDataSource {
  final ApiManager _apiManager;
  WorkoutsOnlineDataSourceImpl(this._apiManager);

  @override
  Future<DataResult<AllMusclesResponseEntity>> getAllWorkouts() {
    return executeApi(() async {
      final response = await _apiManager.getAllWorkouts();
      return WorkoutsMapper.toEntity(response);
    });
  }

  @override
  Future<DataResult<MusclesByIdResponseEntity>> getWorkoutById() {
    return executeApi(() async {
      final response = await _apiManager.getWorkoutsById();
      return WorkoutsMapper.toEntityById(response);
    });
  }


  }
