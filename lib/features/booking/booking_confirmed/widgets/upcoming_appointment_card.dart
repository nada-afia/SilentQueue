import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';
import 'package:grad_project/features/booking/common/widgets/appointment_doctor_card.dart';

class UpcomingAppointmentCard extends StatelessWidget {
  final String bookingId;
  final String imageUrl;
  final String initials;
  final String doctorName;
  final String specialty;
  final String hospital;
  final String date;
  final String time;

  const UpcomingAppointmentCard({
    super.key,
    required this.bookingId,
    required this.imageUrl,
    required this.initials,
    required this.doctorName,
    required this.specialty,
    required this.hospital,
    required this.date,
    required this.time,
  });

  Widget buildInfoBox(IconData icon, String label, String value) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18.sp, color: AppColors.primaryColor),

          SizedBox(width: 8.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppStyles.gray11Medium),

                SizedBox(height: 2.h),

                Text(
                  value,
                  style: AppStyles.black13SemiBold,
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
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 4.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.lightGreenColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  'Upcoming Appointment',
                  style: AppStyles.primaryReg12,
                ),
              ),

              SizedBox(width: 8.w),

              Expanded(
                child: Text(
                  'Booking #$bookingId',
                  textAlign: TextAlign.end,
                  style: AppStyles.gray11Medium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          AppointmentDoctorCard(
            imageUrl: imageUrl,
            initials: initials,
            name: doctorName,
            specialty: specialty,
            hospital: hospital,
          ),

          SizedBox(height: 16.h),

          Row(
            children: [
              Expanded(
                child: buildInfoBox(
                  Icons.calendar_today_outlined,
                  'Date',
                  date,
                ),
              ),

              SizedBox(width: 10.w),

              Expanded(
                child: buildInfoBox(Icons.access_time, 'Time', time),
              ),
            ],
          ),
        ],
      ),
    );
  }
}