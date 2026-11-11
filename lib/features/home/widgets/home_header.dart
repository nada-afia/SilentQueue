
import 'package:flutter/material.dart';
import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';


class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning 👋',
              style: AppStyles.grayReg12,
            ),
            Text(
              'Hello, Sarah!',
              style: AppStyles.blackBold16,
            ),
          ],
        ),

        CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.primaryColor,
          child: const Icon(
            Icons.person,
            color: AppColors.whiteColor,
            size: 20,
          ),
        ),
      ],
    );
  }
}
