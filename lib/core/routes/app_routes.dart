import 'package:fitness_app/core/networking/common/register_context_module.dart';
import 'package:fitness_app/core/routes/base_routes.dart';
import 'package:fitness_app/features/auth/presentation/login/view/login_view.dart';
import 'package:fitness_app/features/auth/presentation/login/viewModel/login_view_model_cubit.dart';
import 'package:fitness_app/features/auth/presentation/register/view/gender/gender_view.dart';
import 'package:fitness_app/features/auth/presentation/register/view/sign_up_view.dart';
import 'package:fitness_app/features/auth/presentation/register/view_model/signup_view_model_cubit.dart';
import 'package:fitness_app/features/home/presentation/viewModel/home_view_model_cubit.dart';
import 'package:fitness_app/features/home/presentation/views/home_layout.dart';
import 'package:fitness_app/features/meals/presentation/view/meal_details_view.dart';
import 'package:fitness_app/features/meals/presentation/view/meal_view.dart';
import 'package:fitness_app/features/meals/presentation/viewModel/meals_actions.dart';
import 'package:fitness_app/features/meals/presentation/viewModel/meals_view_model_cubit.dart';
import 'package:fitness_app/features/on_boarding/on_boarding_screen.dart';
import 'package:fitness_app/features/profile/presentation/view/edit_data_view.dart';
import 'package:fitness_app/features/profile/presentation/view/edit_profile_view.dart';
import 'package:fitness_app/features/profile/presentation/view/profile_view.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_actions.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_view_model_cubit.dart';
import 'package:fitness_app/features/profile/presentation/widgets/help_page.dart';
import 'package:fitness_app/features/profile/presentation/widgets/privcya_page.dart';
import 'package:fitness_app/features/profile/presentation/widgets/security_page.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/viewModel/smart_chat_view_model.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/views/smart_chat_view.dart';
import 'package:fitness_app/features/profile/presentation/view/edit_data_view.dart';
import 'package:fitness_app/features/profile/presentation/view/edit_profile_view.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_actions.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_view_model_cubit.dart';
import 'package:fitness_app/features/profile/presentation/view/profile_view.dart';
import 'package:fitness_app/features/workouts/presentation/view/workouts_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/forget_password/views/create_password_view.dart';
import '../../features/auth/presentation/forget_password/views/forget_password_view.dart';
import '../../features/auth/presentation/forget_password/views/verify_otp_view.dart';
import '../../features/auth/presentation/register/view/gender/health_data_view.dart';
import '../../features/auth/presentation/register/view/gender/height_view.dart';
import '../../features/auth/presentation/register/view/gender/old_view.dart';
import '../../features/auth/presentation/register/view/gender/weight_view.dart';
import '../../features/auth/presentation/register/view/goal_activity/activity_view.dart';
import '../../features/auth/presentation/register/view/goal_activity/goal_view.dart';
import '../../features/home/presentation/viewModel/home_action.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../utils/screens/under_build_screen.dart';

class AppRoutes {
  static const String login = 'login';
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
  static const String profileView = "profileView";
  static const String securityPage = "securityPage";
  static const String privacyPage = "privacyPage";
  static const String helpPage = "helpPage";
  static const String smartChatIntroView = "smartChatIntroView";
  static const String smartChatView = "smartChatView";
  static const String homeLayout = "homeLayout";
  static const String editDataView = "editDataView";
  static const String workoutsCard = "workoutsCard";
  static const String workoutsView = "workoutsView";
  static const String mealsView = "mealsView";
  static const String homeView = "homeView";
  static const String mealDetails = "mealDetails";
  
  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case login:
        return BaseRoute(
            page: BlocProvider(
          create: (context) => getIt.get<LoginViewModel>(),
          child: const LoginView(),
        ));
      case signUp:
        return BaseRoute(
            page: BlocProvider(
          create: (context) => getIt.get<SignUpViewModel>(),
          child: const SignUpView(),
        ));
      case onBoarding:
        return BaseRoute(page: OnboardingScreen());
      case forgetPasswordView:
        return BaseRoute(page: const ForgetPasswordView());
      case verifyOtpView:
        return BaseRoute(page: const VerifyOtpView());
      case createPasswordView:
        return BaseRoute(page: const CreatePasswordView());
      case goalView:
        return BaseRoute(
            page: GoalView(
          viewModel: args as SignUpViewModel,
        ));
      case activityView:
        return BaseRoute(
            page: ActivityView(
          viewModel: args as SignUpViewModel,
        ));
      case genderView:
        return BaseRoute(
            page: GenderView(
          viewModel: args as SignUpViewModel,
        ));
      case oldView:
        return BaseRoute(
            page: OldView(
          viewModel: args as SignUpViewModel,
        ));
      case heightView:
        return BaseRoute(
            page: HeightView(
          viewModel: args as SignUpViewModel,
        ));
      case weightView:
        return BaseRoute(
            page: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => getIt.get<ProfileViewModelCubit>()
                  ..doAction(GetUserData())),
            BlocProvider(create: (context) => getIt.get<SignUpViewModel>()),
          ],
          child: WeightView(
            weight: args as int,
          ),
        ));
      case editProfileView:
        return BaseRoute(
            page: BlocProvider(
          create: (context) => getIt.get<ProfileViewModelCubit>(),
          child: const EditProfileView(),
        ));
      case healthDataPage:
        return BaseRoute(
            page: HealthDataView(
          viewModel: args as SignUpViewModel,
        ));
      case profileView:
        return BaseRoute(
            page: BlocProvider(
          create: (context) =>
              getIt.get<ProfileViewModelCubit>()..doAction(GetUserData()),
          child: const ProfileView(),
        ));
      case editDataView:
        final args = settings.arguments as Map<String, dynamic>;
        return BaseRoute(
          page: BlocProvider(
            create: (context) =>
                getIt.get<ProfileViewModelCubit>()..doAction(GetUserData()),
            child: EditDataView(
              viewModel: args['viewModel'],
              step: args['step'],
            ),
          ),
        );
      case securityPage:
        return BaseRoute(page: const SecurityPage());
      case privacyPage:
        return BaseRoute(page: const PrivacyPage());
      case helpPage:
        return BaseRoute(page: const HelpPage());
        case workoutsCard:
        return BaseRoute(page:  WorkoutsView());

      case smartChatView:
        return BaseRoute(
            page: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => getIt.get<SmartChatViewModel>()),
            BlocProvider(
                create: (context) => getIt.get<ProfileViewModelCubit>()
                  ..doAction(GetUserData())),
          ],
          child: const SmartChatView(),
        ));
      case homeLayout:
        return BaseRoute(
            page: MultiBlocProvider(providers: [
          BlocProvider(
              create: (context) =>
                  getIt.get<ProfileViewModelCubit>()..doAction(GetUserData())),
        ], child: const HomeLayout()));

      case mealsView:
        return BaseRoute(
            page: BlocProvider(
          create: (context) => getIt.get<MealsViewModelCubit>(),
          child: const MealsView(),
        ));
      case homeView:
        return BaseRoute(page: const HomeView());
      case mealDetails:
        return BaseRoute(
            page: BlocProvider(
          create: (context) => getIt.get<MealsViewModelCubit>()
            ..doAction(GetMealInfo(args)),
          child: MealDetailsView(
            mealId: args as String,
          ),
        ));
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
