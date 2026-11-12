import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grad_project/features/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/app_routes.dart';
import 'package:grad_project/features/auth/signin/cubit/signin_cubit.dart';
import 'package:grad_project/features/auth/signin/signin_screen.dart';
import 'package:grad_project/features/auth/signup/cubit/signup_cubit.dart';
import 'package:grad_project/features/auth/signup/signup_screen.dart';
import 'package:grad_project/features/home/home_screen.dart';
import 'package:grad_project/features/onboarding/onboarding_screen.dart';
import 'package:grad_project/features/splash/splash_screen.dart';
import 'package:grad_project/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
          AppRoutes.login: (context) => BlocProvider(
            create: (context) => SigninCubit(),
            child: SigninScreen(),
          ),
          AppRoutes.signUp: (_) => BlocProvider(
            create: (context) => SignupCubit(),
            child: SignupScreen(),
          ),
          AppRoutes.onboarding: (_) => OnboardingScreen(),
          AppRoutes.home: (context) => HomeScreen(),
        },
      ),
    );
  }
}

