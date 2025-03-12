import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/spacing.dart';
import 'recommendation_card.dart';

class RecommendationSection extends StatelessWidget {
  final String title;
  final List? data;
  final bool showSeeAll;

  const RecommendationSection({
    Key? key,
    required this.title,
    this.showSeeAll = false, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: MyFonts.styleSemiBold600_16
                    .copyWith(color: context.colors.white),
              ),
              if (showSeeAll)
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "See All",
                    style: MyFonts.styleSemiBold600_14
                        .copyWith(color: context.colors.baseColor),
                  ),
                ),
            ],
          ),
          verticalSpacing(8.h),
          SizedBox(
            height: 104.h,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: data?.length ?? 0,
              itemBuilder: (context, index) {
                return RecommendationCard(
                  data: data![index],
                );
              },
              separatorBuilder: (context, index) => horizontalSpacing(16),
            ),
          ),
        ],
      ),
    );
  }
}
