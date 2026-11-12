
import 'package:flutter/material.dart';
import 'package:grad_project/core/style/app_styles.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({
    super.key,
    required this.title,
  });

 @override
Widget build(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.blackBold16,
        ),

        Text(
          'See All',
          style: AppStyles.primaryBold12,
        ),
      ],
    ),
  );
}
}
