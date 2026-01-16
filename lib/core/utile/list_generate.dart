import 'dart:math';
import 'package:sipnudge_machine_task/models/hydration_data.dart';

List<DailyHydrationData> generate365Days() {
  final random = Random();
  return List.generate(365, (i) {
    // Randomize intake to show variety in charts
    // water: 3.0 to 8.0 range
    final water = 3.0 + random.nextDouble() * 5.0;
    // food: 0.5 to 2.5 range
    final food = 0.5 + random.nextDouble() * 2.0;

    return DailyHydrationData(
      date: DateTime(2024, 1, 1).add(Duration(days: i)),
      waterLiters: double.parse(water.toStringAsFixed(1)),
      foodLiters: double.parse(food.toStringAsFixed(1)),
    );
  });
}
