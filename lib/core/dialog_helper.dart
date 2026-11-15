import 'package:flutter/material.dart';
import 'package:grad_project/core/style/app_styles.dart';

class DialogHelper {
  static Future<void> showError(
    BuildContext context,
    String message, {
    String title = 'Error',
  }) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title, style: AppStyles.redReg12),
        content: Text(message, style: AppStyles.blackBold12),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK', style: AppStyles.blackBold16),
          ),
        ],
      ),
    );
  }

  static Future<void> showSuccess(
    BuildContext context,
    String message, {
    String title = 'Success',
    VoidCallback? onOk,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: Text(title, style: AppStyles.greenReg12),
        content: Text(message, style: AppStyles.blackBold12),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onOk?.call();
            },
            child: const Text('OK', style: AppStyles.blackBold16),
          ),
        ],
      ),
    );
  }
}
