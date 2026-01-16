/// Model representing daily hydration records including water and food intake.
class DailyHydrationData {
  final DateTime date;
  final double waterLiters;
  final double foodLiters;

  DailyHydrationData({
    required this.date,
    required this.waterLiters,
    required this.foodLiters,
  });

  /// The target daily intake in liters, used for percentage calculation.
  static const double target = 10.0;

  double get totalLiters => waterLiters + foodLiters;

  /// Calculates the completion percentage (0.0 - 1.0) based on [totalLiters] and [target].
  double get percentage => totalLiters / target;
}
