import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/features/home/domain/entities/response/popular_training_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/fonts/my_fonts.dart';
import 'custom_chip.dart';

class PopularTrainingWidget extends StatelessWidget {
  const PopularTrainingWidget({super.key, required this.popularTrainingItems, required this.onTapItem});
  final void Function() onTapItem;

  final PopularTrainingEntity popularTrainingItems;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapItem,
      child: Container(
        width: 200.w,
        height: 176.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withValues(alpha: 0.9),
              Colors.black.withValues(alpha: 0.7),
              Colors.black.withValues(alpha: 0.6),
              Colors.black.withValues(alpha: 0.4),
              Colors.transparent
            ],
          ),

        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: SizedBox.expand(
                child: Image.asset(
                  popularTrainingItems.image ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.7),
                    Colors.black.withValues(alpha: 0.7),
                    Colors.black.withValues(alpha: 0.6),
                    Colors.black.withValues(alpha: 0.4),
                    Colors.transparent,
                    Colors.transparent,
                  ],
                ),

              ),
            )),
            Positioned(
              bottom: 90.h,
              left: 0,
              right: 0,
              child: Text(
                popularTrainingItems.muscleName ?? "",
                textAlign: TextAlign.center,
                style: MyFonts.styleSemiBold600_16.copyWith(
                  color: Colors.white,
                ),
              ),
            ),


            Positioned(
              bottom: 12.h,
              left: 16.w,
              right: 16.w,
              child: CustomChip(
                text: popularTrainingItems.levelName.toString() ,
                txtColor: context.colors.baseColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
