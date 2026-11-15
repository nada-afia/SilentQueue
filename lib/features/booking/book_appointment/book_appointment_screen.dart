import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';
import 'package:grad_project/core/widgets/custom_elevated_button.dart';
import 'package:grad_project/features/booking/review_appointment/review_appointment_screen.dart';
import 'cubit/book_appointment_cubit.dart';
import 'cubit/book_appointment_state.dart';
import 'widgets/doctor_profile_card.dart';
import 'widgets/doctor_stats.dart';
import 'widgets/date_selection.dart';
import 'widgets/available_time.dart';

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookAppointmentCubit(),
      child: const BookAppointmentView(),
    );
  }
}

class BookAppointmentView extends StatelessWidget {
  const BookAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text('Book Appointment', style: AppStyles.blackBold16),
      ),

      body: BlocBuilder<BookAppointmentCubit, BookAppointmentStates>(
        builder: (context, state) {
          final cubit = context.read<BookAppointmentCubit>();

          return ListView(
            padding: EdgeInsets.all(16.r),
            children: [
              Text('Doctor Profile', style: AppStyles.blackBold16),

              SizedBox(height: 12.h),

              const DoctorProfileCard(),

              SizedBox(height: 12.h),

              const DoctorStats(),

              SizedBox(height: 20.h),

              Text('About', style: AppStyles.blackBold16),

              SizedBox(height: 8.h),

              Text(
                'Dr. Sarah Mitchell is a board-certified cardiologist '
                'with extensive experience in treating heart conditions. '
                'She provides personalized care for every patient.',
                style: AppStyles.grayReg12,
              ),

              SizedBox(height: 20.h),

              DateSelection(
                selectedDate: cubit.selectedDate,
                onDateSelected: (date) {
                  cubit.changeDate(date);
                },
              ),

              SizedBox(height: 22.h),

              AvailableTime(
                selectedTime: cubit.selectedTime,
                onTimeSelected: (time) {
                  cubit.changeTime(time);
                },
              ),

              SizedBox(height: 20.h),
            ],
          );
        },
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.r),
        color: AppColors.whiteColor,
        child: SafeArea(
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Consultation Fee', style: AppStyles.grayReg12),
                  SizedBox(height: 2.h),
                  Text('\$150', style: AppStyles.blackBold16),
                ],
              ),

              SizedBox(width: 16.w),

              Expanded(
                child: CustomElevatedButton(
                  title: 'Book Appointment',
                  showArrow: false,
                  onPressed: () {
                    final cubit = context.read<BookAppointmentCubit>();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReviewAppointmentScreen(
                          selectedDate: cubit.selectedDate,
                          selectedTime: cubit.selectedTime,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}