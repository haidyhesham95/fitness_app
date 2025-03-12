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
