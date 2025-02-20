import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/utils/widgets/base/custom_glassy_container.dart';
import '../../../../../../core/localization/lang_keys.dart';
import '../../../../../../core/styles/fonts/my_fonts.dart';
import '../../../../../../core/utils/widgets/buttons/custom_button.dart';
import '../../../forget_password/widgets/custom_blur_bg.dart';
import 'horizontal_picker.dart';

class HealthDataWidget extends StatelessWidget {
  final String value , title , text;
  final double? progress;
  final int  initialValue , minValue , maxValue;
   final ValueChanged<int> onSelected;
   final void Function() onPressed;

  const HealthDataWidget({
    super.key, required this.value, required this.initialValue, required this.minValue, required this.maxValue, required this.onSelected, required this.onPressed, this.progress, required this.title, required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return CustomBlurBg(
      value: value,
      progress: progress,
      widget: Padding(
        padding: EdgeInsets.only(top: 8.0.h),
        child: CustomGlassyContainer(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: Column(
              children: [
                Text(text,
                    style: MyFonts.styleRegular400_12.copyWith(
                      color: context.colors.baseColor,
                    )),
                SizedBox(height: 8.h),
                HorizontalPicker(
                  minValue: minValue,
                  maxValue: maxValue,
                  initialValue: initialValue,
                  onSelected: onSelected,
                ),
                Icon(Icons.arrow_drop_up,
                    color: context.colors.baseColor, size: 30),
                SizedBox(height: 8.h),
                CustomButton(
                  txt: context.translate(LangKeys.next),
                  onPressed:onPressed,
                ),
              ],
            ),
          ),
        ),
      ),
      title: title,
      subTitle:
          context.translate(LangKeys.thisHelpsUsCreateYourPersonalizedPlan),
      isShow: true,
    );
  }
}

