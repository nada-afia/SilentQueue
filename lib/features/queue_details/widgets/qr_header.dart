import 'package:flutter/material.dart';
import 'package:grad_project/core/app_colors.dart';
import 'package:grad_project/core/app_styles.dart';

class QrHeader extends StatelessWidget {
  const QrHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGreenColor,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(Icons.info_rounded, color: AppColors.primaryColor),
          SizedBox(width: 7),
          Text(
            "Show this QR code at the clinic desk when your name"
            "\nis called.",
            style: AppStyles.primaryReg12,
          ),
        ],
      ),
    );
  }
}
