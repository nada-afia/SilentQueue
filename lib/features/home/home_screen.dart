import 'package:flutter/material.dart';
import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';
import 'package:grad_project/features/home/section_header.dart';
import 'package:grad_project/features/home/widgets/doctor_card.dart';
import 'package:grad_project/features/home/widgets/home_header.dart';
import 'package:grad_project/features/home/widgets/home_search.dart';
import 'package:grad_project/features/home/widgets/specialty_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const HomeHeader(),
            const SizedBox(height: 20),
            const HomeSearch(),
            const SizedBox(height: 24),

            SectionHeader(title: 'Explore Specialties'),

            const SizedBox(height: 12),

            SizedBox(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  SpecialtyItem(
                    icon: Icons.medical_services_outlined,
                    name: 'Cardiology',
                  ),
                  SpecialtyItem(
                    icon: Icons.medication_outlined,
                    name: 'Dental',
                  ),
                  SpecialtyItem(
                    icon: Icons.health_and_safety_outlined,
                    name: 'Dermatology',
                  ),
                  SpecialtyItem(
                    icon: Icons.remove_red_eye_outlined,
                    name: 'Pediatrics',
                  ),
                  SpecialtyItem(icon: Icons.healing_outlined, name: 'General'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SectionHeader(title: 'Available Doctors'),
            const SizedBox(height: 12),
            const DoctorCard(
              initials: 'SM',
              name: 'Dr. Sarah Mitchell',
              specialty: 'Cardiologist',
              clinic: 'City Heart Center',
              rating: 4.8,
              reviewsCount: 234,
              availability: 'Available Today',
              yearsExperience: 11,
            ),
            const DoctorCard(
              initials: 'JW',
              name: 'Dr. James Wilson',
              specialty: 'Neurologist',
              clinic: 'Royal Neurology Clinic',
              rating: 4.9,
              reviewsCount: 189,
              availability: 'Available Tomorrow',
              yearsExperience: 8,
            ),
          ],
        ),
      ),
    );
  }
}
