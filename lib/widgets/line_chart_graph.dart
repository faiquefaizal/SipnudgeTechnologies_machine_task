import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipnudge_machine_task/core/theme/app_colors.dart';
import 'package:sipnudge_machine_task/core/theme/app_typography.dart';

import 'package:sipnudge_machine_task/cubit/chart_touch_cubit.dart';
import 'package:sipnudge_machine_task/widgets/chart_bottom_title_widget.dart';

import 'package:sipnudge_machine_task/models/hydration_data.dart';

class LineChartGraph extends StatelessWidget {
  final List<DailyHydrationData> data;

  const LineChartGraph({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChartTouchCubit, int>(
      builder: (context, touchedIndex) {
        return LineChart(
          LineChartData(
            minX: 0,
            maxX: (data.length - 1).toDouble(),
            minY: 0,
            maxY: 1.2,

            lineTouchData: LineTouchData(
              enabled: true,
              touchCallback: (FlTouchEvent event, lineTouchResponse) {
                if (!event.isInterestedForInteractions ||
                    lineTouchResponse == null ||
                    lineTouchResponse.lineBarSpots == null) {
                  context.read<ChartTouchCubit>().setTouchedIndex(-1);
                  return;
                }
                if (lineTouchResponse.lineBarSpots!.isNotEmpty) {
                  context.read<ChartTouchCubit>().setTouchedIndex(
                    lineTouchResponse.lineBarSpots!.first.spotIndex,
                  );
                }
              },
              getTouchedSpotIndicator:
                  (LineChartBarData barData, List<int> spotIndexes) {
                    return spotIndexes.map((spotIndex) {
                      return TouchedSpotIndicatorData(
                        FlLine(color: Colors.transparent),
                        FlDotData(
                          getDotPainter: (spot, percent, barData, index) {
                            return FlDotCirclePainter(
                              radius: 8,
                              color: Colors.white,
                              strokeWidth: 5,
                              strokeColor: AppColors.activePurple,
                            );
                          },
                        ),
                      );
                    }).toList();
                  },
              touchTooltipData: LineTouchTooltipData(
                getTooltipColor: (touchedSpots) => Colors.white,
                getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                  return touchedBarSpots.map((barSpot) {
                    final flSpot = barSpot;
                    return LineTooltipItem(
                      '${(flSpot.y * 100).toInt()}%',
                      const TextStyle(
                        color: AppColors.tooltipText,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    );
                  }).toList();
                },
                tooltipPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
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
            lineBarsData: [
              LineChartBarData(
                spots: data.asMap().entries.map((entry) {
                  return FlSpot(
                    entry.key.toDouble(),
                    entry.value.percentage.clamp(0.0, 1.0),
                  );
                }).toList(),
                isCurved: true,
                color: AppColors.activePurple, // Line color
                barWidth: 3,
                isStrokeCapRound: true,
                dotData: FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, barData, index) {
                    return FlDotCirclePainter(
                      radius: 4,
                      color: Colors.white,
                      strokeWidth: 0,
                    );
                  },
                ),
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.waterblue.withValues(alpha: 0.4),
                      AppColors.waterblue.withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
            ],
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
            if (value > 1.0) return const SizedBox(); // don't show above 100%
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
}
