import 'package:fitness_app/features/auth/domain/entities/request/login_request_entity.dart';

sealed class LoginScreenAction {}

class LoginAction extends LoginScreenAction {
  final LoginRequestEntity request;
  LoginAction(this.request,);
}
