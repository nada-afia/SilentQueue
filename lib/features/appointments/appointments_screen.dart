import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:grad_project/core/app_routes.dart';
import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';
import 'package:grad_project/features/appointments/cubit/previous_appointments_cubit.dart';
import 'package:grad_project/features/appointments/cubit/previous_appointments_state.dart';
import 'package:grad_project/features/appointments/widgets/active_appointment_card.dart';
import 'package:grad_project/features/appointments/widgets/visit_card.dart';
import 'package:intl/intl.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {},
                        backgroundColor: AppColors.redColor,
                        foregroundColor: AppColors.whiteColor,
                        icon: Icons.delete,
                        iconSize: 30,
                        label: 'Delete',
                        labelStyle: AppStyles.whiteReg16,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.r),
                          bottomRight: Radius.circular(30.r),
                        ),
                      ),
                    ],
                  ),
                  child: ActiveAppointmentCard(),
                ),
                Text(
                  "PREVIOUS CONSULTATIONS",
                  style: AppStyles.black13SemiBold,
                ),
                SizedBox(height: 8.h),
                BlocConsumer<
                  PreviousAppointmentsCubit,
                  PreviousAppointmentsState
                >(
                  listener: (context, state) {
                    if (state is RebookReady) {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.bookAppointment,
                        arguments: state.doctor,
                      );
                    } else if (state is RebookDoctorUnavailable) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('This doctor is no longer available'),
                        ),
                      );
                    }
                  },
                  buildWhen: (previous, current) =>
                      current is PreviousAppointmentsLoading ||
                      current is PreviousAppointmentsLoaded ||
                      current is PreviousAppointmentsError,
                  builder: (context, state) {
                    if (state is PreviousAppointmentsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is PreviousAppointmentsError) {
                      return Text(state.message);
                    }
                    if (state is PreviousAppointmentsLoaded) {
                      if (state.appointments.isEmpty) {
                        return const Text('No previous consultations');
                      }
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.appointments.length,
                        separatorBuilder: (_, _) => const Divider(),
                        itemBuilder: (context, i) {
                          final a = state.appointments[i];
                          return VisitCard(
                            icon: Icons.medical_services_outlined,
                            color: AppColors.darkGreenColor,
                            date: DateFormat('MMM dd, yyyy').format(a.date),
                            status: a.status,
                            drName: a.doctorName,
                            id: '#${a.id.substring(0, 4).toUpperCase()}',
                            specialization: a.specialty,
                            onRebook: () => context
                                .read<PreviousAppointmentsCubit>()
                                .rebook(a.doctorId),
                          );
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
