part of 'home_view_model_cubit.dart';

@immutable
sealed class HomeViewModelState {}

final class HomeViewModelInitial extends HomeViewModelState {}

/** random muscles **/
final class GetRandomMusclesLoading extends HomeViewModelState {}

final class GetRandomMusclesSuccess extends HomeViewModelState {
  final GetRandomMusclesResponseEntity muscles;

  GetRandomMusclesSuccess(this.muscles);
}

final class GetRandomMusclesError extends HomeViewModelState {
  final ErrorModel errorMessage;

  GetRandomMusclesError(this.errorMessage);
}



/** random exercises **/
final class GetRandomExercisesLoading extends HomeViewModelState {}

final class GetRandomExercisesSuccess extends HomeViewModelState {
  final GetRandomExercisesResponseEntity exercises;

  GetRandomExercisesSuccess(this.exercises);
}

final class GetRandomExercisesError extends HomeViewModelState {
  final ErrorModel errorMessage;

  GetRandomExercisesError(this.errorMessage);
}

/** get all difficult levels **/

final class GetAllDifficultLevelsLoading extends HomeViewModelState {}

final class GetAllDifficultLevelsSuccess extends HomeViewModelState {
  final GetAllDifficultLevelsResponseEntity difficultLevels;

  GetAllDifficultLevelsSuccess(this.difficultLevels);
}

final class GetAllDifficultLevelsError extends HomeViewModelState {
  final ErrorModel errorMessage;

  GetAllDifficultLevelsError(this.errorMessage);
}
