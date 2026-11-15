import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';

class SuccessHeader extends StatelessWidget {
  const SuccessHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80.w,
          height: 80.w,
          decoration: const BoxDecoration(
            color: AppColors.greenColor,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check, size: 45.sp, color: AppColors.whiteColor),
        ),

        SizedBox(height: 16.h),

        Text('Booking Confirmed!', style: AppStyles.black18SemiBold),

        SizedBox(height: 8.h),

        Text(
          'Your appointment has been successfully booked. '
          'We\'ve sent a confirmation to your phone.',
          textAlign: TextAlign.center,
          style: AppStyles.grayReg12,
        ),
      ],
    );
  }
}