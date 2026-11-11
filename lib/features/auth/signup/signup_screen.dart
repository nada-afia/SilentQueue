import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/app_colors.dart';
import 'package:grad_project/core/app_routes.dart';
import 'package:grad_project/core/validator_helper.dart';
import 'package:grad_project/core/widgets/custom_elevated_button.dart';
import 'package:grad_project/features/auth/widgets/custom_build_footer.dart';
import 'package:grad_project/features/auth/widgets/custom_text_form_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fullname = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        width: 266.w,
        height: 266.h,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            CustomTextFormField(
              controller: fullname,
              validator: ValidatorHelper.validateFullName,
              lable: "FullName",
              placeHolder: 'Sarah Hany',
              prefixIcon: Icon(Icons.person),
            ),
            CustomTextFormField(
              controller: email,
              validator: ValidatorHelper.validateEmail,
              lable: "Email Address",
              placeHolder: 'Sarah Hany@gmail.com',
              prefixIcon: Icon(Icons.email_outlined),
            ),
            CustomTextFormField(
              controller: password,
              lable: "Create Password",
              validator: ValidatorHelper.validatePassword,
              placeHolder: 'Sarah Hany@@123',
              prefixIcon: Icon(Icons.lock),
              isPassword: true,
            ),
            CustomTextFormField(
              controller: confirmPassword,
              validator: ValidatorHelper.validatePassword,
              lable: "Confirm Password",
              placeHolder: 'Sarah Hany@@123',
              prefixIcon: Icon(Icons.lock),
              isPassword: true,
            ),
            CustomElevatedButton(
              title: 'Create Patient Account',
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.home);
              },
            ),
            CustomBuildFooter(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.login);
              },
              title: 'Sign In',
              message: 'Already Have an account',
            ),
          ],
        ),
      ),
    );
  }
}
