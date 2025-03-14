import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/spacing.dart';
import 'package:fitness_app/features/exercises/presentation/widget/cached_network_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/localization/lang_keys.dart';
import '../../../meals/presentation/widget/pinned_sliver_widget.dart';
import 'border_container_widget.dart';
import 'icon_video_widget.dart';

class ExerciseDetails extends StatelessWidget {
  final String imageUrl, title;

  const ExerciseDetails({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinnedSliverWidget(
      height: context.height * 0.4,
      child: Stack(
        children: [
          CachedNetworkWidget(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: context.height * 0.4,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withValues(alpha: .9),
                  context.colors.transparent,
                  context.colors.transparent,
                ],
              ),
            ),
          ),
          _buildImageInfo(context),
        ],
      ),
    );
  }

  Widget _buildImageInfo(BuildContext context) {
    return Positioned(
      bottom: 10.h,
      left: 10.w,
      right: 10.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: MyFonts.styleMedium500_24
                    .copyWith(color: context.colors.white),
              ),
              IconVideoWidget(
                onPressed: () {},
              ),
            ],
          ),
          verticalSpacing(8.h),
          Text(
            context.translate(LangKeys.exercisesDescription),
            style: MyFonts.styleRegular400_16
                .copyWith(color: context.colors.white),
          ),
          verticalSpacing(8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BorderContainerWidget(
                text: context.translate(LangKeys.thirtyMinutes),
              ),
              BorderContainerWidget(
                  text: context.translate(LangKeys.cal),
                  style: MyFonts.styleBold700_12
                      .copyWith(color: context.colors.baseColor)),
            ],
          )
        ],
      ),
    );
  }
}
