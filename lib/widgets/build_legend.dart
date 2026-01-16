import 'package:flutter/material.dart';
import 'package:sipnudge_machine_task/core/theme/app_typography.dart';

class Buildlegend extends StatelessWidget {
  final Color color;
  final String label;
  final int percentage;
  const Buildlegend({
    super.key,
    required this.color,
    required this.label,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          "$label ($percentage%)",
          style: AppTypography.bodySmall.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
