import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/style/app_styles.dart';
import 'package:grad_project/features/privacy/widgets/privacy_point.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Privacy & Security",
          style: AppStyles.blackBold16.copyWith(fontSize: 20.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Silent Queue is built to protect your privacy while managing your clinic visit:',
                style: AppStyles.black18SemiBold.copyWith(height: 1.5),
              ),
              SizedBox(height: 20.h),

              PrivacyPoint(
                title: 'Minimal Data',
                description: 'We only collect basic details needed to hold your spot and notify you (name/alias, phone number, and ticket number) — never medical records or diagnoses.',
              ),
              PrivacyPoint(
                title: 'Waiting Room Discretion',
                description: 'Public screens display ticket numbers only, keeping your identity private.',
              ),
              PrivacyPoint(
                title: 'Strong Protection',
                description: 'All data is encrypted during transmission and storage, with access restricted strictly to authorized clinic staff.',
              ),
              PrivacyPoint(
                title: 'No Data Sharing',
                description: 'Your information is never sold or used for ads, and temporary queue data is cleared after your visit ends.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
