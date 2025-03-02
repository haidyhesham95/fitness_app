import 'package:fitness_app/core/styles/colors/dark_color.dart';
import 'package:fitness_app/core/styles/colors/light_color.dart';
import 'package:flutter/material.dart';

import 'app_color_theme.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: LightColor.bgColor,
  appBarTheme: const AppBarTheme(
    color: LightColor.transparent,

  ),


  // Text and icons colors
  extensions: const <ThemeExtension<dynamic>>[
    AppColorTheme.light,
  ],
  useMaterial3: true,
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: DarkColor.bg,
  appBarTheme: const AppBarTheme(color: DarkColor.transparent,

  ),
  extensions:  <ThemeExtension<dynamic>>[
    AppColorTheme.dark,

  ],
  useMaterial3: true,
);
