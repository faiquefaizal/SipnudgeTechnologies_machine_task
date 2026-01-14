import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipnudge_machine_task/cubit/navigation_cubit.dart';
import 'package:sipnudge_machine_task/screens/main_screen.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: MaterialApp(
        title: 'SipNudge',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.main,
        home: MainScreen(),
      ),
    );
  }
}
