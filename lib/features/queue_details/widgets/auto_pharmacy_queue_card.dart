import 'package:flutter/material.dart';
import 'package:grad_project/core/app_colors.dart';
import 'package:grad_project/core/app_styles.dart';

class AutoPharmacyQueueCard extends StatelessWidget {
  const AutoPharmacyQueueCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: EdgeInsets.all(16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pharmacy Queue",
                style: AppStyles.black13SemiBold.copyWith(fontSize: 14),
              ),
              Text(
                "Join the pharmacy queue automatically after"
                "\nyour check-up",
                style: AppStyles.gray14Reg,
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.toggle_on,
              color: AppColors.primaryColor,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
