import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipnudge_machine_task/core/theme/app_colors.dart';
import 'package:sipnudge_machine_task/core/theme/app_typography.dart';

import 'package:sipnudge_machine_task/cubit/chart_touch_cubit.dart';
import 'package:sipnudge_machine_task/widgets/chart_bottom_title_widget.dart';
import 'package:sipnudge_machine_task/models/hydration_data.dart';

/// Widget for rendering the hydration data as a bar chart.
class BarChartGraph extends StatelessWidget {
  final List<DailyHydrationData> data;

  const BarChartGraph({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChartTouchCubit, int>(
      builder: (context, touchedIndex) {
        return BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 1.0,
            barTouchData: BarTouchData(
              enabled: true,
              touchCallback: (FlTouchEvent event, barTouchResponse) {
                if (!event.isInterestedForInteractions ||
                    barTouchResponse == null ||
                    barTouchResponse.spot == null) {
                  context.read<ChartTouchCubit>().setTouchedIndex(-1);
                  return;
                }
                context.read<ChartTouchCubit>().setTouchedIndex(
                  barTouchResponse.spot!.touchedBarGroupIndex,
                );
              },
              touchTooltipData: BarTouchTooltipData(
                tooltipBorderRadius: BorderRadius.circular(25),
                getTooltipColor: (group) => Colors.white,
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  return BarTooltipItem(
                    '${(rod.toY * 100).toInt()}%',
                    const TextStyle(
                      color: AppColors.tooltipText,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  );
                },
                tooltipPadding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                tooltipMargin: 8,

                fitInsideHorizontally: true,
                fitInsideVertically: true,
              ),
            ),
            titlesData: _buildTitlesData(),
            gridData: const FlGridData(show: false),
            borderData: FlBorderData(show: false),
            barGroups: _generateGroups(touchedIndex),
          ),
        );
      },
    );
  }

  FlTitlesData _buildTitlesData() {
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: (value, meta) =>
              ChartBottomTitleWidget(value: value, meta: meta, data: data),
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
          interval: 0.2,
          getTitlesWidget: (value, meta) {
            if (value > 1.0) return const SizedBox();
            return SideTitleWidget(
              meta: meta,
              child: Text(
                '${(value * 100).toInt()}%',
                style: AppTypography.labelSmall.copyWith(color: Colors.white70),
              ),
            );
          },
        ),
      ),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }

  List<BarChartGroupData> _generateGroups(int touchedIndex) {
    return data.asMap().entries.map((entry) {
      final index = entry.key;
      final dayData = entry.value;
      final isTouched = index == touchedIndex;

      double barWidth = 30;
      if (data.length > 20) {
        barWidth = 6;
      } else if (data.length > 10) {
        barWidth = 16;
      }

      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: dayData.percentage.clamp(0.0, 1.0),
            color: isTouched
                ? AppColors.chartBarSelected
                : AppColors.chartBarDefault,
            width: barWidth,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
        ],
        showingTooltipIndicators: isTouched ? [0] : [],
      );
    }).toList();
  }
}
