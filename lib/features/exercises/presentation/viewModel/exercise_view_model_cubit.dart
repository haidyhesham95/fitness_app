import 'package:bloc/bloc.dart';
import 'package:fitness_app/features/exercises/domain/use_case/exercise_use_case.dart';
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
  ExerciseViewModelCubit(this._exerciseUseCase)
      : super(ExerciseViewModelInitial());
  final ExerciseUseCase _exerciseUseCase;
  void doAction(ExerciseAction action) {
    switch (action) {
      case GetExercises():
        _getExercises();
        break;

    }
  }

  void _getExercises() async {
    emit(ExerciseViewModelLoading());
    final result = await _exerciseUseCase.getExercises();
    switch (result) {
      case Success<ExercisesEntity>():
        emit(ExerciseViewModelSuccess(data: result.data));
      case Fail<ExercisesEntity>():
        emit(ExerciseViewModelError(
            errorMessage: ErrorHandler.handle(result.exception!)));
    }
  }
}
