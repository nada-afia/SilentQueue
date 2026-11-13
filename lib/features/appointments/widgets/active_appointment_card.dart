import 'package:flutter/material.dart';
import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';
import 'package:grad_project/features/appointments/widgets/queue_button.dart';

class ActiveAppointmentCard extends StatelessWidget {
  const ActiveAppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Column(
          children: [
            Container(height: 8, color: AppColors.primaryColor),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                      SizedBox(width: 4),
                      Text(
                        "Metro Health Center",
                        style: AppStyles.black13SemiBold,
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: AppColors.placeholderColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "#A-24",
                          style: TextStyle(
                            color: AppColors.darkGreenColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Dr. Emily Watson",
                    style: AppStyles.black18SemiBold.copyWith(fontSize: 20),
                  ),
                  Text(
                    "Cardiology Consultation • Room 204",
                    style: AppStyles.blackReg12,
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: AppColors.placeholderColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: AppColors.primaryColor,
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Today at 10:30 AM",
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
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
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
                      SizedBox(width: 8),
                      Text(
                        "We'll alert your phone with a soft buzz 5 mins"
                        "\nbefore your turn.",
                        style: AppStyles.blackReg12,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      QueueButton(
                        icon: Icons.hourglass_bottom,
                        title: "Track Queue",
                        foreground: Colors.white,
                        background: AppColors.darkGreenColor,
                        onPressed: () {},
                      ),
                      QueueButton(
                        icon: Icons.calendar_today,
                        title: "Reschedule",
                        foreground: AppColors.darkGreenColor,
                        background: Colors.white,
                        onPressed: () {},
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
