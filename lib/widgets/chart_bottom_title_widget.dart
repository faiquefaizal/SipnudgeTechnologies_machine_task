import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sipnudge_machine_task/core/theme/app_typography.dart';
import 'package:sipnudge_machine_task/core/utils/chart_utils.dart';
import 'package:sipnudge_machine_task/models/hydration_data.dart';

class ChartBottomTitleWidget extends StatelessWidget {
  final double value;
  final TitleMeta meta;
  final List<DailyHydrationData> data;

  const ChartBottomTitleWidget({
    super.key,
    required this.value,
    required this.meta,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final index = value.toInt();
    final text = ChartUtils.getBottomTitleForIndex(index, data);

    if (text.isEmpty) return const SizedBox();

    return SideTitleWidget(
      meta: meta,
      space: 10,
      child: Text(
        text,
        style: AppTypography.labelSmall.copyWith(color: Colors.white),
      ),
    );
  }
}
