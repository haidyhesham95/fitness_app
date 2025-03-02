import 'package:animate_do/animate_do.dart';
import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/base/custom_glassy_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoardingPage extends StatelessWidget {
  final String title,image , description;
  final int index, currentIndex;

  const BoardingPage({
    Key? key,
    required this.title,
    required this.image,
    required this.index,
    required this.description,
    required this.currentIndex,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.transparent,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            bottom: 40.h,
            child: FadeInDown(
              duration: const Duration(milliseconds: 700),
              child: Image.asset(image, height: context.height * .5),
            ),
          ),
          Positioned(
            height: context.height * .30,
            bottom: 0,
            right: 0,
            left: 0,
            child: CustomGlassyContainer(
              height: context.height * .3,
              blur: 12.5,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 10.0.h,horizontal: 15.h),
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10.w),
                      child: FadeInUp(
                        duration: const Duration(milliseconds: 700),
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style:
                              MyFonts.styleBold700_24.copyWith(color: context.colors.white),
                        ),
                      ),
                    ),
                    FadeInDown(
                      duration: const Duration(milliseconds: 700),
                      child: Text(
                        description,
                        textAlign: TextAlign.center,
                        style:
                            MyFonts.styleRegular400_16.copyWith(color: context.colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
