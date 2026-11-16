import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';

class QrHeader extends StatelessWidget {
  const QrHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGreenColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      padding: EdgeInsets.all(8.w),
      margin: EdgeInsets.all(16.w),
      child: Row(
        children: [
          Icon(Icons.info_rounded, color: AppColors.primaryColor),
          SizedBox(width: 7.w),
          Text(
            "Show this QR code at the clinic desk when your name"
            "\nis called.",
            style: AppStyles.primaryReg12,
          ),
        ],
      ),
    );
  }
}
