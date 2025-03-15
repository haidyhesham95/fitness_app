import 'package:animate_do/animate_do.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/localization/lang_keys.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/spacing.dart';
import '../../../../generated/assets.dart';
import '../models/category_container_model.dart';
import 'custom_container_category.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CategoryContainerModel> items = [
      CategoryContainerModel(
        image: Assets.imagesGymH,
        title: context.translate(LangKeys.gym),
      ),
      CategoryContainerModel(
        image: Assets.imagesFitnessH,
        title: context.translate(LangKeys.fitness),
      ),
      CategoryContainerModel(
        image: Assets.imagesYogaH,
        title: context.translate(LangKeys.yoga),
      ),
      CategoryContainerModel(
        image: Assets.imagesAerobicsH,
        title: context.translate(LangKeys.aerobics),
      ),
      CategoryContainerModel(
        image: Assets.imagesTrainerH,
        title: context.translate(LangKeys.trainer),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpacing(24.h),
          Text(
            context.translate(LangKeys.categories),
            style: MyFonts.styleSemiBold600_16
                .copyWith(color: context.colors.white),
          ),
          verticalSpacing(7.h),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: context.colors.darkGray,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: SizedBox(
              height: 116.h,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) => FadeInRight(
                  child: CustomContainerCategory(model: items[index]),
                ),
                separatorBuilder: (context, index) => VerticalDivider(
                  endIndent: 20,
                  indent: 20,
                  color: context.colors.gray,
                ),
              ),
            ),
          ),
          verticalSpacing(24.h),
        ],
      ),
    );
  }
}
