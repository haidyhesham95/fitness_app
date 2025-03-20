import 'package:animate_do/animate_do.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/features/home/domain/entities/response/popular_training_entity.dart';
import 'package:fitness_app/features/home/presentation/widgets/popular_training_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/spacing.dart';

class PopularTrainingSection extends StatelessWidget {
  const PopularTrainingSection({super.key, required this.popularTrainingItems});

  final List<PopularTrainingEntity> popularTrainingItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "popular training",
            style: MyFonts.styleSemiBold600_16
                .copyWith(color: context.colors.white),
          ),
          verticalSpacing(8.h),
          SizedBox(
            height: 250.h,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return FadeInRight(
                      child: PopularTrainingWidget(
                    popularTrainingItems: popularTrainingItems[index],
                  ));
                },
                separatorBuilder: (context, index) => horizontalSpacing(16.h),
                itemCount: popularTrainingItems.length ),
          ),
          verticalSpacing(80)
        ],
      ),
    );
  }
}
