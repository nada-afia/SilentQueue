import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';

class DoctorStats extends StatelessWidget {
  final String patients;
  final String experience;
  final String distance;

  const DoctorStats({
    super.key,
    required this.patients,
    required this.experience,
    required this.distance,
  });

  Widget buildItem(IconData icon, String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: const BoxDecoration(
              color: AppColors.lightGreenColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 18.sp, color: AppColors.primaryColor),
          ),

          SizedBox(height: 6.h),

          Text(
            value,
            style: AppStyles.blackBold16,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          SizedBox(height: 2.h),

          Text(label, style: AppStyles.gray11Medium),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          buildItem(Icons.groups_outlined, patients, 'Patients'),
          buildItem(Icons.workspace_premium_outlined, experience, 'Experience'),
          buildItem(Icons.location_on_outlined, distance, 'Distance'),
        ],
      ),
    );
  }
}