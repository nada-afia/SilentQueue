import 'package:flutter/material.dart';
import 'package:grad_project/core/app_styles.dart';

class QueueButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color background;
  final Color foreground;
  final void Function() onPressed;

  const QueueButton({
    super.key,
    required this.icon,
    required this.title,
    required this.background,
    required this.foreground,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: foreground),
          SizedBox(width: 4),
          Text(
            title,
            style: AppStyles.whiteSemiBold14.copyWith(color: foreground),
          ),
        ],
      ),
    );
  }
}
