part of 'exercise_view_model_cubit.dart';

@immutable
sealed class ExerciseViewModelState {}

final class ExerciseViewModelInitial extends ExerciseViewModelState {}

final class ExerciseViewModelLoading extends ExerciseViewModelState {}

final class ExerciseViewModelSuccess extends ExerciseViewModelState {
  final ExercisesEntity data;

  ExerciseViewModelSuccess({required this.data});
}

final class ExerciseViewModelError extends ExerciseViewModelState {
  final ErrorModel errorMessage;

  ExerciseViewModelError({required this.errorMessage});
}

final class LevelsPrimeMoverMuscleSuccess extends ExerciseViewModelState {
  final LevelsPrimeMoverMuscleEntity data;
  LevelsPrimeMoverMuscleSuccess({required this.data});
}

final class LevelsPrimeMoverMuscleError extends ExerciseViewModelState {
  final ErrorModel errorMessage;
  LevelsPrimeMoverMuscleError({required this.errorMessage});
}