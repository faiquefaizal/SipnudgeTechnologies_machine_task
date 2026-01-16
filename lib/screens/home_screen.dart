import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipnudge_machine_task/cubit/analysis_cubit.dart';
import 'package:sipnudge_machine_task/cubit/analysis_state.dart';
import 'package:sipnudge_machine_task/cubit/chart_type_cubit.dart';

import 'package:sipnudge_machine_task/widgets/custom_scaffold.dart';
import 'package:sipnudge_machine_task/widgets/analysis_header.dart';
import 'package:sipnudge_machine_task/widgets/drink_completion_card.dart';
import 'package:sipnudge_machine_task/widgets/hydration_source_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocProvider(
            create: (context) => AnalysisCubit(),
            child: BlocBuilder<AnalysisCubit, AnalysisState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 120),
                  child: Column(
                    children: [
                      const AnalysisHeader(),
                      const SizedBox(height: 20),
                      BlocProvider(
                        create: (context) => ChartTypeCubit(),
                        child: BlocBuilder<ChartTypeCubit, bool>(
                          builder: (context, isLineChart) {
                            return DrinkCompletionCard(
                              data: state.hydrationList,
                              isLineChart: isLineChart,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      HydrationSourceCard(state: state),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
