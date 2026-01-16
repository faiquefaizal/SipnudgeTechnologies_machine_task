import 'dart:math';
import 'package:sipnudge_machine_task/models/hydration_data.dart';

/// Generates mock hydration data for 365 days starting from Jan 1, 2024.
///
/// Simulates randomized water and food intake values for testing visualization.
List<DailyHydrationData> generate365Days() {
  final random = Random();
  return List.generate(365, (i) {
    final water = 3.0 + random.nextDouble() * 5.0;
    final food = 0.5 + random.nextDouble() * 2.0;

    return DailyHydrationData(
      date: DateTime(2024, 1, 1).add(Duration(days: i)),
      waterLiters: double.parse(water.toStringAsFixed(1)),
      foodLiters: double.parse(food.toStringAsFixed(1)),
    );
  });
}
