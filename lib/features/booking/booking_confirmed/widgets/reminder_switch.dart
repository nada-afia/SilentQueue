import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';

class ReminderSwitch extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;

  const ReminderSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: AppColors.pinkColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(
              Icons.notifications_none,
              size: 20.sp,
              color: AppColors.brownColor,
            ),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Set Reminder', style: AppStyles.black13SemiBold),

                SizedBox(height: 2.h),

                Text(
                  'Get notified before your appointment',
                  style: AppStyles.gray11Medium,
                ),
              ],
            ),
          ),

          Switch(
            value: value,
            onChanged: onChanged,
            activeTrackColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}