import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';
import 'package:grad_project/core/widgets/custom_elevated_button.dart';
import 'package:grad_project/features/booking/booking_confirmed/booking_confirmed_screen.dart';
import 'package:grad_project/features/booking/common/widgets/appointment_doctor_card.dart';
import 'package:grad_project/features/home/models/doctor_model.dart';

import 'cubit/review_appointment_cubit.dart';
import 'cubit/review_appointment_state.dart';
import 'widgets/appointment_details.dart';
import 'widgets/payment_summary.dart';

class ReviewAppointmentScreen extends StatelessWidget {
  final DoctorModel doctor;
  final DateTime selectedDate;
  final String selectedTime;
  final String? replaceId;

  const ReviewAppointmentScreen({
    super.key,
    required this.doctor,
    required this.selectedDate,
    required this.selectedTime,
     this.replaceId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReviewAppointmentCubit(
        doctor: doctor,
        selectedDate: selectedDate,
        selectedTime: selectedTime,
        replaceId: replaceId,
      ),
      child: const ReviewAppointmentView(),
    );
  }
}

class ReviewAppointmentView extends StatelessWidget {
  const ReviewAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReviewAppointmentCubit, ReviewAppointmentStates>(
      listener: (context, state) {
        if (state is ReviewAppointmentSuccessState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  BookingConfirmedScreen(appointment: state.appointment),
            ),
          );
        }

        if (state is ReviewAppointmentErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        final cubit = context.read<ReviewAppointmentCubit>();

        return Scaffold(
          backgroundColor: AppColors.backgroundColor,

          appBar: AppBar(
            backgroundColor: AppColors.backgroundColor,
            elevation: 0,
            centerTitle: true,
            title: Text('Review Appointment', style: AppStyles.blackBold16),
          ),

          body: ListView(
            padding: EdgeInsets.all(16.r),
            children: [
              Text(
                'Please confirm your appointment details',
                style: AppStyles.grayReg12,
              ),

              SizedBox(height: 16.h),

              Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Doctor Details',
                            style: AppStyles.blackBold16,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.swap_horiz,
                                size: 16.sp,
                                color: AppColors.primaryColor,
                              ),
                              SizedBox(width: 4.w),
                              Text('Change', style: AppStyles.primaryReg12),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16.h),

                    AppointmentDoctorCard(
                      imageUrl: cubit.doctor.imageUrl,
                      initials: cubit.doctor.initials,
                      name: cubit.doctor.name,
                      specialty: cubit.doctor.specialty,
                      hospital: cubit.doctor.clinic,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 14.h),

              AppointmentDetails(
                date: cubit.formattedDate,
                time: cubit.selectedTime,
                hospital: cubit.doctor.clinic,
                address: cubit.doctor.address,
                onEdit: () {
                  Navigator.pop(context);
                },
              ),

              SizedBox(height: 14.h),

              PaymentSummary(
                consultationFee: cubit.consultationFee,
                bookingFee: cubit.bookingFee,
                discountPercent: cubit.discountPercent,
                discount: cubit.discount,
                total: cubit.total,
              ),
            ],
          ),

          bottomNavigationBar: Container(
            padding: EdgeInsets.all(16.r),
            color: AppColors.whiteColor,
            child: SafeArea(
              child: state is ReviewAppointmentLoadingState
                  ? SizedBox(
                      height: 48.h,
                      child: const Center(child: CircularProgressIndicator()),
                    )
                  : CustomElevatedButton(
                      title: 'Confirm Appointment',
                      showArrow: false,
                      onPressed: () {
                        cubit.confirmAppointment();
                      },
                    ),
            ),
          ),
        );
      },
    );
  }
}
