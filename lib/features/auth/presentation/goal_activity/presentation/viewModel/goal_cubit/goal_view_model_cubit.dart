import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/core/networking/error/error_handler.dart';
import 'package:fitness_app/core/networking/error/error_model.dart';
import 'package:fitness_app/features/auth/domain/entities/request/signup_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/sign_up_response_entity.dart';
import 'package:fitness_app/features/auth/domain/use_case/signup_use_case.dart';
import 'package:fitness_app/features/auth/presentation/goal_activity/presentation/viewModel/goal_cubit/goal_action.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'goal_view_model_state.dart';

@injectable
class GoalViewModelCubit extends Cubit<GoalViewModelState> {
  final SignUpUseCase _useCase;
  String goal = "";

  @factoryMethod
  GoalViewModelCubit(this._useCase) : super(GoalViewModelInitial());

  void doAction(GoalAction action) {
    switch (action) {
      case GetGoals():
        _getGoal(action.request);
        break;
    }
  }

  Future<void> _getGoal(SignUpRequestEntity request) async {
    emit(GoalViewModelLoading());
    final result = await _useCase.signUp(request);

    switch (result) {
      case Success<SignUpResponseEntity>():
        emit(GoalViewModelSuccess(result.data));
        break;
      case Fail<SignUpResponseEntity>():
        emit(GoalViewModelError(ErrorHandler.handle(result.exception!)));
        break;
    }
  }

  void getGoalAction() {
    _getGoal(SignUpRequestEntity(goal: goal));
  }
}
