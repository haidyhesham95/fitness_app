import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';

import '../../../../../core/localization/lang_keys.dart';
import '../../../../../core/utils/widgets/buttons/custom_button.dart';
import '../../../../../core/utils/widgets/custom_toast.dart';
import '../../../domain/entities/request/verify_otp_request_enity.dart';
import '../viewModel/forget_password_actions.dart';
import '../viewModel/forget_password_view_model_cubit.dart';

class CustomConfirmButton extends StatelessWidget {
  const CustomConfirmButton(
      {super.key, required this.otpCode, required this.viewModel});

  final String otpCode;
  final ForgetPasswordViewModelCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: CustomButton(
        txt: context.translate(LangKeys.confirm),
        onPressed: () {
          otpCode.isNotEmpty != ""
              ? viewModel.doAction(
                  VerifyOtpSubmit(VerifyOtpRequestEntity(resetCode: otpCode)))
              : CustomToast.showErrorToast(
                  message: context.translate(LangKeys.enterOtp));
        },
      ),
    );
  }
}
