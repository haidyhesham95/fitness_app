import 'package:fitness_app/core/routes/base_routes.dart';
import 'package:fitness_app/features/on_boarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';

import '../utils/screens/under_build_screen.dart';

class AppRoutes {
  static const String onBoarding = '/';
  static const String homeScreen='homeScreen';
  static Route<void> onGenerateRoute(RouteSettings settings) {

   // final args = settings.arguments;
    switch (settings.name) {
      case onBoarding:
        return BaseRoute(page:  OnboardingScreen());

      default:
        return BaseRoute(page: const PageUnderBuildScreen());    }
  }
}
