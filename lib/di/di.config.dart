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
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i11;

import '../core/app_cubit/app_cubit.dart' as _i3;
import '../core/networking/api/api_manager.dart' as _i16;
import '../core/networking/common/register_context_module.dart' as _i30;
import '../core/networking/network_factory.dart' as _i29;
import '../core/services/gemini_helper.dart' as _i8;
import '../core/services/isar_service.dart' as _i31;
import '../features/auth/data/data_sources/contracts/offline_data_sources/auth_offline_data_source.dart'
    as _i4;
import '../features/auth/data/data_sources/contracts/online_data_sources/auth_online_data_source.dart'
    as _i17;
import '../features/auth/data/data_sources/impl/auth_offline_data_source_impl.dart'
    as _i5;
import '../features/auth/data/data_sources/impl/auth_online_data_source_impl.dart'
    as _i18;
import '../features/auth/data/repositories/auth_repo_impl.dart' as _i20;
import '../features/auth/domain/contracts/auth_repo.dart' as _i19;
import '../features/auth/domain/use_cases/forget_password_use_case.dart'
    as _i22;
import '../features/auth/domain/use_cases/login_use_case.dart' as _i24;
import '../features/auth/domain/use_cases/signup_use_case.dart' as _i26;
import '../features/auth/presentation/forget_password/viewModel/forget_password_view_model_cubit.dart'
    as _i23;
import '../features/auth/presentation/login/viewModel/login_view_model_cubit.dart'
    as _i25;
import '../features/auth/presentation/register/view_model/signup_view_model_cubit.dart'
    as _i27;
import '../features/smart_coach_chat/data/data_sources/online_data_source/contract/smart_chat_online_data_source.dart'
    as _i12;
import '../features/smart_coach_chat/data/data_sources/online_data_source/impl/smart_chat_data_source_impl.dart'
    as _i13;
import '../features/smart_coach_chat/data/repositories/smart_chat_repo_impl.dart'
    as _i15;
import '../features/smart_coach_chat/domain/repositories/smart_chat_repo.dart'
    as _i14;
import '../features/smart_coach_chat/domain/use_cases/fetch_smart_chat_case.dart'
    as _i21;
import '../features/smart_coach_chat/presentation/viewModel/smart_chat_view_model.dart'
    as _i28;

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
    gh.factory<_i11.PrettyDioLogger>(() => networkFactory.prettyDioLogger());
    gh.factory<_i12.SmartChatOnlineDataSource>(
        () => _i13.SmartChatDataSourceImpl(gh<_i8.GeminiHelper>()));
    gh.factory<_i14.SmartChatRepo>(
        () => _i15.SmartChatRepoImpl(gh<_i12.SmartChatOnlineDataSource>()));
    gh.singleton<_i16.ApiManager>(() => _i16.ApiManager(gh<_i6.Dio>()));
    gh.factory<_i17.AuthOnlineDataSource>(
        () => _i18.AuthOnlineDataSourceImpl(gh<_i16.ApiManager>()));
    gh.factory<_i19.AuthRepo>(
        () => _i20.AuthRepoImpl(gh<_i17.AuthOnlineDataSource>()));
    gh.factory<_i21.FetchSmartChatCase>(
        () => _i21.FetchSmartChatCase(gh<_i14.SmartChatRepo>()));
    gh.factory<_i22.ForgetPasswordUseCase>(
        () => _i22.ForgetPasswordUseCase(gh<_i19.AuthRepo>()));
    gh.factory<_i23.ForgetPasswordViewModelCubit>(() =>
        _i23.ForgetPasswordViewModelCubit(gh<_i22.ForgetPasswordUseCase>()));
    gh.factory<_i24.LoginUseCase>(() => _i24.LoginUseCase(gh<_i19.AuthRepo>()));
    gh.factory<_i25.LoginViewModel>(
        () => _i25.LoginViewModel(gh<_i24.LoginUseCase>()));
    gh.factory<_i26.SignUpUseCase>(
        () => _i26.SignUpUseCase(gh<_i19.AuthRepo>()));
    gh.factory<_i27.SignUpViewModel>(
        () => _i27.SignUpViewModel(gh<_i26.SignUpUseCase>()));
    gh.factory<_i28.SmartChatViewModel>(
        () => _i28.SmartChatViewModel(gh<_i21.FetchSmartChatCase>()));
    return this;
  }
}

class _$NetworkFactory extends _i29.NetworkFactory {}

class _$AppModule extends _i30.AppModule {}

class _$IsarModule extends _i31.IsarModule {}
