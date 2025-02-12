import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fitness_app/core/utils/extension/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../generated/assets.dart';
import '../../../localization/lang_keys.dart';
import '../../../styles/colors/my_colors.dart';
import '../../../styles/fonts/my_fonts.dart';
import '../spacing.dart';

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
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              Assets.imagesFloweryLoader,
              height: 80.sp,
              alignment: Alignment.bottomCenter,
              fit: BoxFit.scaleDown,
            ),
            verticalSpacing(15),
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  ScaleAnimatedText(
                    (context.translate(LangKeys.appName)),
                    textStyle: MyFonts.styleBold700_24.copyWith(
                      fontFamily: 'Baloo Thambi 2',
                      color: MyColors.baseColor,
                    ),
                    scalingFactor: 1.5,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
