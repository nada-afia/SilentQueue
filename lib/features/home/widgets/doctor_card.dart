import 'package:flutter/material.dart';
import 'package:grad_project/core/app_routes.dart';
import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';
import 'package:grad_project/core/widgets/doctor_avatar.dart';
import 'package:grad_project/features/home/models/doctor_model.dart';

class DoctorCard extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorCard({super.key, required this.doctor});

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
                DoctorAvatar(
                  imageUrl: doctor.imageUrl,
                  initials: doctor.initials,
                  size: 44,
                  radius: 22,
                ),

                const SizedBox(width: 8),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.name,
                        style: AppStyles.blackBold12,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(doctor.specialty, style: AppStyles.grayReg12),
                    ],
                  ),
                ),

                const Icon(Icons.star, color: Colors.amber, size: 14),

                Text(
                  doctor.rating.toString(),
                  style: AppStyles.blackBold12,
                ),

                const SizedBox(width: 3),

                Text(
                  '(${doctor.reviewsCount})',
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

                Expanded(
                  child: Text(
                    doctor.clinic,
                    style: AppStyles.grayReg12,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
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
                    doctor.availability,
                    style: AppStyles.greenReg12,
                  ),
                ),

                Text(
                  '${doctor.yearsExperience} years exp.',
                  style: AppStyles.lightGrayReg14,
                ),
              ],
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.bookAppointment,
                    arguments: doctor,
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.placeholderColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Book Appointment',
                  style: AppStyles.primaryBold12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}