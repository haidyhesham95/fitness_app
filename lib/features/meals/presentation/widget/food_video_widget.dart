import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/spacing.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FoodVideoWidget extends StatelessWidget {
  final String imageUrl, title, description;

  const FoodVideoWidget(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      child: Stack(
        children: [
          Image.network(imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: context.height * 0.4),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.6),
                  Colors.black.withValues(alpha: 0.6),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10.h,
            left: 10.w,
            right: 10.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5.h,
              children: [
                Center(
                  child:
                  InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(Assets.svgPlay, width: 50.w, height: 50.h)),
                ),
                verticalSpacing(10.h),
                Text(
                  title,
                  style: MyFonts.styleSemiBold600_24
                      .copyWith(color: context.colors.white),
                  maxLines: 1,
                ),
                Text(
                  description,
                  style: MyFonts.styleRegular400_16
                      .copyWith(color: context.colors.white),
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
