import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';
import 'package:grad_project/features/home/section_header.dart';
import 'cubit/home_cubit.dart';
import 'cubit/home_state.dart';
import 'widgets/doctor_card.dart';
import 'widgets/home_header.dart';
import 'widgets/home_search.dart';
import 'widgets/specialty_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            final cubit = context.read<HomeCubit>();

            if (state is HomeLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is HomeErrorState) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        state.errorMessage,
                        textAlign: TextAlign.center,
                        style: AppStyles.red14Medium,
                      ),

                      const SizedBox(height: 16),

                      ElevatedButton(
                        onPressed: () {
                          cubit.getHomeData();
                        },
                        child: const Text('Try Again'),
                      ),
                    ],
                  ),
                ),
              );
            }

            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                HomeHeader(greeting: cubit.greeting, name: cubit.firstName),

                const SizedBox(height: 20),

                HomeSearch(
                  onChanged: (text) {
                    cubit.searchDoctors(text);
                  },
                ),

                const SizedBox(height: 24),

                const SectionHeader(title: 'Explore Specialties'),

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
                      SpecialtyItem(
                        icon: Icons.healing_outlined,
                        name: 'General',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                const SectionHeader(title: 'Available Doctors'),

                const SizedBox(height: 12),

                if (cubit.doctors.isEmpty)
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Center(
                      child: Text(
                        'No doctors found',
                        style: AppStyles.grayReg14,
                      ),
                    ),
                  ),

                for (final doctor in cubit.doctors) DoctorCard(doctor: doctor),
              ],
            );
          },
        ),
      ),
    );
  }
}