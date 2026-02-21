// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter/material.dart' as _i409;
import 'package:flutter_gemini/flutter_gemini.dart' as _i257;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive_ce/hive.dart' as _i738;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../core/app_cubit/app_cubit.dart' as _i693;
import '../core/networking/api/api_manager.dart' as _i282;
import '../core/networking/api/meals_api_manager/meals_api_manager.dart'
    as _i851;
import '../core/networking/common/register_context_module.dart' as _i885;
import '../core/networking/network_factory.dart' as _i377;
import '../core/services/gemini_helper.dart' as _i896;
import '../core/services/isar_service.dart' as _i574;
import '../features/auth/data/data_sources/contracts/offline_data_sources/auth_offline_data_source.dart'
    as _i551;
import '../features/auth/data/data_sources/contracts/online_data_sources/auth_online_data_source.dart'
    as _i97;
import '../features/auth/data/data_sources/impl/auth_offline_data_source_impl.dart'
    as _i1036;
import '../features/auth/data/data_sources/impl/auth_online_data_source_impl.dart'
    as _i326;
import '../features/auth/data/repositories/auth_repo_impl.dart' as _i990;
import '../features/auth/domain/contracts/auth_repo.dart' as _i665;
import '../features/auth/domain/use_cases/forget_password_use_case.dart'
    as _i230;
import '../features/auth/domain/use_cases/login_use_case.dart' as _i496;
import '../features/auth/domain/use_cases/signup_use_case.dart' as _i853;
import '../features/auth/presentation/forget_password/viewModel/forget_password_view_model_cubit.dart'
    as _i289;
import '../features/auth/presentation/login/viewModel/login_view_model_cubit.dart'
    as _i690;
import '../features/auth/presentation/register/view_model/signup_view_model_cubit.dart'
    as _i864;
import '../features/exercises/data/data_sources/contract/exercise_data_sources.dart'
    as _i616;
import '../features/exercises/data/data_sources/impl/exercise_data_source_impl.dart'
    as _i92;
import '../features/exercises/data/repositories/exercise_repo_impl.dart'
    as _i499;
import '../features/exercises/domain/repositories/exercise_repo.dart' as _i750;
import '../features/exercises/domain/use_case/exercise_use_case.dart' as _i783;
import '../features/exercises/domain/use_case/levels_prime_muscle_use_case.dart'
    as _i965;
import '../features/exercises/presentation/viewModel/exercise_view_model_cubit.dart'
    as _i156;
import '../features/home/data/data_sources/online/contracts/home_online_data_source.dart'
    as _i505;
import '../features/home/data/data_sources/online/impl/home_online_data_source_impl.dart'
    as _i856;
import '../features/home/data/repositories/home_repo_impl.dart' as _i21;
import '../features/home/domain/contracts/home_repo.dart' as _i950;
import '../features/home/domain/use_cases/all_difficult_levels_use_case.dart'
    as _i182;
import '../features/home/domain/use_cases/popular_training_use_case.dart'
    as _i83;
import '../features/home/domain/use_cases/random_execrcises_use_case.dart'
    as _i239;
import '../features/home/domain/use_cases/random_muscles_use_case.dart'
    as _i642;
import '../features/home/presentation/viewModel/home_view_model_cubit.dart'
    as _i801;
import '../features/meals/data/data_sources/contracts/meals_data_source.dart'
    as _i165;
import '../features/meals/data/data_sources/impl/meals_data_source_impl.dart'
    as _i311;
import '../features/meals/data/repositories/meals_repository_impl.dart'
    as _i1066;
import '../features/meals/domain/repositories/meals_repository.dart' as _i251;
import '../features/meals/domain/use_cases/get_meal_by_id_case.dart' as _i378;
import '../features/meals/domain/use_cases/get_meals_by_category_case.dart'
    as _i122;
import '../features/meals/domain/use_cases/get_meals_categories_case.dart'
    as _i525;
import '../features/meals/presentation/viewModel/meals_view_model_cubit.dart'
    as _i501;
import '../features/profile/data/data_sources/contracts/online_data_sources/profile_online_data_source.dart'
    as _i1039;
import '../features/profile/data/data_sources/impl/profile_online_data_source_impl.dart'
    as _i74;
import '../features/profile/data/repositories/profile_repo_impl.dart' as _i933;
import '../features/profile/domain/repositories/profile_repo.dart' as _i49;
import '../features/profile/domain/use_cases/edit_profile_use_case.dart'
    as _i828;
import '../features/profile/domain/use_cases/profile_use_case.dart' as _i804;
import '../features/profile/domain/use_cases/upload_photo_use_case.dart'
    as _i801;
import '../features/profile/presentation/view_model/profile_view_model_cubit.dart'
    as _i761;
import '../features/smart_coach_chat/data/data_sources/offline_data_source/contract/offline_data_source.dart'
    as _i474;
import '../features/smart_coach_chat/data/data_sources/offline_data_source/impl/offline_data_source_impl.dart'
    as _i470;
import '../features/smart_coach_chat/data/data_sources/online_data_source/contract/smart_chat_online_data_source.dart'
    as _i318;
import '../features/smart_coach_chat/data/data_sources/online_data_source/impl/smart_chat_data_source_impl.dart'
    as _i937;
import '../features/smart_coach_chat/data/models/offline/message_hive.dart'
    as _i267;
import '../features/smart_coach_chat/data/repositories/offline/offline_repo_impl.dart'
    as _i434;
import '../features/smart_coach_chat/data/repositories/smart_chat_repo_impl.dart'
    as _i937;
import '../features/smart_coach_chat/domain/repositories/offline/offline_contracts.dart'
    as _i321;
import '../features/smart_coach_chat/domain/repositories/smart_chat_repo.dart'
    as _i652;
import '../features/smart_coach_chat/domain/use_cases/fetch_smart_chat_case.dart'
    as _i544;
import '../features/smart_coach_chat/domain/use_cases/offline/local_storage_use_case.dart'
    as _i642;
import '../features/smart_coach_chat/presentation/viewModel/smart_chat_view_model.dart'
    as _i923;
import '../features/workouts/data/data_sources/online_data_sources/contracts/get_all_workouts_online_data_source.dart'
    as _i796;
import '../features/workouts/data/data_sources/online_data_sources/impl/get_all_workouts_online_data_source_impl.dart'
    as _i927;
import '../features/workouts/data/repositories/workouts_repo_impl.dart' as _i31;
import '../features/workouts/domain/repositories/workouts_repo.dart' as _i78;
import '../features/workouts/domain/use_cases/get_workout_by_id.dart' as _i1021;
import '../features/workouts/domain/use_cases/workouts_use_case.dart' as _i183;
import '../features/workouts/presentation/view_model/workouts_view_model.dart'
    as _i868;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkFactory = _$NetworkFactory();
    final hiveModule = _$HiveModule();
    final appModule = _$AppModule();
    gh.factory<_i693.AppCubit>(() => _i693.AppCubit());
    gh.factory<_i528.PrettyDioLogger>(() => networkFactory.prettyDioLogger());
    await gh.factoryAsync<_i738.Box<_i267.ChatHive>>(
      () => hiveModule.chatBoxProvider,
      preResolve: true,
    );
    gh.singleton<_i409.GlobalKey<_i409.NavigatorState>>(
        () => appModule.navigatorKey);
    gh.lazySingleton<_i257.Gemini>(() => appModule.provideGemini());
    gh.lazySingleton<_i361.Dio>(() => networkFactory.provideDio());
    gh.factory<_i551.AuthOfflineDataSource>(
        () => _i1036.AuthOfflineDataSourceImpl());
    gh.singleton<_i282.ApiManager>(() => _i282.ApiManager(gh<_i361.Dio>()));
    gh.factory<_i796.WorkoutsOnlineDataSource>(
        () => _i927.WorkoutsOnlineDataSourceImpl(gh<_i282.ApiManager>()));
    gh.lazySingleton<_i361.Dio>(
      () => networkFactory.provideMealsDio(),
      instanceName: 'mealsDio',
    );
    gh.factory<_i474.OfflineDataSource>(
        () => _i470.OfflineDataSourceImpl(gh<_i738.Box<_i267.ChatHive>>()));
    gh.factory<_i78.WorkoutsRepo>(
        () => _i31.WorkoutsRepoImpl(gh<_i796.WorkoutsOnlineDataSource>()));
    gh.singleton<_i851.MealsApiManager>(
        () => _i851.MealsApiManager(gh<_i361.Dio>(instanceName: 'mealsDio')));
    gh.singleton<_i896.GeminiHelper>(
        () => _i896.GeminiHelper(gh<_i257.Gemini>()));
    gh.factory<_i321.OfflineRepo>(
        () => _i434.OfflineRepoImpl(gh<_i474.OfflineDataSource>()));
    gh.factory<_i97.AuthOnlineDataSource>(
        () => _i326.AuthOnlineDataSourceImpl(gh<_i282.ApiManager>()));
    gh.factory<_i1021.GetWorkoutsByIdUseCase>(
        () => _i1021.GetWorkoutsByIdUseCase(gh<_i78.WorkoutsRepo>()));
    gh.factory<_i183.WorkoutsUseCase>(
        () => _i183.WorkoutsUseCase(gh<_i78.WorkoutsRepo>()));
    gh.factory<_i616.ExerciseDataSource>(
        () => _i92.ExerciseDataSourceImpl(gh<_i282.ApiManager>()));
    gh.factory<_i318.SmartChatOnlineDataSource>(
        () => _i937.GeminiSmartChatDataSource(gh<_i896.GeminiHelper>()));
    gh.factory<_i505.HomeOnlineDataSource>(
        () => _i856.HomeOnlineDataSourceImpl(gh<_i282.ApiManager>()));
    gh.factory<_i1039.ProfileOnlineDataSource>(
        () => _i74.ProfileOnlineDataSourceImpl(gh<_i282.ApiManager>()));
    gh.factory<_i642.HiveUseCase>(
        () => _i642.HiveUseCase(gh<_i321.OfflineRepo>()));
    gh.factory<_i49.ProfileRepo>(
        () => _i933.ProfileRepoImpl(gh<_i1039.ProfileOnlineDataSource>()));
    gh.factory<_i950.HomeRepo>(
        () => _i21.HomeRepoImpl(gh<_i505.HomeOnlineDataSource>()));
    gh.factory<_i868.WorkoutsViewModelCubit>(() => _i868.WorkoutsViewModelCubit(
          gh<_i183.WorkoutsUseCase>(),
          gh<_i1021.GetWorkoutsByIdUseCase>(),
        ));
    gh.factory<_i165.MealsDataSource>(
        () => _i311.MealsDataSourceImpl(gh<_i851.MealsApiManager>()));
    gh.factory<_i665.AuthRepo>(
        () => _i990.AuthRepoImpl(gh<_i97.AuthOnlineDataSource>()));
    gh.factory<_i652.SmartChatRepo>(
        () => _i937.SmartChatRepoImpl(gh<_i318.SmartChatOnlineDataSource>()));
    gh.factory<_i230.ForgetPasswordUseCase>(
        () => _i230.ForgetPasswordUseCase(gh<_i665.AuthRepo>()));
    gh.factory<_i496.LoginUseCase>(
        () => _i496.LoginUseCase(gh<_i665.AuthRepo>()));
    gh.factory<_i853.SignUpUseCase>(
        () => _i853.SignUpUseCase(gh<_i665.AuthRepo>()));
    gh.factory<_i182.AllDifficultLevelsUseCase>(
        () => _i182.AllDifficultLevelsUseCase(gh<_i950.HomeRepo>()));
    gh.factory<_i239.RandomExercisesUseCase>(
        () => _i239.RandomExercisesUseCase(gh<_i950.HomeRepo>()));
    gh.factory<_i642.RandomMusclesUseCase>(
        () => _i642.RandomMusclesUseCase(gh<_i950.HomeRepo>()));
    gh.factory<_i750.ExerciseRepo>(
        () => _i499.ExerciseRepoImpl(gh<_i616.ExerciseDataSource>()));
    gh.factory<_i83.PopularTrainingUseCase>(() => _i83.PopularTrainingUseCase(
          gh<_i78.WorkoutsRepo>(),
          gh<_i950.HomeRepo>(),
        ));
    gh.factory<_i828.EditProfileUseCase>(
        () => _i828.EditProfileUseCase(gh<_i49.ProfileRepo>()));
    gh.factory<_i804.ProfileUseCase>(
        () => _i804.ProfileUseCase(gh<_i49.ProfileRepo>()));
    gh.factory<_i801.UploadPhotoUseCase>(
        () => _i801.UploadPhotoUseCase(gh<_i49.ProfileRepo>()));
    gh.factory<_i783.ExerciseUseCase>(
        () => _i783.ExerciseUseCase(gh<_i750.ExerciseRepo>()));
    gh.factory<_i965.LevelsPrimeMuscleUseCase>(
        () => _i965.LevelsPrimeMuscleUseCase(gh<_i750.ExerciseRepo>()));
    gh.factory<_i251.MealsRepository>(
        () => _i1066.MealsRepositoryImpl(gh<_i165.MealsDataSource>()));
    gh.factory<_i289.ForgetPasswordViewModelCubit>(() =>
        _i289.ForgetPasswordViewModelCubit(gh<_i230.ForgetPasswordUseCase>()));
    gh.factory<_i122.GetMealsByCategoryCase>(
        () => _i122.GetMealsByCategoryCase(gh<_i251.MealsRepository>()));
    gh.factory<_i525.GetMealsCategoriesCase>(
        () => _i525.GetMealsCategoriesCase(gh<_i251.MealsRepository>()));
    gh.factory<_i378.GetMealByIdCase>(
        () => _i378.GetMealByIdCase(gh<_i251.MealsRepository>()));
    gh.factory<_i501.MealsViewModelCubit>(() => _i501.MealsViewModelCubit(
          gh<_i525.GetMealsCategoriesCase>(),
          gh<_i122.GetMealsByCategoryCase>(),
          gh<_i378.GetMealByIdCase>(),
        ));
    gh.factory<_i544.FetchSmartChatCase>(
        () => _i544.FetchSmartChatCase(gh<_i652.SmartChatRepo>()));
    gh.factory<_i864.SignUpViewModel>(
        () => _i864.SignUpViewModel(gh<_i853.SignUpUseCase>()));
    gh.factory<_i690.LoginViewModel>(
        () => _i690.LoginViewModel(gh<_i496.LoginUseCase>()));
    gh.factory<_i801.HomeViewModelCubit>(() => _i801.HomeViewModelCubit(
          gh<_i642.RandomMusclesUseCase>(),
          gh<_i239.RandomExercisesUseCase>(),
          gh<_i83.PopularTrainingUseCase>(),
        ));
    gh.factory<_i761.ProfileViewModelCubit>(() => _i761.ProfileViewModelCubit(
          gh<_i804.ProfileUseCase>(),
          gh<_i551.AuthOfflineDataSource>(),
          gh<_i828.EditProfileUseCase>(),
          gh<_i801.UploadPhotoUseCase>(),
        ));
    gh.factory<_i923.SmartChatViewModel>(() => _i923.SmartChatViewModel(
          gh<_i544.FetchSmartChatCase>(),
          gh<_i642.HiveUseCase>(),
        ));
    gh.factory<_i156.ExerciseViewModelCubit>(() => _i156.ExerciseViewModelCubit(
          gh<_i783.ExerciseUseCase>(),
          gh<_i965.LevelsPrimeMuscleUseCase>(),
        ));
    return this;
  }
}

class _$NetworkFactory extends _i377.NetworkFactory {}

class _$HiveModule extends _i574.HiveModule {}

class _$AppModule extends _i885.AppModule {}
