import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/app_routes.dart';
import 'package:grad_project/core/style/app_styles.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),

              Expanded(
                flex: 5,
                child: Image.asset(
                  'assets/images/onboarding_image.png',
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),

              SizedBox(height: 30.h),

              Text(
                'Book Appointments\nin Seconds',
                style: AppStyles.blackBold28,
              ),

              SizedBox(height: 24.h),

              Text(
                'Say goodbye to crowded clinic waiting rooms\nSchedule visits with trusted doctors and secure your\nspot with zero hassle',
                style: AppStyles.grayReg14,
              ),

              const Spacer(),

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
