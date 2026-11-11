import 'package:flutter/material.dart';
import 'package:grad_project/core/app_colors.dart';
import 'package:grad_project/core/app_styles.dart';

class BackToHome extends StatelessWidget {
  const BackToHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {},
        child: Text(
          "Back to Home",
          style: AppStyles.white24SemiBold.copyWith(fontSize: 15),
        ),
      ),
    );
  }
}
