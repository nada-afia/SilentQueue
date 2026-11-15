import 'package:flutter/material.dart';
import 'package:grad_project/core/style/app_colors.dart';

class DoctorAvatar extends StatelessWidget {
  final String imageUrl;
  final String initials;
  final double size;
  final double radius;

  const DoctorAvatar({
    super.key,
    required this.imageUrl,
    required this.initials,
    required this.size,
    required this.radius,
  });

  Widget buildInitials() {
    return Text(
      initials,
      style: TextStyle(
        color: AppColors.whiteColor,
        fontSize: size * 0.35,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: imageUrl.isEmpty
          ? buildInitials()
          : ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: Image.network(
                imageUrl,
                width: size,
                height: size,
                fit: BoxFit.cover,
                webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
                errorBuilder: (context, error, stackTrace) {
                  debugPrint('Doctor image error: $error');
                  return buildInitials();
                },
              ),
            ),
    );
  }
}