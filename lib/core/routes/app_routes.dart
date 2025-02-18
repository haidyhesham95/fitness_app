import 'package:fitness_app/core/networking/common/regester_context_module.dart';
import 'package:fitness_app/core/routes/base_routes.dart';
import 'package:fitness_app/features/auth/presentation/goal_activity/presentation/views/activity_view.dart';
import 'package:fitness_app/features/auth/presentation/goal_activity/presentation/views/goal_view.dart';
import 'package:fitness_app/features/auth/presentation/login/view/login_view.dart';
import 'package:fitness_app/features/auth/presentation/login/viewModel/login_view_model_cubit.dart';
import 'package:fitness_app/features/auth/presentation/register/view/sign_up_view.dart';
import 'package:fitness_app/features/auth/presentation/register/view_model/signup_view_model_cubit.dart';
import 'package:fitness_app/features/on_boarding/on_boarding_screen.dart';
import 'package:fitness_app/features/auth/presentation/login/view/login_view.dart';
import 'package:fitness_app/features/auth/presentation/login/viewModel/login_view_model_cubit.dart';
import 'package:fitness_app/features/auth/presentation/register/view/sign_up_view.dart';
import 'package:fitness_app/features/auth/presentation/register/view_model/signup_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/forget_password/views/create_password_view.dart';
import '../../features/auth/presentation/forget_password/views/forget_password_view.dart';
import '../../features/auth/presentation/forget_password/views/verify_otp_view.dart';
import '../utils/screens/under_build_screen.dart';

class AppRoutes {
  static const String login = 'login';
  static const String homeScreen = 'homeScreen';
  static const String forgetPasswordView = 'forgetPasswordView';
  static const String verifyOtpView = 'verifyOtpView';
  static const String createPasswordView = 'createPasswordView';
  static const String goalView = 'goalView';
  static const String activityView = 'activityView';
  static const String onBoarding = '/';
  static const String signUp = "signUpView";
  static Route<void> onGenerateRoute(RouteSettings settings) {

   // final args = settings.arguments;
    switch (settings.name) {
      case homeScreen:
         case login:
        return BaseRoute(
            page: BlocProvider(create: (context) => getIt.get<LoginViewModel>(),child:
              const LoginView(),));
       case signUp:
         return BaseRoute(
             page: BlocProvider(create: (context) => getIt.get<SignUpViewModel>(),child:
             const SignUpView(),));
      case onBoarding:
        return BaseRoute(page:  OnboardingScreen());
      case login:
        return BaseRoute(
            page: BlocProvider(create: (context) => getIt.get<LoginViewModel>(),child:
              const LoginView(),));
       case signUp:
         return BaseRoute(
             page: BlocProvider(create: (context) => getIt.get<SignUpViewModel>(),child:
             const SignUpView(),));
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
