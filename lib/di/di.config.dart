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
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i10;

import '../core/app_cubit/app_cubit.dart' as _i3;
import '../core/networking/api/api_manager.dart' as _i15;
import '../core/networking/common/register_context_module.dart' as _i29;
import '../core/networking/network_factory.dart' as _i28;
import '../core/services/gemini_helper.dart' as _i8;
import '../features/auth/data/data_sources/contracts/offline_data_sources/auth_offline_data_source.dart'
    as _i4;
import '../features/auth/data/data_sources/contracts/online_data_sources/auth_online_data_source.dart'
    as _i16;
import '../features/auth/data/data_sources/impl/auth_offline_data_source_impl.dart'
    as _i5;
import '../features/auth/data/data_sources/impl/auth_online_data_source_impl.dart'
    as _i17;
import '../features/auth/data/repositories/auth_repo_impl.dart' as _i19;
import '../features/auth/domain/contracts/auth_repo.dart' as _i18;
import '../features/auth/domain/use_cases/forget_password_use_case.dart'
    as _i21;
import '../features/auth/domain/use_cases/login_use_case.dart' as _i23;
import '../features/auth/domain/use_cases/signup_use_case.dart' as _i25;
import '../features/auth/presentation/forget_password/viewModel/forget_password_view_model_cubit.dart'
    as _i22;
import '../features/auth/presentation/login/viewModel/login_view_model_cubit.dart'
    as _i24;
import '../features/auth/presentation/register/view_model/signup_view_model_cubit.dart'
    as _i26;
import '../features/smart_coach_chat/data/data_sources/online_data_source/contract/smart_chat_online_data_source.dart'
    as _i11;
import '../features/smart_coach_chat/data/data_sources/online_data_source/impl/smart_chat_data_source_impl.dart'
    as _i12;
import '../features/smart_coach_chat/data/repositories/smart_chat_repo_impl.dart'
    as _i14;
import '../features/smart_coach_chat/domain/repositories/smart_chat_repo.dart'
    as _i13;
import '../features/smart_coach_chat/domain/use_cases/fetch_smart_chat_case.dart'
    as _i20;
import '../features/smart_coach_chat/presentation/viewModel/smart_chat_view_model.dart'
    as _i27;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkFactory = _$NetworkFactory();
    final appModule = _$AppModule();
    gh.factory<_i3.AppCubit>(() => _i3.AppCubit());
    gh.factory<_i4.AuthOfflineDataSource>(
        () => _i5.AuthOfflineDataSourceImpl());
    gh.lazySingleton<_i6.Dio>(() => networkFactory.provideDio());
    gh.lazySingleton<_i7.Gemini>(() => appModule.provideGemini());
    gh.singleton<_i8.GeminiHelper>(() => _i8.GeminiHelper(gh<_i7.Gemini>()));
    gh.singleton<_i9.GlobalKey<_i9.NavigatorState>>(
        () => appModule.navigatorKey);
    gh.factory<_i10.PrettyDioLogger>(() => networkFactory.prettyDioLogger());
    gh.factory<_i11.SmartChatOnlineDataSource>(
        () => _i12.SmartChatDataSourceImpl(gh<_i8.GeminiHelper>()));
    gh.factory<_i13.SmartChatRepo>(
        () => _i14.SmartChatRepoImpl(gh<_i11.SmartChatOnlineDataSource>()));
    gh.singleton<_i15.ApiManager>(() => _i15.ApiManager(gh<_i6.Dio>()));
    gh.factory<_i16.AuthOnlineDataSource>(
        () => _i17.AuthOnlineDataSourceImpl(gh<_i15.ApiManager>()));
    gh.factory<_i18.AuthRepo>(
        () => _i19.AuthRepoImpl(gh<_i16.AuthOnlineDataSource>()));
    gh.factory<_i20.FetchSmartChatCase>(
        () => _i20.FetchSmartChatCase(gh<_i13.SmartChatRepo>()));
    gh.factory<_i21.ForgetPasswordUseCase>(
        () => _i21.ForgetPasswordUseCase(gh<_i18.AuthRepo>()));
    gh.factory<_i22.ForgetPasswordViewModelCubit>(() =>
        _i22.ForgetPasswordViewModelCubit(gh<_i21.ForgetPasswordUseCase>()));
    gh.factory<_i23.LoginUseCase>(() => _i23.LoginUseCase(gh<_i18.AuthRepo>()));
    gh.factory<_i24.LoginViewModel>(
        () => _i24.LoginViewModel(gh<_i23.LoginUseCase>()));
    gh.factory<_i25.SignUpUseCase>(
        () => _i25.SignUpUseCase(gh<_i18.AuthRepo>()));
    gh.factory<_i26.SignUpViewModel>(
        () => _i26.SignUpViewModel(gh<_i25.SignUpUseCase>()));
    gh.factory<_i27.SmartChatViewModel>(
        () => _i27.SmartChatViewModel(gh<_i20.FetchSmartChatCase>()));
    return this;
  }
}

class _$NetworkFactory extends _i28.NetworkFactory {}

class _$AppModule extends _i29.AppModule {}
