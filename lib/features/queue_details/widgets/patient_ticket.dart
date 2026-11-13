import 'package:flutter/material.dart';
import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';

class PatientTicket extends StatelessWidget {
  const PatientTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.all(8),
                  child: Icon(
                    Icons.medical_services_outlined,
                    color: AppColors.primaryColor,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Clinic Name", style: AppStyles.black18SemiBold),
                    SizedBox(height: 7),
                    Text(
                      "Registration time 1:15 PM",
                      style: AppStyles.grayReg14.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 7),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: Colors.grey),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "YOUR TICKET",
                            style: AppStyles.grayReg12.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "Queue 8",
                            style: AppStyles.blackBold16.copyWith(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightGreenColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Current Queue 2 of 17",
                        style: AppStyles.primaryReg12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 7),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primaryColor, AppColors.darkGreenColor],
                ),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.white),
                    SizedBox(width: 3),
                    Text("Your Turn at:", style: AppStyles.white13Medium),
                    Spacer(),
                    Text(
                      "02:15 PM",
                      style: AppStyles.whiteSemiBold14.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
