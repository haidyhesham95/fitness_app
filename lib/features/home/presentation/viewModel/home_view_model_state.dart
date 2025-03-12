part of 'home_view_model_cubit.dart';

@immutable
sealed class HomeViewModelState {}

final class HomeViewModelInitial extends HomeViewModelState {}

final class GetRandomMusclesLoading extends HomeViewModelState {}

final class GetRandomMusclesSuccess extends HomeViewModelState {
  final GetRandomMusclesResponseEntity muscles;

  GetRandomMusclesSuccess(this.muscles);
}

final class GetRandomMusclesError extends HomeViewModelState {
  final ErrorModel errorMessage;

  GetRandomMusclesError(this.errorMessage);
}
