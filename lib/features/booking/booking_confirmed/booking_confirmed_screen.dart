import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';
import 'package:grad_project/core/widgets/custom_elevated_button.dart';
import 'package:grad_project/features/home/home_screen.dart';
import 'cubit/booking_confirmed_cubit.dart';
import 'cubit/booking_confirmed_state.dart';
import 'widgets/success_header.dart';
import 'widgets/upcoming_appointment_card.dart';
import 'widgets/reminder_switch.dart';

class BookingConfirmedScreen extends StatelessWidget {
  final DateTime selectedDate;
  final String selectedTime;

  const BookingConfirmedScreen({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingConfirmedCubit(
        selectedDate: selectedDate,
        selectedTime: selectedTime,
      ),
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
          child: BlocBuilder<BookingConfirmedCubit, BookingConfirmedStates>(
            builder: (context, state) {
              final cubit = context.read<BookingConfirmedCubit>();

              return ListView(
                padding: EdgeInsets.all(16.r),
                children: [
                  SizedBox(height: 20.h),

                  const SuccessHeader(),

                  SizedBox(height: 24.h),

                  UpcomingAppointmentCard(
                    bookingId: cubit.bookingId,
                    initials: cubit.doctorInitials,
                    doctorName: cubit.doctorName,
                    specialty: cubit.specialty,
                    hospital: cubit.hospital,
                    date: cubit.shortDate,
                    time: cubit.selectedTime,
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
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ), 
                          (route) => route.isFirst,
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