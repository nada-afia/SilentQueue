import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';

class DateSelection extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  const DateSelection({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Select Date', style: AppStyles.blackBold16),

            IconButton(
              onPressed: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: today,
                  lastDate: today.add(const Duration(days: 90)),
                );

                if (date != null) {
                  onDateSelected(date);
                }
              },
              icon: const Icon(
                Icons.calendar_month,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),

        SizedBox(height: 10.h),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(7, (index) {
              final date = today.add(Duration(days: index));

              final isSelected =
                  date.year == selectedDate.year &&
                  date.month == selectedDate.month &&
                  date.day == selectedDate.day;

              final dayName = days[date.weekday % 7];

              return InkWell(
                onTap: () {
                  onDateSelected(date);
                },
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  width: 55.w,
                  margin: EdgeInsets.only(right: 10.w),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primaryColor
                        : AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primaryColor
                          : AppColors.lightGrayColor,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        dayName,
                        style: TextStyle(
                          color: isSelected
                              ? AppColors.whiteColor
                              : AppColors.grayColor,
                          fontSize: 11.sp,
                        ),
                      ),

                      SizedBox(height: 5.h),

                      Text(
                        '${date.day}',
                        style: TextStyle(
                          color: isSelected
                              ? AppColors.whiteColor
                              : AppColors.blackColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}