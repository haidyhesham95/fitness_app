import 'package:bloc/bloc.dart';
import 'package:fitness_app/features/exercises/domain/entities/levels_prime_over_muscle_entity.dart';
import 'package:fitness_app/features/exercises/domain/use_case/exercise_use_case.dart';
import 'package:fitness_app/features/exercises/domain/use_case/levels_prime_muscle_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/networking/common/api_result.dart';
import '../../../../core/networking/error/error_handler.dart';
import '../../../../core/networking/error/error_model.dart';
import '../../domain/entities/exercises_entity.dart';
import 'exercise_action.dart';

part 'exercise_view_model_state.dart';

@injectable
class ExerciseViewModelCubit extends Cubit<ExerciseViewModelState> {
  ExerciseViewModelCubit(this._exerciseUseCase, this._levelsPrimeMuscleUseCase)
      : super(ExerciseViewModelInitial());

  final ExerciseUseCase _exerciseUseCase;
  final LevelsPrimeMuscleUseCase _levelsPrimeMuscleUseCase;

  void doAction(ExerciseAction action) {
    switch (action) {
      case GetExercises():
        _getExercises(action.primeMoverMuscleId, action.difficultyLevelId);
        break;

      case GetLevelsPrimeMoverMuscle():
        _getLevelsLevelsPrimeMuscle(action.primeMoverMuscleId);
        break;
    }
  }

  void _getExercises(String primeMoverMuscleId, String difficultyLevelId) async {
    emit(ExerciseViewModelLoading());
    final result =
    await _exerciseUseCase.getExercises(primeMoverMuscleId, difficultyLevelId);

    switch (result) {
      case Success<ExercisesEntity>(:final data):
        emit(ExerciseViewModelSuccess(data: data));

      case Fail<ExercisesEntity>(:final exception):
        emit(ExerciseViewModelError(
          errorMessage: ErrorHandler.handle(exception!),
        ));
    }
  }

  void _getLevelsLevelsPrimeMuscle(String primeMoverMuscleId) async {
    emit(ExerciseViewModelLoading());
    final result = await _levelsPrimeMuscleUseCase.getLevels(primeMoverMuscleId);

    switch (result) {
      case Success<LevelsPrimeMoverMuscleEntity>(:final data):
        emit(LevelsPrimeMoverMuscleSuccess(data: data));

      case Fail<LevelsPrimeMoverMuscleEntity>(:final exception):
        emit(LevelsPrimeMoverMuscleError(
          errorMessage: ErrorHandler.handle(exception!),
        ));
    }
  }
}


