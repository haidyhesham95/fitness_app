import 'package:fitness_app/core/styles/colors/dark_color.dart';
import 'package:fitness_app/core/styles/colors/light_color.dart';
import 'package:flutter/material.dart';

class AppColorTheme extends ThemeExtension<AppColorTheme> {
  const AppColorTheme({
    required this.baseColor,
    required this.gray,
    required this.hintText,
    required this.blue,
    required this.white,
    required this.black,
    required this.iconsColor,
    required this.underlineDecoration,
    required this.containerColor,
    required this.transparent,
    required this.red,
  });

  final Color baseColor;
  final Color gray;
  final Color hintText;
  final Color blue;
  final Color white;
  final Color black;
  final Color iconsColor;
  final Color underlineDecoration;
  final Color containerColor;
  final Color transparent;
  final Color red;

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
    Color? red,
  }) {
    return AppColorTheme(
      baseColor: baseColor ?? this.baseColor,
      gray: gray ?? this.gray,
      hintText: hintText ?? this.hintText,
      blue: blue ?? this.blue,
      white: white ?? this.white,
      black: black ?? this.black,
      iconsColor: icon ?? this.iconsColor,
      underlineDecoration: underlineDecoration ?? this.underlineDecoration,
      containerColor: containerBackground ?? this.containerColor,
      transparent: transparent ?? this.transparent,
      red: red ?? this.red,
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
        iconsColor: iconsColor,
        underlineDecoration: underlineDecoration,
        containerColor: containerColor,
        transparent: transparent,
        red: red,
      );
    }
  }

  static const AppColorTheme dark = AppColorTheme(
    baseColor: DarkColor.baseColor,
    gray: DarkColor.gray,
    hintText: DarkColor.hintStyle,
    blue: DarkColor.blue,
    white: DarkColor.white,
    black: DarkColor.black,
    iconsColor: DarkColor.iconsColor,
    underlineDecoration: DarkColor.decorationUnderLine,
    containerColor: DarkColor.container,
    transparent: DarkColor.transparent,
    red: DarkColor.red,
  );

  static const AppColorTheme light = AppColorTheme(
    baseColor: LightColor.baseColor,
    gray: LightColor.gray,
    hintText: LightColor.hintStyle,
    blue: LightColor.blue,
    white: LightColor.white,
    black: LightColor.black,
    iconsColor: LightColor.iconsColor,
    underlineDecoration: LightColor.decorationUnderLine,
    containerColor: LightColor.container,
    transparent: LightColor.transparent,
    red: LightColor.red,
  );
}
