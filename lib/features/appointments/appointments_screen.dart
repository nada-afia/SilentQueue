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
import 'package:grad_project/features/appointments/widgets/cubit/appointments_cubit.dart';
import 'package:grad_project/features/appointments/widgets/cubit/states.dart';
import 'package:grad_project/features/appointments/widgets/visit_card.dart';
import 'package:intl/intl.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

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
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is AppointmentsLoaded) {
                        return Slidable(
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (_) async {
                                  final activeCubit = context
                                      .read<AppointmentsCubit>();
                                  final previousCubit = context
                                      .read<PreviousAppointmentsCubit>();

                                  await activeCubit.cancelAppointment(
                                    state.appointmentModel.id!,
                                  );
                                  previousCubit.load();
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
                        return const SizedBox();
                      }
                    },
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
                    listener: (context, state) async {
                      if (state is RebookReady) {
                        final previousCubit = context
                            .read<PreviousAppointmentsCubit>();
                        final activeCubit = context.read<AppointmentsCubit>();

                        await Navigator.pushNamed(
                          context,
                          AppRoutes.bookAppointment,
                          arguments: {
                            'doctor': state.doctor,
                            'date': previousCubit.rebookDate,
                            'time': previousCubit.rebookTime,
                            'replaceId': previousCubit.rebookReplaceId,
                          },
                        );

                        activeCubit.getActiveAppointment();
                        previousCubit.load();
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
      ),
    );
  }
}
