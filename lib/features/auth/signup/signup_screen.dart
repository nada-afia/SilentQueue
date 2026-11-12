import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/app_routes.dart';
import 'package:grad_project/core/dialog_helper.dart';
import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/validator_helper.dart';
import 'package:grad_project/core/widgets/custom_elevated_button.dart';
import 'package:grad_project/features/auth/signup/cubit/signup_cubit.dart';
import 'package:grad_project/features/auth/signup/cubit/states.dart';
import 'package:grad_project/features/auth/widgets/custom_build_footer.dart';
import 'package:grad_project/features/auth/widgets/custom_text_form_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassword = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextFormField(
                      controller: fullNameController,
                      validator: ValidatorHelper.validateFullName,
                      lable: 'Full Name',
                      placeHolder: 'Sarah Hany',
                      prefixIcon: const Icon(Icons.person),
                    ),
                    SizedBox(height: 14.h),
                    CustomTextFormField(
                      controller: emailController,
                      validator: ValidatorHelper.validateEmail,
                      lable: 'Email Address',
                      placeHolder: 'sarah.hany@gmail.com',
                      prefixIcon: const Icon(Icons.email_outlined),
                    ),
                    SizedBox(height: 14.h),
                    CustomTextFormField(
                      controller: passwordController,
                      validator: ValidatorHelper.validatePassword,
                      lable: 'Create Password',
                      placeHolder: '********',
                      prefixIcon: const Icon(Icons.lock),
                      isPassword: true,
                    ),
                    SizedBox(height: 14.h),
                    CustomTextFormField(
                      controller: confirmPassword,
                      validator: (v) => ValidatorHelper.validateConfirmPassword(
                        v,
                        passwordController.text,
                      ),
                      lable: 'Confirm Password',
                      placeHolder: '********',
                      prefixIcon: const Icon(Icons.lock),
                      isPassword: true,
                    ),
                    SizedBox(height: 24.h),
                    BlocListener<SignupCubit, SignUpStates>(
                      listener: (context, state) {
                        if (state is SignUpSuccessState) {
                          DialogHelper.showSuccess(
                            context,
                            'Your account has been created successfully. Please log in.',
                            onOk: () => Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.login,
                            ),
                          );
                        }
                        if (state is SignUpErrorState) {
                          DialogHelper.showError(context, state.errorMessage);
                        }
                      },
                      child: CustomElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<SignupCubit>().signUp(
                              emailController.text,
                              passwordController.text,
                              fullNameController.text,
                            );
                          }
                        },
                        title: 'Create Patient Account',
                      ),
                    ),
                    SizedBox(height: 12.h),
                    CustomBuildFooter(
                      onPressed: () =>
                          Navigator.pushNamed(context, AppRoutes.login),
                      title: 'Sign In',
                      message: 'Already have an account?',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
