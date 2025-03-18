import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/core/networking/error/error_handler.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_by_id_entity.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_entity.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/muscles_by_muscle_group_id_entity.dart';
import 'package:fitness_app/features/workouts/domain/use_cases/get_workout_by_id.dart';
import 'package:fitness_app/features/workouts/domain/use_cases/workouts_use_case.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workouts_actions.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workouts_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class WorkoutsViewModelCubit extends Cubit<WorkoutsViewModelState> {
  List<MuscleGroupEntity> muscles = [];
  List<MusclesByMuscleGroupIdEntity> musclesGroup = [];
  List<MuscleEntity> dataById = [];

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
        _getWorkoutsById(action.id);
        break;
      case GetMusclesByMuscleGroupId():
        _getMusclesByMuscleGroupId(action.id);
    }
  }

  Future<void> _getAllWorkouts() async {
    emit(GetAllWorkoutsLoading());
    final result = await workoutsUseCase.getAllWorkouts();
    switch (result) {
      case Success<AllMusclesResponseEntity>():

        muscles = result.data.musclesGroup ;
        emit(GetAllWorkoutsSuccess(data: result.data));
      case Fail<AllMusclesResponseEntity>():
        emit(GetAllWorkoutsError(
            errorMessage: ErrorHandler.handle(result.exception!)));
    }
  }

  Future<void> _getWorkoutsById(String id) async {
    emit(GetWorkoutsByIdLoading());
    final result = await getWorkoutsByIdUseCase.getWorkoutById(id);
    switch (result) {
      case Success<MusclesByIdResponseEntity>():
        dataById = result.data.muscles ?? [];
        emit(GetWorkoutsByIdSuccess(data: result.data));
      case Fail<MusclesByIdResponseEntity>():
        emit(GetWorkoutsByIdError(
            errorMessage: ErrorHandler.handle(result.exception!)));
    }
  }

  Future<void> _getMusclesByMuscleGroupId(String id) async {
    emit(GetMusclesByGroupIdLoading());
    final result = await getWorkoutsByIdUseCase.call(id);
    switch (result) {
      case Success<List<MusclesByMuscleGroupIdEntity>>():
        musclesGroup = result.data;
        emit(GetMusclesByGroupIdSuccess(data: result.data));
      case Fail<List<MusclesByMuscleGroupIdEntity>>():
        emit(GetMusclesByGroupIdError(
            errorMessage: ErrorHandler.handle(result.exception!)));
    }
  }
}
