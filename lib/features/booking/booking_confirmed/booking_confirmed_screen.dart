import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/app_routes.dart';
import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';
import 'package:grad_project/core/widgets/custom_elevated_button.dart';
import 'package:grad_project/features/booking/models/appointment_model.dart';
import 'cubit/booking_confirmed_cubit.dart';
import 'cubit/booking_confirmed_state.dart';
import 'widgets/success_header.dart';
import 'widgets/upcoming_appointment_card.dart';
import 'widgets/reminder_switch.dart';

class BookingConfirmedScreen extends StatelessWidget {
  final AppointmentModel appointment;

  const BookingConfirmedScreen({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingConfirmedCubit(appointment: appointment),
      child: const BookingConfirmedView(),
    );
  }
}

class BookingConfirmedView extends StatelessWidget {
  const BookingConfirmedView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,

        body: SafeArea(
          child: BlocConsumer<BookingConfirmedCubit, BookingConfirmedStates>(
            listener: (context, state) {
              if (state is BookingConfirmedErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage)),
                );
              }
            },
            builder: (context, state) {
              final cubit = context.read<BookingConfirmedCubit>();
              final appointment = cubit.appointment;

              return ListView(
                padding: EdgeInsets.all(16.r),
                children: [
                  SizedBox(height: 20.h),

                  const SuccessHeader(),

                  SizedBox(height: 24.h),

                  UpcomingAppointmentCard(
                    bookingId: appointment.bookingNumber,
                    imageUrl: appointment.doctorImageUrl,
                    initials: appointment.doctorInitials,
                    doctorName: appointment.doctorName,
                    specialty: appointment.specialty,
                    hospital: appointment.clinic,
                    date: cubit.shortDate,
                    time: appointment.time,
                  ),

                  SizedBox(height: 14.h),

                  ReminderSwitch(
                    value: cubit.reminderEnabled,
                    onChanged: (value) {
                      cubit.changeReminder(value);
                    },
                  ),

                  SizedBox(height: 24.h),

                  CustomElevatedButton(
                    title: 'View Appointments',
                    showArrow: false,
                    onPressed: () {},
                  ),

                  SizedBox(height: 12.h),

                  SizedBox(
                    width: double.infinity,
                    height: 48.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.placeholderColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutes.home,
                          (route) => false,
                        );
                      },
                      child: Text(
                        'Go to Home',
                        style: AppStyles.black13SemiBold,
                      ),
                    ),
                  ),

                  SizedBox(height: 10.h),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}