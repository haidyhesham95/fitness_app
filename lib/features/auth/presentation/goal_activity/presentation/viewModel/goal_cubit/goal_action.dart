import 'package:fitness_app/features/auth/domain/entities/request/signup_request_entity.dart';

sealed class GoalAction {}

class GetGoals extends GoalAction {
  final SignUpRequestEntity request;

  GetGoals(this.request);
}
