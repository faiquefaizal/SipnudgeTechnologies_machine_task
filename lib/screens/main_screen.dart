import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipnudge_machine_task/cubit/navigation_cubit.dart';
import 'package:sipnudge_machine_task/screens/analysis_screen.dart';
import 'package:sipnudge_machine_task/screens/goal_screen.dart';
import 'package:sipnudge_machine_task/screens/home_screen.dart';
import 'package:sipnudge_machine_task/screens/setting_screen.dart';
import 'package:sipnudge_machine_task/widgets/custem_nav_bar.dart';
import 'package:sipnudge_machine_task/widgets/custem_scaffold.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> screens = [
    HomeScreen(),
    AnalysisScreen(),
    GoalScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navigationIndex = context.watch<NavigationCubit>().state;
    return CustemScaffold(
      body: screens[navigationIndex],
      bottomNavigationBar: CustemNavBar(),
    );
  }
}
