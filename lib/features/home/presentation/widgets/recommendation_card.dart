import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../generated/assets.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104.h,
      width: 104.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox.expand(
              child: Image.asset(
                Assets.imagesJogging,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: context.colors.darkGray.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Jogging",
                  style: MyFonts.styleSemiBold600_16
                      .copyWith(color: context.colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
