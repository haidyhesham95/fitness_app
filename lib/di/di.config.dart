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
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../core/app_cubit/app_cubit.dart' as _i693;
import '../core/networking/api/api_manager.dart' as _i282;
import '../core/networking/common/regester_context_module.dart' as _i407;
import '../core/networking/network_factory.dart' as _i377;
import '../features/auth/data/contracts/auth_offline_data_source.dart' as _i521;
import '../features/auth/data/contracts/auth_online_data_source.dart' as _i506;
import '../features/auth/data/data_sources/contracts/offline_data_sources/auth_offline_data_source.dart'
    as _i551;
import '../features/auth/data/data_sources/contracts/online_data_sources/auth_online_data_source.dart'
    as _i97;
import '../features/auth/data/data_sources/impl/auth_offline_data_source_impl.dart'
    as _i1036;
import '../features/auth/data/data_sources/impl/auth_online_data_source_impl.dart'
    as _i326;
import '../features/auth/data/impl/auth_offline_data_source_impl.dart' as _i919;
import '../features/auth/data/impl/auth_online_data_source_impl.dart' as _i1050;
import '../features/auth/data/repo_impl/auth_repo_impl.dart' as _i855;
import '../features/auth/data/repositories/auth_repo_impl.dart' as _i990;
import '../features/auth/domain/contracts/auth_repo.dart' as _i665;
import '../features/auth/domain/repositories/auth_repo.dart' as _i82;
import '../features/auth/domain/use_case/login_use_case.dart' as _i876;
import '../features/auth/domain/use_case/signup_use_case.dart' as _i1064;
import '../features/auth/domain/use_cases/auth_use_case.dart' as _i839;
import '../features/auth/presentation/forget_password/viewModel/forget_password_view_model_cubit.dart'
    as _i289;
import '../features/auth/presentation/goal_activity/presentation/viewModel/goal_cubit/goal_view_model_cubit.dart'
    as _i808;
import '../features/auth/presentation/login/viewModel/login_view_model_cubit.dart'
    as _i690;
import '../features/auth/presentation/register/view_model/signup_view_model_cubit.dart'
    as _i864;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkFactory = _$NetworkFactory();
    final appModule = _$AppModule();
    gh.factory<_i693.AppCubit>(() => _i693.AppCubit());
    gh.factory<_i528.PrettyDioLogger>(() => networkFactory.prettyDioLogger());
    gh.singleton<_i409.GlobalKey<_i409.NavigatorState>>(
        () => appModule.navigatorKey);
    gh.lazySingleton<_i361.Dio>(() => networkFactory.provideDio());
    gh.factory<_i521.OfflineDataSource>(
        () => _i919.OfflineDataSourceImplementation());
    gh.factory<_i551.AuthOfflineDataSource>(
        () => _i1036.AuthOfflineDataSourceImpl());
    gh.singleton<_i282.ApiManager>(() => _i282.ApiManager(gh<_i361.Dio>()));
    gh.factory<_i97.AuthOnlineDataSource>(
        () => _i326.AuthOnlineDataSourceImpl(gh<_i282.ApiManager>()));
    gh.factory<_i506.AuthOnlineDataSource>(
        () => _i1050.AuthOnlineDataSourceImpl(gh<_i282.ApiManager>()));
    gh.factory<_i665.AuthRepo>(
        () => _i990.AuthRepoImpl(gh<_i97.AuthOnlineDataSource>()));
    gh.factory<_i82.AuthRepository>(
        () => _i855.AuthRepositoryImpl(gh<_i506.AuthOnlineDataSource>()));
    gh.factory<_i876.LoginUseCase>(
        () => _i876.LoginUseCase(gh<_i82.AuthRepository>()));
    gh.factory<_i1064.SignUpUseCase>(
        () => _i1064.SignUpUseCase(gh<_i82.AuthRepository>()));
    gh.factory<_i839.AuthUseCase>(
        () => _i839.AuthUseCase(gh<_i665.AuthRepo>()));
    gh.factory<_i690.LoginViewModel>(
        () => _i690.LoginViewModel(gh<_i876.LoginUseCase>()));
    gh.factory<_i289.ForgetPasswordViewModelCubit>(
        () => _i289.ForgetPasswordViewModelCubit(gh<_i839.AuthUseCase>()));
    gh.factory<_i808.GoalViewModelCubit>(
        () => _i808.GoalViewModelCubit(gh<_i1064.SignUpUseCase>()));
    gh.factory<_i864.SignUpViewModel>(
        () => _i864.SignUpViewModel(gh<_i1064.SignUpUseCase>()));
    return this;
  }
}

class _$NetworkFactory extends _i377.NetworkFactory {}

class _$AppModule extends _i407.AppModule {}
