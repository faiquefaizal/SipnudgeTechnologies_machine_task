import 'package:flutter/material.dart';
import 'package:sipnudge_machine_task/core/theme/app_colors.dart';
import 'package:sipnudge_machine_task/core/theme/app_typography.dart';

class EmptyGraph extends StatelessWidget {
  const EmptyGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      // Ensure height is somewhat consistent with populated chart
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.analysisBg,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.bar_chart_outlined, size: 60, color: Colors.white54),
          const SizedBox(height: 16),
          Text(
            "No Data Available",
            style: AppTypography.cardTitle.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            "No hydration records found for this period.",
            style: AppTypography.labelSmall.copyWith(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
