import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/features/queue_details/cubit/queue_details_cubit.dart';
import 'package:grad_project/features/queue_details/cubit/states.dart';
import 'package:grad_project/features/queue_details/widgets/app_bar_widget.dart';
import 'package:grad_project/features/queue_details/widgets/back_to_home.dart';
import 'package:grad_project/features/queue_details/widgets/patient_info.dart';
import 'package:grad_project/features/queue_details/widgets/patient_ticket.dart';
import 'package:grad_project/features/queue_details/widgets/qr_header.dart';
import 'package:grad_project/features/queue_details/widgets/qr_scan.dart';

class QueueDetailsScreen extends StatelessWidget {
  final String bookingNumber;

  const QueueDetailsScreen({super.key, required this.bookingNumber});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          QueueDetailsCubit()..getAppointmentDetails(bookingNumber),
      child: Scaffold(
        body: BlocBuilder<QueueDetailsCubit, QueueDetailsStates>(
          builder: (context, state) {
            if (state is QueueDetailsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is QueueDetailsLoaded) {
              final appointment = state.appointmentModel;
              final patientName = state.patientName;

              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 310.h,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          AppBarWidget(),
                          Positioned(
                            top: 90,
                            left: 20,
                            right: 20,
                            child: PatientTicket(appointment: appointment),
                          ),
                        ],
                      ),
                    ),
                    QrHeader(),
                    QrScan(data: appointment.bookingNumber ?? 'TICKET-1042'),
                    PatientInfo(
                      appointment: appointment,
                      patientName: patientName,
                    ),
                    BackToHome(),
                  ],
                ),
              );
            } else if (state is QueueDetailsError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(state.message, textAlign: TextAlign.center),
                      SizedBox(height: 16.h),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Back"),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
