import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sipnudge_machine_task/core/theme/app_colors.dart';
import 'package:sipnudge_machine_task/cubit/analysis_cubic/cubit/analysis_state.dart';

class PieGraph extends StatelessWidget {
  final AnalysisState state;
  const PieGraph({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sectionsSpace: 0,
        centerSpaceRadius: 45,
        startDegreeOffset: -90,
        sections: [
          PieChartSectionData(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.waterLinertop, AppColors.waterLinerbottom],
            ),
            value: state.waterPercentage.toDouble(),
            title: '',
            radius: 8, // thin ring
            showTitle: false,
          ),
          PieChartSectionData(
            color: AppColors.foodGreen,
            value: state.foodPercentage.toDouble(),
            title: '',
            radius: 8, // thin ring
            showTitle: false,
          ),
        ],
      ),
    );
  }
}
