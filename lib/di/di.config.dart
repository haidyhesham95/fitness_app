// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:flutter/material.dart' as _i9;
import 'package:flutter_gemini/flutter_gemini.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i10;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i20;

import '../core/app_cubit/app_cubit.dart' as _i3;
import '../core/networking/api/api_manager.dart' as _i25;
import '../core/networking/api/meals_api_manager/meals_api_manager.dart'
    as _i11;
import '../core/networking/common/register_context_module.dart' as _i67;
import '../core/networking/network_factory.dart' as _i66;
import '../core/services/gemini_helper.dart' as _i8;
import '../core/services/isar_service.dart' as _i68;
import '../features/auth/data/data_sources/contracts/offline_data_sources/auth_offline_data_source.dart'
    as _i4;
import '../features/auth/data/data_sources/contracts/online_data_sources/auth_online_data_source.dart'
    as _i26;
import '../features/auth/data/data_sources/impl/auth_offline_data_source_impl.dart'
    as _i5;
import '../features/auth/data/data_sources/impl/auth_online_data_source_impl.dart'
    as _i27;
import '../features/auth/data/repositories/auth_repo_impl.dart' as _i29;
import '../features/auth/domain/contracts/auth_repo.dart' as _i28;
import '../features/auth/domain/use_cases/forget_password_use_case.dart'
    as _i31;
import '../features/auth/domain/use_cases/login_use_case.dart' as _i41;
import '../features/auth/domain/use_cases/signup_use_case.dart' as _i51;
import '../features/auth/presentation/forget_password/viewModel/forget_password_view_model_cubit.dart'
    as _i32;
import '../features/auth/presentation/login/viewModel/login_view_model_cubit.dart'
    as _i42;
import '../features/auth/presentation/register/view_model/signup_view_model_cubit.dart'
    as _i52;
import '../features/home/data/data_sources/online/contracts/home_online_data_source.dart'
    as _i36;
import '../features/home/data/data_sources/online/impl/home_online_data_source_impl.dart'
    as _i37;
import '../features/home/data/repositories/home_repo_impl.dart' as _i39;
import '../features/home/domain/contracts/home_repo.dart' as _i38;
import '../features/home/domain/use_cases/category_meals_use_case.dart' as _i60;
import '../features/home/domain/use_cases/random_execrcises_use_case.dart'
    as _i49;
import '../features/home/domain/use_cases/random_muscles_use_case.dart' as _i50;
import '../features/home/presentation/viewModel/home_view_model_cubit.dart'
    as _i63;
import '../features/meals/data/data_sources/contracts/meals_data_source.dart'
    as _i12;
import '../features/meals/data/data_sources/impl/meals_data_source_impl.dart'
    as _i13;
import '../features/meals/data/repositories/meals_repository_impl.dart' as _i15;
import '../features/meals/domain/repositories/meals_repository.dart' as _i14;
import '../features/meals/domain/use_cases/get_meal_by_id_case.dart' as _i33;
import '../features/meals/domain/use_cases/get_meals_by_category_case.dart'
    as _i34;
import '../features/meals/domain/use_cases/get_meals_categories_case.dart'
    as _i35;
import '../features/meals/presentation/viewModel/meals_view_model_cubit.dart'
    as _i43;
import '../features/profile/data/data_sources/contracts/online_data_sources/profile_online_data_source.dart'
    as _i44;
import '../features/profile/data/data_sources/impl/profile_online_data_source_impl.dart'
    as _i45;
import '../features/profile/data/repositories/profile_repo_impl.dart' as _i47;
import '../features/profile/domain/repositories/profile_repo.dart' as _i46;
import '../features/profile/domain/use_cases/edit_profile_use_case.dart'
    as _i61;
import '../features/profile/domain/use_cases/profile_use_case.dart' as _i48;
import '../features/profile/domain/use_cases/upload_photo_use_case.dart'
    as _i54;
import '../features/profile/presentation/view_model/profile_view_model_cubit.dart'
    as _i64;
import '../features/smart_coach_chat/data/data_sources/offline_data_source/contract/offline_data_source.dart'
    as _i16;
import '../features/smart_coach_chat/data/data_sources/offline_data_source/impl/offline_data_source_impl.dart'
    as _i17;
import '../features/smart_coach_chat/data/data_sources/online_data_source/contract/smart_chat_online_data_source.dart'
    as _i21;
import '../features/smart_coach_chat/data/data_sources/online_data_source/impl/smart_chat_data_source_impl.dart'
    as _i22;
import '../features/smart_coach_chat/data/repositories/offline/offline_repo_impl.dart'
    as _i19;
import '../features/smart_coach_chat/data/repositories/smart_chat_repo_impl.dart'
    as _i24;
import '../features/smart_coach_chat/domain/repositories/offline/offline_contracts.dart'
    as _i18;
import '../features/smart_coach_chat/domain/repositories/smart_chat_repo.dart'
    as _i23;
import '../features/smart_coach_chat/domain/use_cases/fetch_smart_chat_case.dart'
    as _i30;
import '../features/smart_coach_chat/domain/use_cases/offline/local_storage_use_case.dart'
    as _i40;
import '../features/smart_coach_chat/presentation/viewModel/smart_chat_view_model.dart'
    as _i53;
import '../features/workouts/data/data_sources/online_data_sources/contracts/get_all_workouts_online_data_source.dart'
    as _i55;
import '../features/workouts/data/data_sources/online_data_sources/impl/get_all_workouts_online_data_source_impl.dart'
    as _i56;
import '../features/workouts/data/repositories/workouts_repo_impl.dart' as _i58;
import '../features/workouts/domain/repositories/workouts_repo.dart' as _i57;
import '../features/workouts/domain/use_cases/get_workout_by_id.dart' as _i62;
import '../features/workouts/domain/use_cases/workouts_use_case.dart' as _i59;
import '../features/workouts/presentation/view_model/workouts_view_model.dart'
    as _i65;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkFactory = _$NetworkFactory();
    final appModule = _$AppModule();
    final isarModule = _$IsarModule();
    gh.factory<_i3.AppCubit>(() => _i3.AppCubit());
    gh.factory<_i4.AuthOfflineDataSource>(
        () => _i5.AuthOfflineDataSourceImpl());
    gh.lazySingleton<_i6.Dio>(() => networkFactory.provideDio());
    gh.lazySingleton<_i7.Gemini>(() => appModule.provideGemini());
    gh.singleton<_i8.GeminiHelper>(() => _i8.GeminiHelper(gh<_i7.Gemini>()));
    gh.singleton<_i9.GlobalKey<_i9.NavigatorState>>(
        () => appModule.navigatorKey);
    await gh.factoryAsync<_i10.Isar>(
      () => isarModule.isarProvider,
      preResolve: true,
    );
    gh.singleton<_i11.MealsApiManager>(
        () => _i11.MealsApiManager(gh<_i6.Dio>()));
    gh.factory<_i12.MealsDataSource>(
        () => _i13.MealsDataSourceImpl(gh<_i11.MealsApiManager>()));
    gh.factory<_i14.MealsRepository>(
        () => _i15.MealsRepositoryImpl(gh<_i12.MealsDataSource>()));
    gh.factory<_i16.OfflineDataSource>(
        () => _i17.OfflineDataSourceImpl(gh<_i10.Isar>()));
    gh.factory<_i18.OfflineRepo>(
        () => _i19.OfflineRepoImpl(gh<_i16.OfflineDataSource>()));
    gh.factory<_i20.PrettyDioLogger>(() => networkFactory.prettyDioLogger());
    gh.factory<_i21.SmartChatOnlineDataSource>(
        () => _i22.GeminiSmartChatDataSource(gh<_i8.GeminiHelper>()));
    gh.factory<_i23.SmartChatRepo>(
        () => _i24.SmartChatRepoImpl(gh<_i21.SmartChatOnlineDataSource>()));
    gh.singleton<_i25.ApiManager>(() => _i25.ApiManager(gh<_i6.Dio>()));
    gh.factory<_i26.AuthOnlineDataSource>(
        () => _i27.AuthOnlineDataSourceImpl(gh<_i25.ApiManager>()));
    gh.factory<_i28.AuthRepo>(
        () => _i29.AuthRepoImpl(gh<_i26.AuthOnlineDataSource>()));
    gh.factory<_i30.FetchSmartChatCase>(
        () => _i30.FetchSmartChatCase(gh<_i23.SmartChatRepo>()));
    gh.factory<_i31.ForgetPasswordUseCase>(
        () => _i31.ForgetPasswordUseCase(gh<_i28.AuthRepo>()));
    gh.factory<_i32.ForgetPasswordViewModelCubit>(() =>
        _i32.ForgetPasswordViewModelCubit(gh<_i31.ForgetPasswordUseCase>()));
    gh.factory<_i33.GetMealByIdCase>(
        () => _i33.GetMealByIdCase(gh<_i14.MealsRepository>()));
    gh.factory<_i34.GetMealsByCategoryCase>(
        () => _i34.GetMealsByCategoryCase(gh<_i14.MealsRepository>()));
    gh.factory<_i35.GetMealsCategories>(
        () => _i35.GetMealsCategories(gh<_i14.MealsRepository>()));
    gh.factory<_i36.HomeOnlineDataSource>(
        () => _i37.HomeOnlineDataSourceImpl(gh<_i25.ApiManager>()));
    gh.factory<_i38.HomeRepo>(
        () => _i39.HomeRepoImpl(gh<_i36.HomeOnlineDataSource>()));
    gh.factory<_i40.IsarUseCase>(
        () => _i40.IsarUseCase(gh<_i18.OfflineRepo>()));
    gh.factory<_i41.LoginUseCase>(() => _i41.LoginUseCase(gh<_i28.AuthRepo>()));
    gh.factory<_i42.LoginViewModel>(
        () => _i42.LoginViewModel(gh<_i41.LoginUseCase>()));
    gh.factory<_i43.MealsViewModelCubit>(() => _i43.MealsViewModelCubit(
          gh<_i35.GetMealsCategories>(),
          gh<_i34.GetMealsByCategoryCase>(),
          gh<_i33.GetMealByIdCase>(),
        ));
    gh.factory<_i44.ProfileOnlineDataSource>(
        () => _i45.ProfileOnlineDataSourceImpl(gh<_i25.ApiManager>()));
    gh.factory<_i46.ProfileRepo>(
        () => _i47.ProfileRepoImpl(gh<_i44.ProfileOnlineDataSource>()));
    gh.factory<_i48.ProfileUseCase>(
        () => _i48.ProfileUseCase(gh<_i46.ProfileRepo>()));
    gh.factory<_i49.RandomExercisesUseCase>(
        () => _i49.RandomExercisesUseCase(gh<_i38.HomeRepo>()));
    gh.factory<_i50.RandomMusclesUseCase>(
        () => _i50.RandomMusclesUseCase(gh<_i38.HomeRepo>()));
    gh.factory<_i51.SignUpUseCase>(
        () => _i51.SignUpUseCase(gh<_i28.AuthRepo>()));
    gh.factory<_i52.SignUpViewModel>(
        () => _i52.SignUpViewModel(gh<_i51.SignUpUseCase>()));
    gh.factory<_i53.SmartChatViewModel>(() => _i53.SmartChatViewModel(
          gh<_i30.FetchSmartChatCase>(),
          gh<_i40.IsarUseCase>(),
        ));
    gh.factory<_i54.UploadPhotoUseCase>(
        () => _i54.UploadPhotoUseCase(gh<_i46.ProfileRepo>()));
    gh.factory<_i55.WorkoutsOnlineDataSource>(
        () => _i56.WorkoutsOnlineDataSourceImpl(gh<_i25.ApiManager>()));
    gh.factory<_i57.WorkoutsRepo>(
        () => _i58.WorkoutsRepoImpl(gh<_i55.WorkoutsOnlineDataSource>()));
    gh.factory<_i59.WorkoutsUseCase>(
        () => _i59.WorkoutsUseCase(gh<_i57.WorkoutsRepo>()));
    gh.factory<_i60.CategoryMealsUseCase>(
        () => _i60.CategoryMealsUseCase(gh<_i38.HomeRepo>()));
    gh.factory<_i61.EditProfileUseCase>(
        () => _i61.EditProfileUseCase(gh<_i46.ProfileRepo>()));
    gh.factory<_i62.GetWorkoutsByIdUseCase>(
        () => _i62.GetWorkoutsByIdUseCase(gh<_i57.WorkoutsRepo>()));
    gh.factory<_i63.HomeViewModelCubit>(() => _i63.HomeViewModelCubit(
          gh<_i50.RandomMusclesUseCase>(),
          gh<_i60.CategoryMealsUseCase>(),
          gh<_i49.RandomExercisesUseCase>(),
        ));
    gh.factory<_i64.ProfileViewModelCubit>(() => _i64.ProfileViewModelCubit(
          gh<_i48.ProfileUseCase>(),
          gh<_i4.AuthOfflineDataSource>(),
          gh<_i61.EditProfileUseCase>(),
          gh<_i54.UploadPhotoUseCase>(),
        ));
    gh.factory<_i65.WorkoutsViewModelCubit>(() => _i65.WorkoutsViewModelCubit(
          gh<_i59.WorkoutsUseCase>(),
          gh<_i62.GetWorkoutsByIdUseCase>(),
        ));
    return this;
  }
}

class _$NetworkFactory extends _i66.NetworkFactory {}

class _$AppModule extends _i67.AppModule {}

class _$IsarModule extends _i68.IsarModule {}
