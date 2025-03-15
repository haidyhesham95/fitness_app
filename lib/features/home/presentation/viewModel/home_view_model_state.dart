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

/** category meals **/
final class GetMealsCategoriesLoading extends HomeViewModelState {}

final class GetMealsCategoriesSuccess extends HomeViewModelState {
  final GetMealsCategoriesResponseEntity categories;

  GetMealsCategoriesSuccess(this.categories);
}

final class GetMealsCategoriesError extends HomeViewModelState {
  final ErrorModel errorMessage;

  GetMealsCategoriesError(this.errorMessage);
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
