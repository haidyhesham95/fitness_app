import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/spacing.dart';
import '../../../../generated/assets.dart';
import 'custom_chip.dart';

class PopularTrainingWidget extends StatelessWidget {
  const PopularTrainingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      height: 176.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: SizedBox.expand(
              child: Image.asset(
                Assets.imagesPopularTrainer,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 120.h,
            left: 0,
            right: 0,
            child: FittedBox(
              alignment: Alignment.center,
              fit: BoxFit.scaleDown,
              child: Text(
                "Trainer Name",
                textAlign: TextAlign.center,
                style: MyFonts.styleSemiBold600_16.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 12.h,
            left: 16.w,
            right: 16.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: CustomChip(
                  text: '24 Tasks',
                  txtColor: context.colors.white,
                )),
                horizontalSpacing(8.w),
                Expanded(
                  child: CustomChip(
                    text: 'Beginners',
                    txtColor: context.colors.baseColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
