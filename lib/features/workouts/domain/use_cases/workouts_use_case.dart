import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_entity.dart';
import 'package:fitness_app/features/workouts/domain/repositories/workouts_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class WorkoutsUseCase {
  final WorkoutsRepo _repository;

  WorkoutsUseCase(this._repository);

  Future<DataResult<AllMusclesResponseEntity>> getAllWorkouts() {
    return _repository.getAllWorkouts();
  }
}
