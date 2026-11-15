import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/style/app_styles.dart';

class AskedQItem extends StatelessWidget {
  final String question;
  final String answer;

  const AskedQItem({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Q: $question',
            style: AppStyles.blackBold16.copyWith(height: 1.5),
          ),
          SizedBox(height: 4.h),
          Text(
            answer,
            style: AppStyles.blackBold16.copyWith(
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
