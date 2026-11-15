import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: AppColors.lightGreenColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(
              Icons.credit_card,
              size: 20.sp,
              color: AppColors.primaryColor,
            ),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '•••• •••• •••• 4242',
                  style: AppStyles.black13SemiBold,
                ),

                SizedBox(height: 2.h),

                Text('Expires 12/27', style: AppStyles.gray11Medium),
              ],
            ),
          ),

          InkWell(
            onTap: () {},
            child: Text('Change', style: AppStyles.primaryReg12),
          ),
        ],
      ),
    );
  }
}