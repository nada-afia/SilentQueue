import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool showArrow;
  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                title,
                style: AppStyles.whiteSemiBold14,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
        if (showArrow)
          Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Icon(Icons.arrow_forward, color: AppColors.whiteColor),
          ),
          ],
        ),
      ),
    );
  }
}
