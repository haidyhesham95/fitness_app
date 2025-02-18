import '../../../domain/entities/request/signup_request_entity.dart';

sealed class SignupAction {}
class SignupActionSelected extends SignupAction {}

class SelectActivityAction extends SignupAction {
  final String activity;

  SelectActivityAction({required this.activity});
}

class SelectGoalAction extends SignupAction {
  final String goal;

  SelectGoalAction({required this.goal});
}
