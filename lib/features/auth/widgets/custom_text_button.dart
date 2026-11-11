import 'package:flutter/material.dart';
import 'package:grad_project/core/style/app_styles.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(title, style: AppStyles.primaryBold12),
    );
  }
}
