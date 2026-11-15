import 'package:flutter/material.dart';
import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';

class HomeHeader extends StatelessWidget {
  final String greeting;
  final String name;

  const HomeHeader({
    super.key,
    required this.greeting,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(greeting, style: AppStyles.grayReg12),
              Text(
                name.isEmpty ? 'Hello!' : 'Hello, $name!',
                style: AppStyles.blackBold16,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),

        const SizedBox(width: 10),

        const CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.primaryColor,
          child: Icon(
            Icons.person,
            color: AppColors.whiteColor,
            size: 20,
          ),
        ),
      ],
    );
  }
}