import 'package:fitness_app/core/routes/base_routes.dart';
import 'package:fitness_app/features/auth/presentation/goal_activity/presentation/views/activity_view.dart';
import 'package:fitness_app/features/auth/presentation/goal_activity/presentation/views/goal_view.dart';
import 'package:fitness_app/features/home_screen.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/forget_password/views/create_password_view.dart';
import '../../features/auth/presentation/forget_password/views/forget_password_view.dart';
import '../../features/auth/presentation/forget_password/views/verify_otp_view.dart';
import '../utils/screens/under_build_screen.dart';

class AppRoutes {
  static const String login = '/';
  static const String homeScreen = 'homeScreen';
  static const String forgetPasswordView = 'forgetPasswordView';
  static const String verifyOtpView = 'verifyOtpView';
  static const String createPasswordView = 'createPasswordView';
  static const String goalView = 'goalView';
  static const String activityView = 'activityView';
  static Route<void> onGenerateRoute(RouteSettings settings) {

   // final args = settings.arguments;
    switch (settings.name) {
      case homeScreen:
        return BaseRoute(page: const HomeScreen());
      case forgetPasswordView:
        return BaseRoute(page: const ForgetPasswordView());
      case verifyOtpView:
        return BaseRoute(page: const VerifyOtpView());
      case createPasswordView:
        return BaseRoute(page: const CreatePasswordView());
      case goalView:
        return BaseRoute(page: const GoalView());
      case activityView:
        return BaseRoute(page: const ActivityView());
      default:
        return BaseRoute(page: const PageUnderBuildScreen());    }
  }
}
