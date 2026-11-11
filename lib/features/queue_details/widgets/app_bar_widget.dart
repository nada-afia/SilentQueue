import 'package:flutter/material.dart';
import 'package:grad_project/core/app_colors.dart';
import 'package:grad_project/core/app_styles.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
        gradient: RadialGradient(
          colors: [AppColors.primaryColor, AppColors.darkGreenColor],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back, color: Colors.white),
          ),
          Text("Queue Details", style: AppStyles.white24SemiBold),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
