import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/features/home/data/models/category_container_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/spacing.dart';

class CustomContainerCategory extends StatelessWidget {
  const CustomContainerCategory({super.key, required this.model});

  final CategoryContainerModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(model.image, height: 56, width: 56),
              verticalSpacing(10.h),
              Text(
                model.title,
                style: MyFonts.styleRegular400_12
                    .copyWith(color: context.colors.iconsColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
