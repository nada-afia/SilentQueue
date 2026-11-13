import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad_project/core/app_colors.dart';
import 'package:grad_project/core/app_styles.dart';
import 'package:grad_project/features/appointments/widgets/active_appointment_card.dart';
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Appointments", style: AppStyles.black18SemiBold),
                SizedBox(height: 16),
                Text(
                  "LIVE & CONFIRMED",
                  style: AppStyles.black13SemiBold.copyWith(fontSize: 12),
                ),
                ActiveAppointmentCard(),
                Text(
                  "PREVIOUS CONSULTATIONS",
                  style: AppStyles.black13SemiBold,
                ),
                SizedBox(height: 8),
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
    );
  }
}
