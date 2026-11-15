import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';

class AppointmentDetails extends StatelessWidget {
  final String date;
  final String time;
  final String hospital;
  final String address;
  final VoidCallback onEdit;

  const AppointmentDetails({
    super.key,
    required this.date,
    required this.time,
    required this.hospital,
    required this.address,
    required this.onEdit,
  });

  Widget buildRow(
    IconData icon,
    String label,
    String value, [
    String? subtitle,
  ]) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: AppColors.lightGreenColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(icon, size: 20.sp, color: AppColors.primaryColor),
        ),

        SizedBox(width: 12.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppStyles.gray11Medium),

              SizedBox(height: 2.h),

              Text(value, style: AppStyles.black13SemiBold),

              if (subtitle != null) ...[
                SizedBox(height: 2.h),
                Text(subtitle, style: AppStyles.grayReg12),
              ],
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Appointment Details',
                  style: AppStyles.blackBold16,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              InkWell(
                onTap: onEdit,
                child: Row(
                  children: [
                    Icon(
                      Icons.edit_outlined,
                      size: 16.sp,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(width: 4.w),
                    Text('Edit', style: AppStyles.primaryReg12),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          buildRow(Icons.calendar_today_outlined, 'Date', date),

          SizedBox(height: 14.h),

          buildRow(Icons.access_time, 'Time', time),

          SizedBox(height: 14.h),

          buildRow(Icons.location_on_outlined, 'Location', hospital, address),
        ],
      ),
    );
  }
}