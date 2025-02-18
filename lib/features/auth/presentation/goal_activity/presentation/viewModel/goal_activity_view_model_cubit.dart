import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/networking/error/error_model.dart';
import 'package:fitness_app/features/auth/presentation/goal_activity/presentation/viewModel/activity_actions.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/networking/common/api_result.dart';
import '../../../../../../core/networking/common/regester_context_module.dart';
import '../../../../../../core/networking/error/error_handler.dart';
import '../../../../../../core/services/shared_preference/shared_pref_keys.dart';
import '../../../../../../core/services/shared_preference/shared_preference_helper.dart';
import '../../../../domain/entities/request/signup_request_entity.dart';
import '../../../../domain/entities/response/sign_up_response_entity.dart';
import '../../../../domain/use_case/signup_use_case.dart';

part 'goal_activity_view_model_state.dart';

@injectable
class GoalActivityViewModelCubit extends Cubit<GoalActivityViewModelState> {
  final _useCase = getIt<SignUpUseCase>();

  String activity = "";
  String goal = "";

  GoalActivityViewModelCubit() : super(GoalActivityViewModelInitial());

  void setGoal(String selectedGoal) {
    goal = selectedGoal;
    SharedPrefHelper()
        .setString(key: SharedPrefKeys.goalKey, stringValue: selectedGoal);
  }

  String getGoal() =>
      SharedPrefHelper().getString(key: SharedPrefKeys.goalKey) ?? "";

  void doAction(ActivityActions action) {
    switch (action) {
      case SelectActivityAction():
        _getActivity(action.request);
        break;
    }
  }

  Future<void> _getActivity(SignUpRequestEntity request) async {
    emit(ActionLoading());
    final result = await _useCase.signUp(request);

    switch (result) {
      case Success<SignUpResponseEntity>():
        emit(ActionSuccess(result.data));
        break;
      case Fail<SignUpResponseEntity>():
        emit(ActionError(ErrorHandler.handle(result.exception!)));
        break;
    }
  }

  void getActivityAction(String newActivityLevel, String newGoal) {
    activity = newActivityLevel;
    goal = newGoal;
    _getActivity(SignUpRequestEntity(activityLevel: activity, goal: goal));
  }
}
