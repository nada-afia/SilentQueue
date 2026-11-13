import 'package:flutter/material.dart';
import 'package:grad_project/core/app_colors.dart';
import 'package:grad_project/core/app_styles.dart';

class ProfileOption extends StatelessWidget {
  final void Function() onTap;
  final IconData leading;
  final IconData trailing;
  final double trailingSize;
  final String title;
  final String? trailingText;

  const ProfileOption({
    super.key,
    required this.onTap,
    required this.leading,
    required this.trailing,
    required this.trailingSize,
    required this.title,
    this.trailingText,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(leading, color: AppColors.darkGreenColor),
      title: Text(title, style: AppStyles.blackReg12.copyWith(fontSize: 15)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(trailingText ?? "", style: AppStyles.gray14Reg),
          SizedBox(width: 4),
          Icon(trailing, size: trailingSize, color: AppColors.darkGreenColor),
        ],
      ),
    );
  }
}
