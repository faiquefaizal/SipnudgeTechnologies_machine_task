import 'package:sipnudge_machine_task/models/hydration_data.dart';

class AnalysisState {
  final String selectedInterval; // "Weekly" or "Monthly"
  final DateTime currentDate;
  final List<DailyHydrationData> hydrationList;

  AnalysisState({
    required this.selectedInterval,
    required this.currentDate,
    required this.hydrationList,
  });

  // Getters for the Donut Chart (Math happens here automatically)
  double get totalWater =>
      hydrationList.fold(0, (sum, item) => sum + item.waterLiters);
  double get totalFood =>
      hydrationList.fold(0, (sum, item) => sum + item.foodLiters);

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
