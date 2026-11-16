import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/app_routes.dart';
import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';
import 'package:grad_project/features/appointments/cubit/previous_appointments_cubit.dart';
import 'package:grad_project/features/appointments/widgets/queue_button.dart';
import 'package:grad_project/features/queue_details/models/appointment_model.dart';
import 'package:intl/intl.dart';

class ActiveAppointmentCard extends StatelessWidget {
  final AppointmentModel appointment;

  const ActiveAppointmentCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    final date = appointment.date?.toDate();
    final now = DateTime.now();
    final isToday =
        date != null &&
        date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;

    final dayText = date == null
        ? '--'
        : isToday
        ? 'Today'
        : DateFormat('MMM dd').format(date);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: Column(
          children: [
            Container(height: 8.h, color: AppColors.primaryColor),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.medical_services_outlined,
                        color: AppColors.primaryColor,
                        size: 20,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        appointment.clinic ?? '',
                        style: AppStyles.black13SemiBold,
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        decoration: BoxDecoration(
                          color: AppColors.placeholderColor,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Text(
                          appointment.status ?? '',
                          style: TextStyle(
                            color: AppColors.darkGreenColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    appointment.doctorName ?? '',
                    style: AppStyles.black18SemiBold.copyWith(fontSize: 20.sp),
                  ),
                  Text(
                    "${appointment.specialty} • ${appointment.address}",
                    style: AppStyles.blackReg12,
                  ),
                  Container(
                    padding: EdgeInsets.all(16.w),
                    margin: EdgeInsets.symmetric(vertical: 16.h),
                    decoration: BoxDecoration(
                      color: AppColors.placeholderColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: AppColors.primaryColor,
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "$dayText at ${appointment.time ?? '--'}",
                              style: AppStyles.blackReg12,
                            ),
                            Text(
                              "Est. wait: ~12 mins",
                              style: AppStyles.blackReg12.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            color: AppColors.pinkColor,
                          ),
                          child: Text(
                            "2 ahead of you",
                            style: AppStyles.brown11SemiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.notifications_active_outlined,
                        color: AppColors.blueColor,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "We'll alert your phone with a soft buzz 5 mins"
                        "\nbefore your turn.",
                        style: AppStyles.blackReg12,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      QueueButton(
                        icon: Icons.hourglass_bottom,
                        title: "Track Queue",
                        foreground: Colors.white,
                        background: AppColors.darkGreenColor,
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.queueDetails,
                            arguments: {
                              'bookingNumber': appointment.bookingNumber,
                            },
                          );
                        },
                      ),
                      QueueButton(
                        icon: Icons.calendar_today,
                        title: "Reschedule",
                        foreground: AppColors.darkGreenColor,
                        background: Colors.white,
                        onPressed: () {
                          final doctorId = appointment.doctorId;
                          if (doctorId == null) return;

                          context.read<PreviousAppointmentsCubit>().rebook(
                            doctorId,
                            date: appointment.date?.toDate(),
                            time: appointment.time,
                            replaceId: appointment.id,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
