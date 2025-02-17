import 'package:fitness_app/core/styles/theme/app_color_theme.dart';
import 'package:flutter/material.dart';

import '../../localization/app_localizations.dart';

extension MyContext on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  bool get isLandScape =>
      MediaQuery.of(this).orientation == Orientation.landscape;
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;
  AppColorTheme get colors => Theme.of(this).extension<AppColorTheme>()??AppColorTheme.dark;

  String  translate(String text) {
    if (AppLocalizations.of(this) != null) {
      return AppLocalizations.of(this )!.translate(text)
          .toString();
    }else {
      return '';
    }
  }
}