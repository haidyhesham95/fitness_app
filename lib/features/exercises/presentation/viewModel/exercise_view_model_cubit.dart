import 'package:bloc/bloc.dart';
import 'package:fitness_app/features/exercises/domain/entities/levels_prime_over_muscle_entity.dart';
import 'package:fitness_app/features/exercises/domain/use_case/exercise_use_case.dart';
import 'package:fitness_app/features/exercises/domain/use_case/levels_prime_muscle_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../../../../core/networking/error/error_handler.dart';
import '../../domain/entities/exercises_entity.dart';
import 'exercise_action.dart';
import 'exercise_view_model_state.dart';

@injectable
class ExerciseViewModelCubit extends Cubit<ExerciseViewModelState> {
  ExerciseViewModelCubit(this._exerciseUseCase, this._levelsPrimeMuscleUseCase)
      : super(ExerciseViewModelInitial());

  final ExerciseUseCase _exerciseUseCase;
  final LevelsPrimeMuscleUseCase _levelsPrimeMuscleUseCase;
  List<Exercises> exercises = [];
  List<DifficultyLevel> difficultyLevels = [];
  int levelIndex = 0;

  void doAction(ExerciseAction action) {
    switch (action) {
      case GetExercises():
        _getExercises(action.primeMoverMuscleId, action.difficultyLevelId);
        break;

      case GetLevelsPrimeMoverMuscle():
        _getLevelsLevelsPrimeMuscle(action.primeMoverMuscleId);
        break;

      case GetLevelIndex():
    }
  }

  void _getExercises(
      String primeMoverMuscleId, String difficultyLevelId) async {
    emit(ExerciseViewModelLoading());
    final result = await _exerciseUseCase.getExercises(
        primeMoverMuscleId, difficultyLevelId);

    switch (result) {
      case Success<ExercisesEntity>(:final data):
        exercises = data.exercises ?? [];
        emit(ExerciseViewModelSuccess(data: data));

      case Fail<ExercisesEntity>(:final exception):
        emit(ExerciseViewModelError(
          errorMessage: ErrorHandler.handle(exception!),
        ));
    }
  }

  void _getLevelsLevelsPrimeMuscle(String primeMoverMuscleId) async {
    emit(ExerciseViewModelLoading());
    final result =
        await _levelsPrimeMuscleUseCase.getLevels(primeMoverMuscleId);

    switch (result) {
      case Success<LevelsPrimeMoverMuscleEntity>():
        if (result.data.difficultyLevels.isNotEmpty) {
          difficultyLevels = result.data.difficultyLevels;
        }
        debugPrint(
            'difficultyLevels VM result : ${result.data.difficultyLevels.map(
                  (e) => e.name,
                ).toList()} ');
        debugPrint('difficultyLevels VM : ${difficultyLevels.map(
              (e) => e.name,
            ).toList()} ');
        emit(LevelsPrimeMoverMuscleSuccess(data: result.data));

      case Fail<LevelsPrimeMoverMuscleEntity>(:final exception):
        emit(LevelsPrimeMoverMuscleError(
          errorMessage: ErrorHandler.handle(exception!),
        ));
    }
  }
}
