import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../services/shared_preference/shared_pref_keys.dart';
import '../services/shared_preference/shared_preference_helper.dart';
import 'api/api_constants.dart';

@module
abstract class NetworkFactory {
  @lazySingleton
  Dio provideDio() {
    final dio = Dio();
    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      baseUrl: ApiConstants.baseUrl,
    );

    dio.interceptors.add(providerInterceptor()); // Using the provided LogInterceptor

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SharedPrefHelper().getString(key: SharedPrefKeys.tokenKey);
          options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
        onError: (error, handler) {
          if (error.response != null && error.response!.statusCode == 401) {
          }
          return handler.next(error);
        },
      ),
    );


    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: kDebugMode,
    ));

    return dio;
  }

  LogInterceptor providerInterceptor() {
    return LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    );
  }
}
