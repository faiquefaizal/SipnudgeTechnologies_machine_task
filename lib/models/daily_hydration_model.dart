class DailyHydrationData {
  final DateTime date;
  final double waterLiters;
  final double foodLiters;

  DailyHydrationData({
    required this.date,
    required this.waterLiters,
    required this.foodLiters,
  });

  // We assume the target is 10 for all calculations
  static const double target = 10.0;

  double get totalLiters => waterLiters + foodLiters;

  // This gives you the 0.0 to 1.0 value for the chart
  double get percentage => totalLiters / target;
}
