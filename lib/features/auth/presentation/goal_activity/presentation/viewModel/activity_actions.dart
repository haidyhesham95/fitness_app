import 'package:fitness_app/features/auth/domain/entities/request/signup_request_entity.dart';

sealed class ActivityActions {}

class SelectActivityAction extends ActivityActions {
  final SignUpRequestEntity request;

  SelectActivityAction(this.request);
}
