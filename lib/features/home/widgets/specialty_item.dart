
import 'package:flutter/material.dart';
import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';

class SpecialtyItem extends StatelessWidget {
  final IconData icon;
  final String name;

  const SpecialtyItem({
    super.key,
    required this.icon,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: AppColors.primaryColor,
            size: 25,
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: AppStyles.blackReg12,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
