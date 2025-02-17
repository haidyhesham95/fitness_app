import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'goal_view_model_state.dart';

class GoalViewModelCubit extends Cubit<GoalViewModelState> {
  GoalViewModelCubit() : super(GoalViewModelInitial());
}
