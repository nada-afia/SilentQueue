import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/app_routes.dart';
import 'package:grad_project/core/app_styles.dart';
import 'package:grad_project/core/widgets/custom_elevated_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 40.h),
              Image.asset('assets/images/onboarding_image.png'),
              SizedBox(height: 64.h),
              Text(
                'Book Appointments\nin Seconds',
                style: AppStyles.blackBold28,
              ),
              SizedBox(height: 24.h),
              Text(
                'Say goodbye to crowded clinic waiting rooms\nSchedule visits with trusted doctors and secure your\nspot with zero hassle',
                style: AppStyles.grayReg14,
              ),
              Spacer(),
              CustomElevatedButton(
                title: 'Get Started',
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
