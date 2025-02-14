import 'package:fitness_app/features/auth/domain/entities/request/forget_password_request_entity.dart';

sealed class ForgetPasswordActions {}

class ForgetPasswordSubmit extends ForgetPasswordActions {
  final ForgetPasswordRequestEntity request;

  ForgetPasswordSubmit(this.request);
}