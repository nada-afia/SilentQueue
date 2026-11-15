import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';

class AvailableTime extends StatelessWidget {
  final List<String> times;
  final String selectedTime;
  final Function(String) onTimeSelected;

  const AvailableTime({
    super.key,
    required this.times,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Available Time', style: AppStyles.blackBold16),

        SizedBox(height: 12.h),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: times.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 12.h,
            childAspectRatio: 2.4,
          ),
          itemBuilder: (context, index) {
            final time = times[index];
            final isSelected = selectedTime == time;

            return InkWell(
              onTap: () {
                onTimeSelected(time);
              },
              borderRadius: BorderRadius.circular(10.r),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primaryColor
                      : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primaryColor
                        : AppColors.lightGrayColor,
                  ),
                ),
                child: Text(
                  time,
                  style: TextStyle(
                    color: isSelected
                        ? AppColors.whiteColor
                        : AppColors.blackColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}