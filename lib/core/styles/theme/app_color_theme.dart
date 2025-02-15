import 'package:fitness_app/core/styles/colors/dark_colors.dart';
import 'package:fitness_app/core/styles/colors/light_colors.dart';
import 'package:flutter/material.dart';

class AppColorTheme extends ThemeExtension<AppColorTheme> {
  const AppColorTheme({
    required this.baseColor,
    required this.gray,
    required this.hintText,
    required this.blue,
    required this.white,
    required this.black,
    required this.icon,
    required this.underlineDecoration,
    required this.containerBackground,
    required this.transparent,
  });

  final Color baseColor;
  final Color gray;
  final Color hintText;
  final Color blue;
  final Color white;
  final Color black;
  final Color icon;
  final Color underlineDecoration;
  final Color containerBackground;
  final Color transparent;

  @override
  ThemeExtension<AppColorTheme> copyWith({
    Color? baseColor,
    Color? gray,
    Color? hintText,
    Color? blue,
    Color? white,
    Color? black,
    Color? icon,
    Color? underlineDecoration,
    Color? containerBackground,
    Color? transparent,
  }) {
    return AppColorTheme(
      baseColor: baseColor ?? this.baseColor,
      gray: gray ?? this.gray,
      hintText: hintText ?? this.hintText,
      blue: blue ?? this.blue,
      white: white ?? this.white,
      black: black ?? this.black,
      icon: icon ?? this.icon,
      underlineDecoration: underlineDecoration ?? this.underlineDecoration,
      containerBackground: containerBackground ?? this.containerBackground,
      transparent: transparent ?? this.transparent,
    );
  }

  @override
  ThemeExtension<AppColorTheme> lerp(
      covariant ThemeExtension<AppColorTheme> other,
      double t,
      ) {
    if (other is! AppColorTheme) {
      return this;
    } else {
      return AppColorTheme(
        baseColor: baseColor,
        gray: gray,
        hintText: hintText,
        blue: blue,
        white: white,
        black: black,
        icon: icon,
        underlineDecoration: underlineDecoration,
        containerBackground: containerBackground,
        transparent: transparent,
      );
    }
  }

  static const AppColorTheme dark = AppColorTheme(
    baseColor: DarkColors.baseColor,
    gray: DarkColors.gray,
    hintText: DarkColors.hintStyle,
    blue: DarkColors.blue,
    white: DarkColors.white,
    black: DarkColors.black,
    icon: DarkColors.iconsColor,
    underlineDecoration: DarkColors.decorationUnderLine,
    containerBackground: DarkColors.container,
    transparent: DarkColors.transparent,
  );

  static const AppColorTheme light = AppColorTheme(
    baseColor: LightColors.baseColor,
    gray: LightColors.gray,
    hintText: LightColors.hintStyle,
    blue: LightColors.blue,
    white: LightColors.white,
    black: LightColors.black,
    icon: LightColors.iconsColor,
    underlineDecoration: LightColors.decorationUnderLine,
    containerBackground: LightColors.container,
    transparent: LightColors.transparent,
  );
}
