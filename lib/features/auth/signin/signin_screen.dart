import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/app_routes.dart';
import 'package:grad_project/core/dialog_helper.dart';
import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';
import 'package:grad_project/core/validator_helper.dart';
import 'package:grad_project/core/widgets/custom_elevated_button.dart';
import 'package:grad_project/features/auth/signin/cubit/signin_cubit.dart';
import 'package:grad_project/features/auth/signin/cubit/states.dart';
import 'package:grad_project/features/auth/widgets/custom_text_button.dart';
import 'package:grad_project/features/auth/signin/widgets/security_badge.dart';
import 'package:grad_project/features/auth/widgets/custom_build_footer.dart';
import 'package:grad_project/features/auth/widgets/custom_text_form_field.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 56.h),

                  SecurityBadge(),

                  Text('Welcome Back', style: AppStyles.blackBold28),

                  Text(
                    'Log in to manage appointments and live queue tickets',
                    style: AppStyles.grayReg14,
                  ),

                  SizedBox(height: 24.h),

                  CustomTextFormField(
                    validator: ValidatorHelper.validateEmail,
                    controller: emailController,
                    lable: 'Email Address or Phone Number',
                    placeHolder: 'name@example.com',
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: AppColors.blackColor,
                    ),
                  ),

                  SizedBox(height: 16.h),

                  CustomTextFormField(
                    controller: passwordController,
                    validator: ValidatorHelper.validatePassword,
                    lable: 'Password',
                    placeHolder: 'clinicCare#2024',
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: AppColors.blackColor,
                    ),
                    isPassword: true,
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomTextButton(
                      title: 'Forgot Password?',
                      onPressed: () {},
                    ),
                  ),

                  SizedBox(height: 24.h),
                  BlocListener<SigninCubit, SignInStates>(
                    listener: (context, state) {
                      if (state is SignInSuccessState) {
                        Navigator.pushNamed(context, AppRoutes.home);
                      }
                      if (state is SignInErrorState) {
                        DialogHelper.showError(context, state.errorMessage);
                      }
                    },
                    child: CustomElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<SigninCubit>().signIn(
                            emailController.text,
                            passwordController.text,
                          );
                        }
                      },
                      title: 'Log In',
                    ),
                  ),
                  SizedBox(height: 24.h),

                  CustomBuildFooter(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.signUp);
                    },
                    title: 'Sign Up',
                    message: "Don't have an account?",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
