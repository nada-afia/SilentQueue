
import 'package:flutter/material.dart';
import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';

class DoctorCard extends StatelessWidget {
  final String initials;
  final String name;
  final String specialty;
  final String clinic;
  final double rating;
  final int reviewsCount;
  final String availability;
  final int yearsExperience;

  const DoctorCard({
    super.key,
    required this.initials,
    required this.name,
    required this.specialty,
    required this.clinic,
    required this.rating,
    required this.reviewsCount,
    required this.availability,
    required this.yearsExperience,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.primaryColor,
                  child: Text(
                    initials,
                    style: AppStyles.whiteSemiBold14,
                  ),
                ),

                const SizedBox(width: 8),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: AppStyles.blackBold12,
                      ),
                      Text(
                        specialty,
                        style: AppStyles.grayReg12,
                      ),
                    ],
                  ),
                ),

                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 14,
                ),

                Text(
                  rating.toString(),
                  style: AppStyles.blackBold12,
                ),

                const SizedBox(width: 3),

                Text(
                  '($reviewsCount)',
                  style: AppStyles.lightGrayReg14,
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: AppColors.lightGrayColor,
                  size: 14,
                ),

                const SizedBox(width: 5),

                Text(
                  clinic,
                  style: AppStyles.grayReg12,
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.greenColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    availability,
                    style: AppStyles.greenReg12,
                  ),
                ),

                Text(
                  '$yearsExperience years exp.',
                  style: AppStyles.lightGrayReg14,
                ),
              ],
            ),

            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 9,
              ),
              decoration: BoxDecoration(
                color: AppColors.placeholderColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'View Profile',
                textAlign: TextAlign.center,
                style: AppStyles.primaryBold12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
