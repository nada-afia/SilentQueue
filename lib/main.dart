import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/app_routes.dart';
import 'package:grad_project/features/auth/signin/signin_screen.dart';
import 'package:grad_project/features/auth/signup/signup_screen.dart';
import 'package:grad_project/features/onboarding/onboarding_screen.dart';
import 'package:grad_project/features/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splash,
        routes: {
          AppRoutes.splash: (_) => SplashScreen(),
          AppRoutes.login: (_) => SigninScreen(),
          AppRoutes.signUp: (_) => SignupScreen(),
          AppRoutes.onboarding: (_) => OnboardingScreen(),
        },
      ),
    );
  }
}
