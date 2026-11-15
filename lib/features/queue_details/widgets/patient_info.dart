import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';

class PatientInfo extends StatelessWidget {
  const PatientInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      margin: EdgeInsets.all(16),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Patient Name", style: AppStyles.gray11Medium),
                Text("Your Name", style: AppStyles.black13SemiBold),
              ],
            ),
            VerticalDivider(color: AppColors.lightGreenColor, thickness: 1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Queue Number", style: AppStyles.gray11Medium),
                Text("8", style: AppStyles.primary13SemiBold),
              ],
            ),
            VerticalDivider(color: AppColors.lightGreenColor, thickness: 1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Reservation Date", style: AppStyles.gray11Medium),
                Text("Sun 8, Nov 26", style: AppStyles.black13SemiBold),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
