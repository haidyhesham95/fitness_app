import 'package:fitness_app/core/styles/colors/my_colors.dart';
import 'package:fitness_app/core/utils/extension/media_query_values.dart';
import 'package:fitness_app/core/utils/validators.dart';
import 'package:fitness_app/core/utils/widgets/buttons/custom_button.dart';
import 'package:fitness_app/core/utils/widgets/custom_glassy_container.dart';
import 'package:fitness_app/core/utils/widgets/custom_text_form_feild.dart';
import 'package:fitness_app/features/auth/domain/entities/request/reset_password_request_entity.dart';
import 'package:fitness_app/features/auth/presentation/forget_password/viewModel/forget_password_actions.dart';
import 'package:fitness_app/features/auth/presentation/forget_password/widgets/custom_blur_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/localization/lang_keys.dart';
import '../../../../../core/networking/common/regester_context_module.dart';
import '../../../../../core/utils/widgets/custom_toast.dart';
import '../viewModel/forget_password_view_model_cubit.dart';

class CreatePasswordView extends StatefulWidget {
  const CreatePasswordView({super.key});

  @override
  State<CreatePasswordView> createState() => _CreatePasswordViewState();
}

class _CreatePasswordViewState extends State<CreatePasswordView> {
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _passwordController;
  late final TextEditingController _emailController;
  late final ForgetPasswordViewModelCubit viewModel;

  @override
  void initState() {
    _passwordController = TextEditingController();
    _emailController = TextEditingController();
    viewModel = getIt<ForgetPasswordViewModelCubit>();
    super.initState();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomBlurBg(
        widget: CustomGlassyContainer(
            child: Padding(
          padding: EdgeInsets.all(24.0.h),
          child: BlocProvider(
            create: (_) => viewModel,
            child: BlocListener<ForgetPasswordViewModelCubit,
                ForgetPasswordViewModelState>(
              listener: (context, state) {
                switch (state) {
                  case resetPasswordLoading():
                    CustomToast.showLoadingToast(
                        message: context.translate(LangKeys.loading));
                    break;
                  case resetPasswordSuccess():
                    CustomToast.showSuccessToast(
                        message: context.translate(LangKeys.success));
                    break;
                  case resetPasswordError():
                    CustomToast.showErrorToast(
                        message: state.errorMessage.error.toString());
                    break;
                  default:
                    null;
                }
              },
              child: Form(
                key: _formKey,
                child: Column(
                  spacing: 30.h,
                  children: [
                    CustomTextFormField(
                      controller: _emailController,
                      hintTxt: context.translate(LangKeys.email),
                      validator: (value) {
                        return Validators.validateEmail(value, context);
                      },
                      icon: Icons.email_outlined,
                    ),
                    CustomTextFormField(
                      controller: _passwordController,
                      hintTxt: context.translate(LangKeys.password),
                      validator: (value) {
                        return Validators.validatePassword(value, context);
                      },
                      icon: Icons.lock_outline,
                      isPassword: !_isPasswordVisible,
                      suffixIcon: GestureDetector(
                        onTap: _togglePasswordVisibility,
                        child: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: MyColors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    CustomButton(
                      txt: context.translate(LangKeys.done),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          viewModel.doAction(ResetPasswordSubmit(
                              ResetPasswordRequestEntity(
                                  email: _emailController.text.trim(),
                                  newPassword:
                                      _passwordController.text.trim())));
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        )),
        title: context.translate(LangKeys.makeSureItsCharactersOrMore),
        subTitle: context.translate(LangKeys.createNewPassword));
  }
}
