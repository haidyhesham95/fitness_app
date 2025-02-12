sealed class ForgetPasswordActions {}

class ForgetPasswordSubmit extends ForgetPasswordActions {
  final String email;

  ForgetPasswordSubmit(this.email);
}