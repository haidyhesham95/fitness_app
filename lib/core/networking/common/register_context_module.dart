import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';

final GetIt getIt = GetIt.instance;

@module
abstract class AppModule {
  @singleton
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();
  @lazySingleton
  Gemini provideGemini() {
    final apiKey = dotenv.get('GEMINI_API_KEY');
    if (apiKey.isEmpty) {
      throw Exception("Gemini API Key is missing. Please set GEMINI_API_KEY in .env");
    }
    return Gemini.init(apiKey: apiKey);
  }
}
