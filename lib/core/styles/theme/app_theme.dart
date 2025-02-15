import 'package:fitness_app/core/styles/colors/dark_colors.dart';
import 'package:fitness_app/core/styles/colors/light_colors.dart';
import 'package:flutter/material.dart';

import 'app_color_theme.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: LightColors.bgColor,
  appBarTheme: const AppBarTheme(color: LightColors.transparent),

  extensions: const <ThemeExtension<dynamic>>[
    AppColorTheme.light,
  ],
  useMaterial3: true,
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: DarkColors.bg,
  appBarTheme: const AppBarTheme(color: DarkColors.transparent),
  extensions:  <ThemeExtension<dynamic>>[
    AppColorTheme.dark,
  ],
  useMaterial3: true,
);
