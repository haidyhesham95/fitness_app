part of 'goal_activity_view_model_cubit.dart';

@immutable
sealed class GoalActivityViewModelState {}

final class GoalActivityViewModelInitial extends GoalActivityViewModelState {}

final class ActionLoading extends GoalActivityViewModelState {}

final class ActionSuccess extends GoalActivityViewModelState {
  final SignUpResponseEntity data;

  ActionSuccess(this.data);
}

final class ActionError extends GoalActivityViewModelState {
  final ErrorModel errorMessage;

  ActionError(this.errorMessage);
}
