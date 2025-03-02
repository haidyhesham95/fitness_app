import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:injectable/injectable.dart';

@singleton
class GeminiHelper {
  final Gemini _gemini;

  GeminiHelper(this._gemini);

  Gemini get gemini => _gemini;
}