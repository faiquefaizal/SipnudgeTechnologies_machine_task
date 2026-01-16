import 'package:flutter/material.dart';

import 'package:sipnudge_machine_task/core/theme/app_typography.dart';
import 'package:sipnudge_machine_task/widgets/custom_card.dart';

class HydrationEmptyState extends StatelessWidget {
  const HydrationEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 200, // Matching the height of the card content roughly
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.pie_chart_outline,
              size: 60,
              color: Colors.white54,
            ),
            const SizedBox(height: 16),
            Text(
              "No Source Data",
              style: AppTypography.cardTitle.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              "Track your intake to see sources.",
              style: AppTypography.labelSmall.copyWith(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
