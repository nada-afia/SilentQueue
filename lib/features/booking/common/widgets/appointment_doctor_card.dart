import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';
import 'package:grad_project/core/widgets/doctor_avatar.dart';

class AppointmentDoctorCard extends StatelessWidget {
  final String imageUrl;
  final String initials;
  final String name;
  final String specialty;
  final String hospital;

  const AppointmentDoctorCard({
    super.key,
    required this.imageUrl,
    required this.initials,
    required this.name,
    required this.specialty,
    required this.hospital,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DoctorAvatar(
          imageUrl: imageUrl,
          initials: initials,
          size: 55.w,
          radius: 12.r,
        ),

        SizedBox(width: 12.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppStyles.blackBold16,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              SizedBox(height: 4.h),

              Text(specialty, style: AppStyles.primaryReg12),

              SizedBox(height: 4.h),

              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 14.sp,
                    color: AppColors.lightGrayColor,
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Text(
                      hospital,
                      style: AppStyles.gray11Medium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}