import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';
import 'package:grad_project/features/appointments/widgets/active_appointment_card.dart';
import 'package:grad_project/features/appointments/widgets/cubit/appointments_cubit.dart';
import 'package:grad_project/features/appointments/widgets/cubit/states.dart';
import 'package:grad_project/features/appointments/widgets/visit_card.dart';

class AppointmentsScreen extends StatelessWidget {
  final List<VisitCard> visits = [
    VisitCard(
      icon: Icons.medical_services_outlined,
      color: AppColors.darkGreenColor,
      date: "Oct 02, 2024",
      status: "Completed",
      drName: "Dr. Marcus Vance",
      id: "#C-12",
      specialization: "General Physician • City Polyclinic",
    ),
    VisitCard(
      icon: CupertinoIcons.heart,
      color: AppColors.blueColor,
      date: "Sep 18, 2024",
      status: "Routine Clean",
      drName: "Dr. Sarah Jenkins",
      id: "#D-09",
      specialization: "Dental Clinic • Highland Suites",
    ),
  ];

  AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentsCubit()..getActiveAppointment(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Appointments", style: AppStyles.black18SemiBold),
                  SizedBox(height: 16.h),
                  Text(
                    "LIVE & CONFIRMED",
                    style: AppStyles.black13SemiBold.copyWith(fontSize: 12.sp),
                  ),
                  BlocBuilder<AppointmentsCubit, AppointmentsStates>(
                    builder: (context, state) {
                      if (state is AppointmentsLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is AppointmentsLoaded) {
                        return Slidable(
                          endActionPane: ActionPane(
                            motion: ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  context
                                      .read<AppointmentsCubit>()
                                      .cancelAppointment(
                                        state.appointmentModel.id!,
                                      );
                                },
                                backgroundColor: AppColors.redColor,
                                foregroundColor: AppColors.whiteColor,
                                icon: Icons.cancel_outlined,
                                iconSize: 30,
                                label: 'Cancel',
                                labelStyle: AppStyles.whiteReg16,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30.r),
                                  bottomRight: Radius.circular(30.r),
                                ),
                              ),
                            ],
                          ),
                          child: ActiveAppointmentCard(
                            appointment: state.appointmentModel,
                          ),
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),

                  Text(
                    "PREVIOUS CONSULTATIONS",
                    style: AppStyles.black13SemiBold,
                  ),
                  SizedBox(height: 8.h),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => visits[index],
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: visits.length,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
