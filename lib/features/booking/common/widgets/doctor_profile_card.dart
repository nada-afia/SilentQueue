import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';
import 'package:grad_project/features/home/models/doctor_model.dart';

class DoctorProfileCard extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorProfileCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          Container(
            width: 75.w,
            height: 75.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(doctor.initials, style: AppStyles.white24SemiBold),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor.name,
                  style: AppStyles.blackBold16,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 4.h),

                Text(doctor.specialty, style: AppStyles.primaryReg12),

                SizedBox(height: 6.h),

                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 16.sp),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        '${doctor.rating} (${doctor.reviewsCount} reviews)',
                        style: AppStyles.gray11Medium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 4.h),

                Text(
                  doctor.clinic,
                  style: AppStyles.gray11Medium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}