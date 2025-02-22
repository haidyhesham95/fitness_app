import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/extension/navigation.dart';
import 'package:fitness_app/features/auth/presentation/register/view_model/signup_action.dart';
import 'package:fitness_app/features/auth/presentation/register/view_model/signup_view_model_cubit.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/localization/lang_keys.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/utils/widgets/base/custom_glassy_container.dart';
import '../../../../../../core/utils/widgets/buttons/custom_button.dart';
import '../../../forget_password/widgets/custom_blur_bg.dart';

class GenderView extends StatelessWidget {
  final SignUpViewModel viewModel;

  const GenderView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpViewModel, SignUpViewModelState>(
      bloc: viewModel,
      builder: (context, state) {
        return CustomBlurBg(
          value: "1/6",
          progress: 0,
          widget: Padding(
            padding: EdgeInsets.only(top: 8.0.h),
            child: CustomGlassyContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: Column(
                  spacing: 24.h,
                  children: [
                    GestureDetector(
                      onTap: () {
                        viewModel.doAction(SelectGenderAction(gender: "male"));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: viewModel.selectedGender == "male"
                              ? context.colors.baseColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(95),
                        ),
                        child: SvgPicture.asset(Assets.imagesMale),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        viewModel
                            .doAction(SelectGenderAction(gender: "female"));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: viewModel.selectedGender == "female"
                              ? context.colors.baseColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(95),
                        ),
                        child: SvgPicture.asset(Assets.imagesFemale),
                      ),
                    ),
                    if (viewModel.selectedGender.isNotEmpty)
                      CustomButton(
                        txt: context.translate(LangKeys.next),
                        onPressed: () {
                          context.pushNamed(
                            AppRoutes.healthDataPage,
                            arguments: viewModel,
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
          ),
          title: context.translate(LangKeys.tellUsAboutYourself),
          subTitle: context.translate(LangKeys.weNeedToKnowYourGender),
          isShow: viewModel.selectedGender.isNotEmpty ? true : false,
        );
      },
    );
  }
}
