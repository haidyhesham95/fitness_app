import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/core/networking/error/error_handler.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_by_id_entity.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_entity.dart';
import 'package:fitness_app/features/workouts/domain/use_cases/get_workout_by_id.dart';
import 'package:fitness_app/features/workouts/domain/use_cases/workouts_use_case.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workouts_actions.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workouts_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class WorkoutsViewModelCubit extends Cubit<WorkoutsViewModelState> {
  WorkoutsViewModelCubit(
    this.workoutsUseCase,
    this.getWorkoutsByIdUseCase,
  ) : super(GetAllWorkoutsViewModelInitial());

  final WorkoutsUseCase workoutsUseCase;
  final GetWorkoutsByIdUseCase getWorkoutsByIdUseCase;

  void doAction(WorkoutsActions action) {
    switch (action) {
      case GetAllWorkouts():
        _getAllWorkouts();
        break;
      case GetWorkoutsById():
        _getWorkoutsById();
        break;
    }
  }

  Future<void> _getAllWorkouts() async {
    emit(GetAllWorkoutsLoading());
    final result = await workoutsUseCase.getAllWorkouts();
    switch (result) {
      case Success<AllMusclesResponseEntity>():
        emit(GetAllWorkoutsSuccess(data: result.data));
      case Fail<AllMusclesResponseEntity>():
        emit(GetAllWorkoutsError(
            errorMessage: ErrorHandler.handle(result.exception!)));
    }
  }

  Future<void> _getWorkoutsById() async {
    emit(GetWorkoutsByIdLoading());
    final result = await getWorkoutsByIdUseCase.getWorkoutById();
    switch (result) {
      case Success<MusclesByIdResponseEntity>():
        emit(GetWorkoutsByIdSuccess(data: result.data));
      case Fail<MusclesByIdResponseEntity>():
        emit(GetAllWorkoutsError(
            errorMessage: ErrorHandler.handle(result.exception!)));
    }
  }
}
