import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/app_colors.dart';
import 'package:grad_project/core/app_routes.dart';
import 'package:grad_project/core/app_styles.dart';
import 'package:grad_project/core/validator_helper.dart';
import 'package:grad_project/core/widgets/custom_elevated_button.dart';
import 'package:grad_project/features/auth/signin/custom_text_button.dart';
import 'package:grad_project/features/auth/widgets/custom_build_footer.dart';
import 'package:grad_project/features/auth/widgets/custom_text_form_field.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: .start,
              children: [
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
                SizedBox(height: 24.h),
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
                  alignment: .centerRight,
                  child: CustomTextButton(
                    title: 'Forgot Password?',
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 24.h),
                CustomElevatedButton(
                  title: 'Log In',
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;
                    Navigator.pushNamed(context, AppRoutes.home);
                  },
                ),
                SizedBox(height: 24.h),
                CustomBuildFooter(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.signUp);
                  },
                  title: 'Sign Up',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
