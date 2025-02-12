import 'package:fitness_app/core/routes/base_routes.dart';
import 'package:fitness_app/features/home_screen.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/forget_password/views/forget_password_view.dart';
import '../utils/screens/under_build_screen.dart';

class AppRoutes {
  static const String login = '/';
  static const String homeScreen = 'homeScreen';
  static const String forgetPasswordView = 'forgetPasswordView';
  static Route<void> onGenerateRoute(RouteSettings settings) {

   // final args = settings.arguments;
    switch (settings.name) {
      case homeScreen:
        return BaseRoute(page: const HomeScreen());
      case forgetPasswordView:
        return BaseRoute(page: const ForgetPasswordView());
      default:
        return BaseRoute(page: const PageUnderBuildScreen());    }
  }
}
