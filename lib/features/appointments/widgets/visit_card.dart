import 'package:flutter/material.dart';
import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';
import 'package:grad_project/features/appointments/widgets/queue_button.dart';

class VisitCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String date;
  final String status;
  final String drName;
  final String id;
  final String specialization;

  const VisitCard({
    super.key,
    required this.icon,
    required this.color,
    required this.date,
    required this.status,
    required this.drName,
    required this.id,
    required this.specialization,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.placeholderColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: color),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(date, style: AppStyles.blackReg12),
                          SizedBox(width: 4),
                          Text(status, style: AppStyles.primary13SemiBold),
                        ],
                      ),
                      Text(drName, style: AppStyles.black18SemiBold),
                      Text(specialization, style: AppStyles.blackReg12),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.placeholderColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(id, style: AppStyles.blackReg12),
                ),
              ],
            ),
            SizedBox(height: 8),
            QueueButton(
              icon: Icons.replay,
              title: "Rebook Visit",
              background: AppColors.blueColor,
              foreground: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
