import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../generated/assets.dart';
import '../../../localization/lang_keys.dart';
import '../../../styles/fonts/my_fonts.dart';

class AppLoader extends StatefulWidget {
  const AppLoader({super.key});

  @override
  AppLoaderState createState() => AppLoaderState();
}

class AppLoaderState extends State<AppLoader> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.transparent,
      height: 140.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            Assets.jsonFitnessLoader,
            height: 80.sp,
            alignment: Alignment.center,
            fit: BoxFit.scaleDown,
            options: LottieOptions(
              enableApplyingOpacityToLayers: true
            )
          ),
          SizedBox(
            height: 40.h,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  WavyAnimatedText(
                    speed: const Duration(milliseconds: 200 ),
                    (context.translate(LangKeys.appName)),
                    textStyle: MyFonts.styleBold700_24.copyWith(
                      fontFamily: 'Baloo Thambi 2',
                      color: context.colors.baseColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
