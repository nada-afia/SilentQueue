import 'package:flutter/material.dart';
import 'package:grad_project/features/appointments/appointments_screen.dart';
import 'package:grad_project/features/profile/profile_screen.dart';
import 'package:grad_project/features/queue_details/queue_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'profile',
      routes: {
        'queueDetails': (context) => QueueDetailsScreen(),
        'appointments': (context) => AppointmentsScreen(),
        'profile': (context) => ProfileScreen(),
      },
    );
  }
}
