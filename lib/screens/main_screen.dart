import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipnudge_machine_task/cubit/navigation_cubit.dart';
import 'package:sipnudge_machine_task/screens/analysis_screen.dart';
import 'package:sipnudge_machine_task/screens/goal_screen.dart';
import 'package:sipnudge_machine_task/screens/home_screen.dart';
import 'package:sipnudge_machine_task/screens/setting_screen.dart';

import 'package:sipnudge_machine_task/widgets/custom_nav_bar.dart';

import '../widgets/custem_scaffold.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> _screens = [
    HomeScreen(),
    AnalysisScreen(),
    GoalScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navigationIndex = context.watch<NavigationCubit>().state;
    return CustemScaffold(
      body: _screens[navigationIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomNavBar(),
    );
  }
}
