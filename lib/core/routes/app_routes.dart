import 'package:fitness_app/core/routes/base_routes.dart';
import 'package:fitness_app/features/auth/presentation/login/view/login_view.dart';
import 'package:fitness_app/features/auth/presentation/register/view/signup_view.dart';
import 'package:fitness_app/features/home_screen.dart';
import 'package:flutter/material.dart';

import '../utils/screens/under_build_screen.dart';

class AppRoutes {
  static const String login = '/';
  static const String homeScreen = 'homeScreen';
  static const String register = "register";
  static Route<void> onGenerateRoute(RouteSettings settings) {

   // final args = settings.arguments;
    switch (settings.name) {
      case homeScreen:
        return BaseRoute(page: const HomeScreen());
       case login:
        return BaseRoute(page: const LoginView());
       case register:
        return BaseRoute(page: const RegisterView());

      default:
        return BaseRoute(page: const PageUnderBuildScreen());    }
  }
}
