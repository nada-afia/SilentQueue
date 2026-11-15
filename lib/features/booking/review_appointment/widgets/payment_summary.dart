import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';

class PaymentSummary extends StatelessWidget {
  final double consultationFee;
  final double bookingFee;
  final double discountPercent;
  final double discount;
  final double total;

  const PaymentSummary({
    super.key,
    required this.consultationFee,
    required this.bookingFee,
    required this.discountPercent,
    required this.discount,
    required this.total,
  });

  Widget buildRow(String label, String value, TextStyle valueStyle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppStyles.grayReg12),
        Text(value, style: valueStyle),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Payment Summary', style: AppStyles.blackBold16),

          SizedBox(height: 16.h),

          buildRow(
            'Consultation Fee',
            '\$${consultationFee.toStringAsFixed(2)}',
            AppStyles.black13SemiBold,
          ),

          SizedBox(height: 12.h),

          buildRow(
            'Booking Fee',
            '\$${bookingFee.toStringAsFixed(2)}',
            AppStyles.black13SemiBold,
          ),

          SizedBox(height: 12.h),

          buildRow(
            'Discount (${discountPercent.toInt()}%)',
            '-\$${discount.toStringAsFixed(2)}',
            AppStyles.primary13SemiBold,
          ),

          SizedBox(height: 12.h),

          const Divider(),

          SizedBox(height: 12.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: AppStyles.blackBold16),
              Text(
                '\$${total.toStringAsFixed(2)}',
                style: AppStyles.primaryBold16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}