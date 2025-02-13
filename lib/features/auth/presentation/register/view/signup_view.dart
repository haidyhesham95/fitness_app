import 'package:fitness_app/core/networking/common/regester_context_module.dart';
import 'package:fitness_app/features/auth/presentation/register/view_model/signup_action.dart';
import 'package:fitness_app/features/auth/presentation/register/view_model/signup_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  SignUpViewModel loginViewModel = getIt.get<SignUpViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => loginViewModel,
        child: BlocListener<SignUpViewModel, SignUpViewModelState>(
          listener: (context, state) {
            if(state is SignupSuccess){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text('Register Successfullly')));
            }
          },
          child: Form(
            key: loginViewModel.signUpFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: loginViewModel.firstNameController,
                ),
                SizedBox(height: 10.h,),
                TextFormField(
                  controller: loginViewModel.lastNameController,
                ),
                SizedBox(height: 10.h,),
                TextFormField(
                  controller: loginViewModel.emailController,
                ),
                SizedBox(height: 10.h,),
                TextFormField(
                  controller: loginViewModel.passwordController,
                ),
                SizedBox(height: 20,),
                MaterialButton(onPressed:(){
                  print('Passsss ${loginViewModel.passwordController.text}');
                    loginViewModel.doAction(SignupActionSelected());
                },
                  child: Text('SignUp'),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
