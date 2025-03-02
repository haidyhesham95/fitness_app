import 'package:fitness_app/core/networking/common/register_context_module.dart';
import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/extension/navigation.dart';
import 'package:fitness_app/core/utils/widgets/base/custom_glassy_container.dart';
import 'package:fitness_app/core/utils/widgets/custom_toast.dart';
import 'package:fitness_app/core/utils/widgets/spacing.dart';
import 'package:fitness_app/features/auth/presentation/forget_password/viewModel/forget_password_view_model_cubit.dart';
import 'package:fitness_app/features/auth/presentation/forget_password/widgets/custom_blur_bg.dart';
import 'package:fitness_app/features/auth/presentation/forget_password/widgets/custom_otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/localization/lang_keys.dart';
import '../../../../../core/routes/app_routes.dart';
import '../widgets/custom_confirm_button.dart';

class VerifyOtpView extends StatefulWidget {
  const VerifyOtpView({super.key});

  @override
  State<VerifyOtpView> createState() => _VerifyOtpViewState();
}

class _VerifyOtpViewState extends State<VerifyOtpView> {
  String otpCode = "";
  late final ForgetPasswordViewModelCubit viewModel;

  @override
  void initState() {
    viewModel = getIt<ForgetPasswordViewModelCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final args = ModalRoute.of(context)?.settings.arguments as ForgetPasswordRequestEntity;
    return CustomBlurBg(
        widget: CustomGlassyContainer(
          child: BlocProvider<ForgetPasswordViewModelCubit>(
              create: (_) => viewModel,
              child: BlocListener<ForgetPasswordViewModelCubit,
                  ForgetPasswordViewModelState>(
                listener: (context, state) {
                  switch (state) {
                    case verifyOtpLoading():
                      CustomToast.showLoadingToast(
                          message: context.translate(LangKeys.loading));
                      break;
                    case verifyOtpSuccess():
                      CustomToast.showSuccessToast(
                          message: context.translate(LangKeys.success));
                      context.pushNamed(AppRoutes.createPasswordView);
                      break;
                    case verifyOtpError():
                      CustomToast.showErrorToast(
                          message: state.errorMessage.error.toString());
                      break;
                    default:
                      null;
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomOtpTextField(onSubmit: (value) {
                      setState(() {
                        otpCode = value;
                      });
                    }),
                    verticalSpacing(28.h),
                    CustomConfirmButton(
                      otpCode: otpCode,
                      viewModel: viewModel,
                    ),
                    verticalSpacing(16.h),
                    Text(
                      context.translate(LangKeys.didNotReceiveVerificationCode),
                      style: MyFonts.styleRegular400_16
                          .copyWith(color: context.colors.white),
                    ),
                    verticalSpacing(4.h),
                    GestureDetector(
                      child: Text(
                        context.translate(LangKeys.resendCode),
                        style: MyFonts.styleSemiBold600_16
                            .copyWith(color: context.colors.baseColor),
                      ),
                    ),
                    verticalSpacing(24.h),
                  ],
                ),
              )),
        ),
        title: context.translate(LangKeys.otpCode),
        subTitle: context.translate(LangKeys.enterYourOtpCheckYourEmail));
  }
}
