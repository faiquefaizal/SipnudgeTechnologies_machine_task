import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sipnudge_machine_task/core/theme/app_typography.dart';
import 'package:sipnudge_machine_task/cubit/chart_touch_cubit.dart';

import 'package:sipnudge_machine_task/models/hydration_data.dart';
import 'package:sipnudge_machine_task/widgets/bar_chart_graph.dart';
import 'package:sipnudge_machine_task/widgets/empty_graph_state.dart';
import 'package:sipnudge_machine_task/widgets/line_chart_graph.dart';

import 'package:sipnudge_machine_task/widgets/custom_card.dart';
import 'package:sipnudge_machine_task/widgets/toggle_button.dart';

class DrinkCompletionCard extends StatelessWidget {
  final List<DailyHydrationData> data;
  final bool isLineChart;

  const DrinkCompletionCard({
    super.key,
    required this.data,
    required this.isLineChart,
  });

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return EmptyGraph();
    }

    return BlocProvider(
      create: (context) => ChartTouchCubit(),
      child: CustomCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Drink Completion(L)",
                  style: AppTypography.cardTitle.copyWith(color: Colors.white),
                ),
                ToggleButton(context: context),
              ],
            ),
            const SizedBox(height: 40),
            AspectRatio(
              aspectRatio: 1.4,
              child: isLineChart
                  ? LineChartGraph(data: data)
                  : BarChartGraph(data: data),
            ),
          ],
        ),
      ),
    );
  }
}
