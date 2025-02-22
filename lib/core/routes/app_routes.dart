import 'package:fitness_app/core/networking/common/register_context_module.dart';
import 'package:fitness_app/core/routes/base_routes.dart';
import 'package:fitness_app/features/auth/presentation/login/view/login_view.dart';
import 'package:fitness_app/features/auth/presentation/login/viewModel/login_view_model_cubit.dart';
import 'package:fitness_app/features/auth/presentation/register/view/gender/gender_view.dart';
import 'package:fitness_app/features/auth/presentation/register/view/sign_up_view.dart';
import 'package:fitness_app/features/auth/presentation/register/view_model/signup_view_model_cubit.dart';
import 'package:fitness_app/features/on_boarding/on_boarding_screen.dart';
import 'package:fitness_app/features/profile/presentation/view/edit_profile_view.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/presentation/forget_password/views/create_password_view.dart';
import '../../features/auth/presentation/forget_password/views/forget_password_view.dart';
import '../../features/auth/presentation/forget_password/views/verify_otp_view.dart';
import '../../features/auth/presentation/register/view/gender/health_data_widget.dart';
import '../../features/auth/presentation/register/view/gender/height_view.dart';
import '../../features/auth/presentation/register/view/gender/old_view.dart';
import '../../features/auth/presentation/register/view/gender/weight_view.dart';
import '../../features/auth/presentation/register/view/goal_activity/activity_view.dart';
import '../../features/auth/presentation/register/view/goal_activity/goal_view.dart';
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
  static const String genderView = "genderView";
  static const String oldView = "oldView";
  static const String heightView = "heightView";
  static const String weightView = "weightView";
  static const String editProfileView = "editProfileView";
  static const String healthDataPage = "healthDataPage";
  static Route<void> onGenerateRoute(RouteSettings settings) {

    final args = settings.arguments;
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
      case forgetPasswordView:
        return BaseRoute(page: const ForgetPasswordView());
      case verifyOtpView:
        return BaseRoute(page: const VerifyOtpView());
      case createPasswordView:
        return BaseRoute(page: const CreatePasswordView());
      case goalView:
        return BaseRoute(page:  GoalView(
          viewModel: args as SignUpViewModel,
        ));
      case activityView:
        return BaseRoute(page:  ActivityView(
          viewModel: args as SignUpViewModel,
        ));
        case genderView:
        return BaseRoute(page:  GenderView(
          viewModel: args as SignUpViewModel,
        ));
        case oldView:
        return BaseRoute(page:  OldView(
          viewModel: args as SignUpViewModel,
        ));
        case heightView:
        return BaseRoute(page:  HeightView(
          viewModel: args as SignUpViewModel,
        ));
        case weightView:
        return BaseRoute(page: WeightView(
          viewModel: args as SignUpViewModel,
        ));
        case healthDataPage:
        return BaseRoute(page:  HealthDataPage(
          viewModel: args as SignUpViewModel,
        ));
      case editProfileView:
        return BaseRoute(
            page: BlocProvider(create: (context) => getIt.get<ProfileViewModelCubit>(),child:
            const EditProfileView(),));

      default:
        return BaseRoute(page: const PageUnderBuildScreen());    }
  }
}
