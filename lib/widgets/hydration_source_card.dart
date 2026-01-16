import 'package:flutter/material.dart';
import 'package:sipnudge_machine_task/core/theme/app_colors.dart';
import 'package:sipnudge_machine_task/core/theme/app_typography.dart';
import 'package:sipnudge_machine_task/cubit/analysis_cubic/cubit/analysis_state.dart';
import 'package:sipnudge_machine_task/widgets/build_legend.dart';
import 'package:sipnudge_machine_task/widgets/hydration_empty_state.dart';

import 'package:sipnudge_machine_task/widgets/custom_card.dart';
import 'package:sipnudge_machine_task/widgets/piechart_widget.dart';

class HydrationSourceCard extends StatelessWidget {
  final AnalysisState state;

  const HydrationSourceCard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.totalWater == 0 && state.totalFood == 0) {
      return const HydrationEmptyState();
    }

    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hydration Source",
            style: AppTypography.cardTitle.copyWith(color: Colors.white),
          ),

          Row(
            children: [
              // Donut Chart
              SizedBox(
                height: 120,
                width: 120,
                child: Stack(
                  children: [
                    PieGraph(state: state),
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "100%", // Ideally this represents the completion of the daily goal, but design shows "100%"
                            style: AppTypography.displayLarge.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            "Water Intake",
                            style: AppTypography.labelSmall.copyWith(
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              // Legend
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Buildlegend(
                      color: AppColors.waterblue,
                      label: "Water",
                      percentage: state.waterPercentage,
                    ),
                    const SizedBox(height: 20),
                    Buildlegend(
                      color: AppColors.foodGreen,
                      label: "Food",
                      percentage: state.foodPercentage,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
