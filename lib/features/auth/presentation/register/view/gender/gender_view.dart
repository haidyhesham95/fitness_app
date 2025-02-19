import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/extension/navigation.dart';
import 'package:fitness_app/features/auth/presentation/register/view_model/signup_action.dart';
import 'package:fitness_app/features/auth/presentation/register/view_model/signup_view_model_cubit.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/localization/lang_keys.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/utils/enum/enum_gender.dart';
import '../../../../../../core/utils/widgets/base/custom_glassy_container.dart';
import '../../../../../../core/utils/widgets/buttons/custom_button.dart';
import '../../../../../../di/di.dart';
import '../../../forget_password/widgets/custom_blur_bg.dart';

class GenderView extends StatefulWidget {
  const GenderView({super.key});

  @override
  State<GenderView> createState() => _GenderViewState();
}

class _GenderViewState extends State<GenderView> {
  late final SignUpViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<SignUpViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBlurBg(
      value: "1/6",
      progress: 0,
      widget: Padding(
        padding: EdgeInsets.only(top: 8.0.h),
        child: CustomGlassyContainer(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 24.h),
            child: Column(
              spacing: 24.h,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      viewModel
                          .doAction(SelectGenderAction(gender: Gender.male));
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: viewModel.SelectedGender == Gender.male
                          ? context.colors.baseColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(95),
                    ),
                    child: SvgPicture.asset(Assets.imagesMale),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      viewModel
                          .doAction(SelectGenderAction(gender: Gender.female));
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: viewModel.SelectedGender == Gender.female
                          ? context.colors.baseColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(95),
                    ),
                    child: SvgPicture.asset(Assets.imagesFemale),
                  ),
                ),
                viewModel.SelectedGender != null
                    ? CustomButton(
                        txt: context.translate(LangKeys.next),
                        onPressed: viewModel.SelectedGender != null
                            ? () {
                                context.pushNamed(AppRoutes.oldView);
                              }
                            : null,
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
      title: context.translate(LangKeys.tellUsAboutYourself),
      subTitle: context.translate(LangKeys.weNeedToKnowYourGender),
      isGoalOrActivity: viewModel.SelectedGender != null ? true : false,
    );
  }
}
