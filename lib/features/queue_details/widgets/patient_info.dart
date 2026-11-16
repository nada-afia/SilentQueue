import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';
import 'package:grad_project/features/queue_details/models/appointment_model.dart';
import 'package:intl/intl.dart';

class PatientInfo extends StatelessWidget {
  final AppointmentModel appointment;
  final String patientName;

  const PatientInfo({
    super.key,
    required this.appointment,
    required this.patientName,
  });

  @override
  Widget build(BuildContext context) {
    final dateText = appointment.date != null
        ? DateFormat('MMM dd, yyyy').format(appointment.date!.toDate())
        : '--';

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
                Text(patientName, style: AppStyles.black13SemiBold),
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
                Text(
                  dateText,
                  style: AppStyles.black13SemiBold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
