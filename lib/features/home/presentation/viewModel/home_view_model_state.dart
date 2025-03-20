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

/** get popular training items **/

final class GetPopularTrainingLoading extends HomeViewModelState {}

final class GetPopularTrainingSuccess extends HomeViewModelState {
  final List<PopularTrainingEntity> items;

  GetPopularTrainingSuccess(this.items);
}

final class GetPopularTrainingError extends HomeViewModelState {
  final ErrorModel errorMessage;

  GetPopularTrainingError(this.errorMessage);
}
