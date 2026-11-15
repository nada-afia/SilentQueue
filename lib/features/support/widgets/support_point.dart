import 'package:flutter/material.dart';
import 'package:grad_project/core/style/app_styles.dart';

class SupportPoint extends StatelessWidget {
  final String title;
  final String description;

  const SupportPoint({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: AppStyles.black18SemiBold.copyWith(
              height: 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: AppStyles.blackBold16.copyWith(
                  height: 1.5,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(text: '$title: ', style: AppStyles.blackBold16),
                  TextSpan(text: description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
