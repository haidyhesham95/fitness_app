part of 'goal_view_model_cubit.dart';

@immutable
sealed class GoalViewModelState {}

final class GoalViewModelInitial extends GoalViewModelState {}

final class GoalViewModelLoading extends GoalViewModelState {}

final class GoalViewModelSuccess extends GoalViewModelState {
  final SignUpResponseEntity response;

  GoalViewModelSuccess(this.response);
}

final class GoalViewModelError extends GoalViewModelState {
  final ErrorModel errorMessage;

  GoalViewModelError(this.errorMessage);
}
