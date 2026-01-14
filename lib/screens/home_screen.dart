import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipnudge_machine_task/core/theme/app_colors.dart';
import 'package:sipnudge_machine_task/cubit/analysis_cubic/cubit/analysis_cubit.dart';
import 'package:sipnudge_machine_task/widgets/custem_scaffold.dart';
import 'package:sipnudge_machine_task/widgets/analysis_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustemScaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Column(
            children: [
              BlocProvider(
                create: (context) => AnalysisCubit(),
                child: AnalysisHeader(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
