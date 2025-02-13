import 'package:fitness_app/core/networking/common/regester_context_module.dart';
import 'package:fitness_app/features/auth/domain/entities/request/login_request_entity.dart';
import 'package:fitness_app/features/auth/presentation/login/viewModel/login_action.dart';
import 'package:fitness_app/features/auth/presentation/login/viewModel/login_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  LoginViewModel loginViewModel = getIt.get<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => loginViewModel,
        child: BlocListener<LoginViewModel, LoginViewModelState>(
          listener: (context, state) {
            if(state is LoginViewModelSuccess){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text('Login Successfullly')));
            }
          },
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
              ),
              SizedBox(height: 10.h,),
              TextFormField(
                controller: passwordController,
              ),
              SizedBox(height: 20,),
              MaterialButton(onPressed:(){
                loginViewModel.doAction(LoginAction(
                  LoginRequestEntity(
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                )
                );
              },
              child: Text('Login'),),
            ],
          ),
        ),
      ),
    );
  }
}
