import 'package:flutter/material.dart';
import 'package:grad_project/core/app_styles.dart';
import 'package:grad_project/features/auth/signin/custom_text_button.dart';

class CustomBuildFooter extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const CustomBuildFooter({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        Text("Don't have an account?", style: AppStyles.grayReg14),
        CustomTextButton(onPressed: onPressed, title: title),
      ],
    );
  }
}
