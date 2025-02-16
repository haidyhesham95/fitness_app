import 'package:fitness_app/core/networking/common/regester_context_module.dart';
import 'package:fitness_app/core/routes/base_routes.dart';
import 'package:fitness_app/features/auth/presentation/login/view/login_view.dart';
import 'package:fitness_app/features/auth/presentation/login/viewModel/login_view_model_cubit.dart';
import 'package:fitness_app/features/auth/presentation/register/view/sign_up_view.dart';
import 'package:fitness_app/features/auth/presentation/register/view_model/signup_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/screens/under_build_screen.dart';

class AppRoutes {
  static const String login = '/';
  static const String homeScreen = 'homeScreen';
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
      default:
        return BaseRoute(page: const PageUnderBuildScreen());    }
  }
}
