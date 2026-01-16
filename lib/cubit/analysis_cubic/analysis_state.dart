import 'package:sipnudge_machine_task/models/hydration_data.dart';

/// State management for the Analysis feature.
///
/// Holds the current time interval, selected date, and the filtered list of hydration data.
class AnalysisState {
  final String selectedInterval;
  final DateTime currentDate;
  final List<DailyHydrationData> hydrationList;

  AnalysisState({
    required this.selectedInterval,
    required this.currentDate,
    required this.hydrationList,
  });

  /// Calculates the total water intake from the [hydrationList].
  double get totalWater =>
      hydrationList.fold(0, (sum, item) => sum + item.waterLiters);
  double get totalFood =>
      hydrationList.fold(0, (sum, item) => sum + item.foodLiters);

  /// Calculates the percentage of total intake that comes from water.
  int get waterPercentage {
    final total = totalWater + totalFood;
    if (total == 0) return 0;
    return ((totalWater / total) * 100).round();
  }

  int get foodPercentage {
    final total = totalWater + totalFood;
    if (total == 0) return 0;
    return ((totalFood / total) * 100).round();
  }

  AnalysisState copyWith({
    String? selectedInterval,
    DateTime? currentDate,
    List<DailyHydrationData>? hydrationList,
  }) {
    return AnalysisState(
      selectedInterval: selectedInterval ?? this.selectedInterval,
      currentDate: currentDate ?? this.currentDate,
      hydrationList: hydrationList ?? this.hydrationList,
    );
  }
}
