import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/features/appointments/appointments_screen.dart';
import 'package:grad_project/features/home/home_screen.dart';
import 'package:grad_project/features/profile/cubit/profile_cubit.dart';
import 'package:grad_project/features/profile/profile_screen.dart';
import 'package:grad_project/features/queue_details/queue_details_screen.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({super.key});

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int _index = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    AppointmentsScreen(),
    QueueDetailsScreen(),
    BlocProvider(create: (context) => ProfileCubit(), child: ProfileScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _pages),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          height: 72,
          iconTheme: WidgetStateProperty.resolveWith((states) {
            final selected = states.contains(WidgetState.selected);
            return IconThemeData(
              color: selected ? AppColors.primaryColor : AppColors.grayColor,
              size: 26,
            );
          }),
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            final selected = states.contains(WidgetState.selected);
            return TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: selected ? AppColors.primaryColor : AppColors.grayColor,
            );
          }),
        ),
        child: NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: (i) => setState(() => _index = i),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_today_outlined),
              label: 'Appointments',
            ),
            NavigationDestination(
              icon: Icon(Icons.hourglass_bottom_outlined),
              label: 'Queue',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
