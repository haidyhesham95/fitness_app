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
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i15;

import '../core/app_cubit/app_cubit.dart' as _i3;
import '../core/networking/api/api_manager.dart' as _i20;
import '../core/networking/common/register_context_module.dart' as _i43;
import '../core/networking/network_factory.dart' as _i42;
import '../core/services/gemini_helper.dart' as _i8;
import '../core/services/isar_service.dart' as _i44;
import '../features/auth/data/data_sources/contracts/offline_data_sources/auth_offline_data_source.dart'
    as _i4;
import '../features/auth/data/data_sources/contracts/online_data_sources/auth_online_data_source.dart'
    as _i21;
import '../features/auth/data/data_sources/impl/auth_offline_data_source_impl.dart'
    as _i5;
import '../features/auth/data/data_sources/impl/auth_online_data_source_impl.dart'
    as _i22;
import '../features/auth/data/repositories/auth_repo_impl.dart' as _i24;
import '../features/auth/domain/contracts/auth_repo.dart' as _i23;
import '../features/auth/domain/use_cases/forget_password_use_case.dart'
    as _i26;
import '../features/auth/domain/use_cases/login_use_case.dart' as _i29;
import '../features/auth/domain/use_cases/signup_use_case.dart' as _i36;
import '../features/auth/presentation/forget_password/viewModel/forget_password_view_model_cubit.dart'
    as _i27;
import '../features/auth/presentation/login/viewModel/login_view_model_cubit.dart'
    as _i30;
import '../features/auth/presentation/register/view_model/signup_view_model_cubit.dart'
    as _i37;
import '../features/profile/data/data_sources/contracts/online_data_sources/profile_online_data_source.dart'
    as _i31;
import '../features/profile/data/data_sources/impl/profile_online_data_source_impl.dart'
    as _i32;
import '../features/profile/data/repositories/profile_repo_impl.dart' as _i34;
import '../features/profile/domain/repositories/profile_repo.dart' as _i33;
import '../features/profile/domain/use_cases/edit_profile_use_case.dart'
    as _i40;
import '../features/profile/domain/use_cases/profile_use_case.dart' as _i35;
import '../features/profile/domain/use_cases/upload_photo_use_case.dart'
    as _i39;
import '../features/profile/presentation/view_model/profile_view_model_cubit.dart'
    as _i41;
import '../features/smart_coach_chat/data/data_sources/offline_data_source/contract/offline_data_source.dart'
    as _i11;
import '../features/smart_coach_chat/data/data_sources/offline_data_source/impl/offline_data_source_impl.dart'
    as _i12;
import '../features/smart_coach_chat/data/data_sources/online_data_source/contract/smart_chat_online_data_source.dart'
    as _i16;
import '../features/smart_coach_chat/data/data_sources/online_data_source/impl/smart_chat_data_source_impl.dart'
    as _i17;
import '../features/smart_coach_chat/data/repositories/offline/offline_repo_impl.dart'
    as _i14;
import '../features/smart_coach_chat/data/repositories/smart_chat_repo_impl.dart'
    as _i19;
import '../features/smart_coach_chat/domain/repositories/offline/offline_contracts.dart'
    as _i13;
import '../features/smart_coach_chat/domain/repositories/smart_chat_repo.dart'
    as _i18;
import '../features/smart_coach_chat/domain/use_cases/fetch_smart_chat_case.dart'
    as _i25;
import '../features/smart_coach_chat/domain/use_cases/offline/local_storage_use_case.dart'
    as _i28;
import '../features/smart_coach_chat/presentation/viewModel/smart_chat_view_model.dart'
    as _i38;

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
    gh.factory<_i11.OfflineDataSource>(
        () => _i12.OfflineDataSourceImpl(gh<_i10.Isar>()));
    gh.factory<_i13.OfflineRepo>(
        () => _i14.OfflineRepoImpl(gh<_i11.OfflineDataSource>()));
    gh.factory<_i15.PrettyDioLogger>(() => networkFactory.prettyDioLogger());
    gh.factory<_i16.SmartChatOnlineDataSource>(
        () => _i17.SmartChatDataSourceImpl(gh<_i8.GeminiHelper>()));
    gh.factory<_i18.SmartChatRepo>(
        () => _i19.SmartChatRepoImpl(gh<_i16.SmartChatOnlineDataSource>()));
    gh.singleton<_i20.ApiManager>(() => _i20.ApiManager(gh<_i6.Dio>()));
    gh.factory<_i21.AuthOnlineDataSource>(
        () => _i22.AuthOnlineDataSourceImpl(gh<_i20.ApiManager>()));
    gh.factory<_i23.AuthRepo>(
        () => _i24.AuthRepoImpl(gh<_i21.AuthOnlineDataSource>()));
    gh.factory<_i25.FetchSmartChatCase>(
        () => _i25.FetchSmartChatCase(gh<_i18.SmartChatRepo>()));
    gh.factory<_i26.ForgetPasswordUseCase>(
        () => _i26.ForgetPasswordUseCase(gh<_i23.AuthRepo>()));
    gh.factory<_i27.ForgetPasswordViewModelCubit>(() =>
        _i27.ForgetPasswordViewModelCubit(gh<_i26.ForgetPasswordUseCase>()));
    gh.factory<_i28.IsarUseCase>(
        () => _i28.IsarUseCase(gh<_i13.OfflineRepo>()));
    gh.factory<_i29.LoginUseCase>(() => _i29.LoginUseCase(gh<_i23.AuthRepo>()));
    gh.factory<_i30.LoginViewModel>(
        () => _i30.LoginViewModel(gh<_i29.LoginUseCase>()));
    gh.factory<_i31.ProfileOnlineDataSource>(
        () => _i32.ProfileOnlineDataSourceImpl(gh<_i20.ApiManager>()));
    gh.factory<_i33.ProfileRepo>(
        () => _i34.ProfileRepoImpl(gh<_i31.ProfileOnlineDataSource>()));
    gh.factory<_i35.ProfileUseCase>(
        () => _i35.ProfileUseCase(gh<_i33.ProfileRepo>()));
    gh.factory<_i36.SignUpUseCase>(
        () => _i36.SignUpUseCase(gh<_i23.AuthRepo>()));
    gh.factory<_i37.SignUpViewModel>(
        () => _i37.SignUpViewModel(gh<_i36.SignUpUseCase>()));
    gh.factory<_i38.SmartChatViewModel>(() => _i38.SmartChatViewModel(
          gh<_i25.FetchSmartChatCase>(),
          gh<_i28.IsarUseCase>(),
        ));
    gh.factory<_i39.UploadPhotoUseCase>(
        () => _i39.UploadPhotoUseCase(gh<_i33.ProfileRepo>()));
    gh.factory<_i40.EditProfileUseCase>(
        () => _i40.EditProfileUseCase(gh<_i33.ProfileRepo>()));
    gh.factory<_i41.ProfileViewModelCubit>(() => _i41.ProfileViewModelCubit(
          gh<_i35.ProfileUseCase>(),
          gh<_i4.AuthOfflineDataSource>(),
          gh<_i40.EditProfileUseCase>(),
          gh<_i39.UploadPhotoUseCase>(),
        ));
    return this;
  }
}

class _$NetworkFactory extends _i42.NetworkFactory {}

class _$AppModule extends _i43.AppModule {}

class _$IsarModule extends _i44.IsarModule {}
