import 'package:flutter/material.dart';
import 'package:grad_project/core/style/app_styles.dart';
import 'package:grad_project/features/auth/widgets/custom_text_button.dart';

class CustomBuildFooter extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final String message;
  const CustomBuildFooter({
    super.key,
    required this.onPressed,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        Text(message, style: AppStyles.grayReg14),
        CustomTextButton(onPressed: onPressed, title: title),
      ],
    );
  }
}
