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

import '../core/app_cubit/app_cubit.dart' as _i693;
import '../core/networking/api/api_manager.dart' as _i282;
import '../core/networking/common/regester_context_module.dart' as _i407;
import '../core/networking/network_factory.dart' as _i377;
import '../core/services/firebase_helper/fire_store_helper.dart' as _i357;
import '../features/auth/data/data_sources/contracts/online_data_sources/auth_online_data_source.dart'
    as _i97;
import '../features/auth/data/data_sources/impl/auth_online_data_source_impl.dart'
    as _i326;

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
    gh.factory<_i361.LogInterceptor>(
        () => networkFactory.providerInterceptor());
    gh.singleton<_i409.GlobalKey<_i409.NavigatorState>>(
        () => appModule.navigatorKey);
    gh.singleton<_i357.FireStoreService>(() => _i357.FireStoreService());
    gh.lazySingleton<_i361.Dio>(() => networkFactory.provideDio());
    gh.singleton<_i282.ApiManager>(() => _i282.ApiManager(gh<_i361.Dio>()));
    gh.factory<_i97.AuthOnlineDataSource>(
        () => _i326.AuthOnlineDataSourceImpl(gh<_i282.ApiManager>()));
    return this;
  }
}

class _$NetworkFactory extends _i377.NetworkFactory {}

class _$AppModule extends _i407.AppModule {}
