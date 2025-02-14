import 'package:fitness_app/core/networking/common/regester_context_module.dart';
import 'package:fitness_app/core/utils/validators.dart';
import 'package:fitness_app/core/utils/widgets/custom_toast.dart';
import 'package:fitness_app/features/auth/domain/entities/request/forget_password_request_entity.dart';
import 'package:fitness_app/features/auth/presentation/forget_password/viewModel/forget_password_actions.dart';
import 'package:fitness_app/features/auth/presentation/forget_password/viewModel/forget_password_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/widgets/buttons/custom_button.dart';
import '../../../../../core/utils/widgets/custom_glassy_container.dart';
import '../../../../../core/utils/widgets/custom_text_form_feild.dart';
import '../widgets/custom_blur_bg.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final ForgetPasswordViewModelCubit viewModel;

  @override
  void initState() {
    emailController = TextEditingController();
    viewModel = getIt<ForgetPasswordViewModelCubit>();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBlurBg(
      title: 'Enter Your Email',
      subTitle: 'Forget password',
      widget: Padding(
        padding: const EdgeInsets.all(8),
        child: CustomGlassyContainer(
          child: BlocProvider<ForgetPasswordViewModelCubit>(
            create: (context) => viewModel,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: BlocListener<ForgetPasswordViewModelCubit,
                  ForgetPasswordViewModelState>(
                listener: (context, state) {
                  switch (state) {
                    case ForgetPasswordViewModelLoading():
                      CustomToast.showLoadingToast(message: 'Loading...');
                      break;
                    case ForgetPasswordViewModelSuccess():
                      CustomToast.showSuccessToast(message: 'Success');
                      break;
                    case ForgetPasswordViewModelError():
                      CustomToast.showErrorToast(
                          message: state.errorMessage.error.toString());
                      break;
                    default:
                      break;
                  }
                },
                child: Form(
                  key: formKey,
                  child: Column(
                    spacing: 16.h,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextFormField(
                        controller: emailController,
                        validator: (value) {
                          return Validators.validateEmail(value, context);
                        },
                        icon: Icons.email_outlined,
                        hintTxt: 'Email',
                      ),
                      BlocBuilder<ForgetPasswordViewModelCubit,
                          ForgetPasswordViewModelState>(
                        builder: (context, state) {
                          return CustomButton(
                            txt: 'Sent OTP',
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                viewModel.doAction(ForgetPasswordSubmit(
                                    ForgetPasswordRequestEntity(
                                        email: emailController.text.trim())));
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
