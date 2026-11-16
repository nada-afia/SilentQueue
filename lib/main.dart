import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/app_routes.dart';
import 'package:grad_project/core/onboarding_helper.dart';
import 'package:grad_project/features/appointments/appointments_screen.dart';
import 'package:grad_project/features/appointments/cubit/previous_appointments_cubit.dart';
import 'package:grad_project/features/auth/signin/cubit/signin_cubit.dart';
import 'package:grad_project/features/auth/signin/signin_screen.dart';
import 'package:grad_project/features/auth/signup/cubit/signup_cubit.dart';
import 'package:grad_project/features/auth/signup/signup_screen.dart';
import 'package:grad_project/features/booking/book_appointment/book_appointment_screen.dart';
import 'package:grad_project/features/booking/data/booking_firebase_data_source.dart';
import 'package:grad_project/features/onboarding/onboarding_screen.dart';
import 'package:grad_project/features/privacy/privacy_screen.dart';
import 'package:grad_project/features/profile/profile_screen.dart';
import 'package:grad_project/features/queue_details/queue_details_screen.dart';
import 'package:grad_project/features/splash/splash_screen.dart';
import 'package:grad_project/firebase_options.dart';

import 'features/home/home_navigation.dart';
import 'features/support/support_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final hasSeenOnboarding = await OnboardingHelper.hasSeenOnboarding();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp(hasSeenOnboarding: hasSeenOnboarding));
}

class MyApp extends StatelessWidget {
  final bool hasSeenOnboarding;

  const MyApp({super.key, required this.hasSeenOnboarding});

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
          AppRoutes.splash: (_) =>
              SplashScreen(hasSeenOnboarding: hasSeenOnboarding),
          AppRoutes.login: (context) => BlocProvider(
            create: (context) => SigninCubit(),
            child: SigninScreen(),
          ),
          AppRoutes.signUp: (_) => BlocProvider(
            create: (context) => SignupCubit(),
            child: SignupScreen(),
          ),
          AppRoutes.onboarding: (_) => OnboardingScreen(),
          AppRoutes.home: (context) => const HomeNavigation(),
          AppRoutes.appointments: (_) => BlocProvider(
            create: (_) =>
                PreviousAppointmentsCubit(BookingFirebaseDataSource())..load(),
            child: AppointmentsScreen(),
          ),
          AppRoutes.queueDetails: (context) {
            final args =
                ModalRoute.of(context)!.settings.arguments
                    as Map<String, dynamic>;
            return QueueDetailsScreen(bookingNumber: args['bookingNumber']);
          },
          AppRoutes.profile: (context) => ProfileScreen(),
          AppRoutes.privacy: (context) => PrivacyScreen(),
          AppRoutes.support: (context) => SupportScreen(),
          AppRoutes.bookAppointment: (context) => BookAppointmentScreen(),
        },
      ),
    );
  }
}
