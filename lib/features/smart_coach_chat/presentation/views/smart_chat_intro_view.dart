import 'package:fitness_app/core/localization/lang_keys.dart';
import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/base/base_view.dart';
import 'package:fitness_app/core/utils/widgets/base/custom_glassy_container.dart';
import 'package:fitness_app/core/utils/widgets/buttons/custom_button.dart';
import 'package:fitness_app/core/utils/widgets/spacing.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SmartChatIntroView extends StatelessWidget {
  const SmartChatIntroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        image: Assets.imagesChatBg,
        isArrowBackShow: true,
        actions: [
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(Assets.svgMenu, width: 24.w, height: 24.h),
          ),
        ],
        title: '${context.translate(LangKeys.hi)} Ahmed ,',
        subTitle: context.translate(LangKeys.smartCoach),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.w),
          child: Column(
            children: [
              verticalSpacing(25),
              Image.asset(Assets.imagesRobotWithRope,
                  height: context.height * .5),
              const Spacer(),
              CustomGlassyContainer(
                blur: 32,
                borderRadius: BorderRadius.circular(60),
                child: Padding(
                  padding:  EdgeInsets.all(32.sp),
                  child: Column(
                    spacing: 16.sp,
                      children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 30.w,),
                      child: Text(
                        context.translate(LangKeys.assistToday),
                        textAlign: TextAlign.center,
                        style: MyFonts.styleExtraBold800_24.copyWith(
                            color: context.colors.white),
                      ),
                    ),
                    CustomButton(
                      onPressed: (){},
                      txt:context.translate(LangKeys.getStarted),
                    ),

                  ]),
                ),
              ),
              verticalSpacing(42),
            ],
          ),
        ));
  }
}
