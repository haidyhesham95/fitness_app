import 'package:fitness_app/core/localization/lang_keys.dart';
import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget appBar(BuildContext context) {
  return AppBar(
    title: Row(
      children: [
        SvgPicture.asset(
          Assets.svgBack,
          width: 24.w,
          height: 24.h,
        ),
        SizedBox(width: 112.w,),
        Text(
          context.translate(LangKeys.editProfile),
          style: MyFonts.styleSemiBold600_24.copyWith(
            color: context.colors.white,
          ),
        ),
      ],
    ),
  );
}
