import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipnudge_machine_task/data/mock_data.dart';
import 'package:sipnudge_machine_task/cubit/analysis_state.dart';
import 'package:sipnudge_machine_task/models/hydration_data.dart';

/// Cubit responsible for managing the analysis state and filtering hydration data.
class AnalysisCubit extends Cubit<AnalysisState> {
  final List<DailyHydrationData> _masterList = generate365Days();

  AnalysisCubit()
    : super(
        AnalysisState(
          selectedInterval: "Weekly",
          currentDate: DateTime(2024, 1, 1),
          hydrationList: [],
        ),
      ) {
    _filterData();
  }

  /// Filters the master hydration list based on the selected [interval] and [currentDate].
  ///
  /// Supports "Yearly", "Monthly", and "Weekly" intervals.
  void _filterData() {
    final anchor = state.currentDate;
    final interval = state.selectedInterval;

    DateTime start;
    DateTime end;

    if (interval == "Yearly") {
      start = DateTime(anchor.year, 1, 1);
      end = DateTime(anchor.year, 12, 31, 23, 59, 59);

      final yearlyRaw = _masterList.where((item) {
        return item.date.isAfter(start.subtract(const Duration(seconds: 1))) &&
            item.date.isBefore(end.add(const Duration(seconds: 1)));
      }).toList();

      List<DailyHydrationData> monthlyAggregated = [];
      for (int i = 1; i <= 12; i++) {
        final monthData = yearlyRaw.where((e) => e.date.month == i).toList();
        double totalWater = 0;
        double totalFood = 0;

        for (var d in monthData) {
          totalWater += d.waterLiters;
          totalFood += d.foodLiters;
        }

        double avgWater = monthData.isNotEmpty
            ? totalWater / monthData.length
            : 0;
        double avgFood = monthData.isNotEmpty
            ? totalFood / monthData.length
            : 0;

        monthlyAggregated.add(
          DailyHydrationData(
            date: DateTime(anchor.year, i, 1),
            waterLiters: avgWater,
            foodLiters: avgFood,
          ),
        );
      }
      emit(state.copyWith(hydrationList: monthlyAggregated));
    } else if (interval == "Monthly") {
      start = DateTime(anchor.year, anchor.month, 1);

      final nextMonth = DateTime(anchor.year, anchor.month + 1, 1);
      end = nextMonth.subtract(const Duration(seconds: 1));

      final filtered = _masterList.where((item) {
        return item.date.isAfter(start.subtract(const Duration(seconds: 1))) &&
            item.date.isBefore(end.add(const Duration(seconds: 1)));
      }).toList();
      emit(state.copyWith(hydrationList: filtered));
    } else {
      final int daysSinceMonday = anchor.weekday - 1;
      start = DateTime(
        anchor.year,
        anchor.month,
        anchor.day,
      ).subtract(Duration(days: daysSinceMonday));
      end = start.add(
        const Duration(days: 6, hours: 23, minutes: 59, seconds: 59),
      );

      final filtered = _masterList.where((item) {
        return item.date.isAfter(start.subtract(const Duration(seconds: 1))) &&
            item.date.isBefore(end.add(const Duration(seconds: 1)));
      }).toList();

      emit(state.copyWith(hydrationList: filtered));
    }
  }

  /// Moves the current date forward by one unit of the selected interval (Year, Month, or Week).
  void next() {
    final interval = state.selectedInterval;
    if (interval == "Yearly") {
      emit(
        state.copyWith(
          currentDate: DateTime(
            state.currentDate.year + 1,
            state.currentDate.month,
          ),
        ),
      );
    } else if (interval == "Monthly") {
      emit(
        state.copyWith(
          currentDate: DateTime(
            state.currentDate.year,
            state.currentDate.month + 1,
            1,
          ),
        ),
      );
    } else {
      emit(
        state.copyWith(
          currentDate: state.currentDate.add(const Duration(days: 7)),
        ),
      );
    }
    _filterData();
  }

  void previous() {
    final interval = state.selectedInterval;
    if (interval == "Yearly") {
      emit(
        state.copyWith(
          currentDate: DateTime(
            state.currentDate.year - 1,
            state.currentDate.month,
          ),
        ),
      );
    } else if (interval == "Monthly") {
      emit(
        state.copyWith(
          currentDate: DateTime(
            state.currentDate.year,
            state.currentDate.month - 1,
            1,
          ),
        ),
      );
    } else {
      emit(
        state.copyWith(
          currentDate: state.currentDate.subtract(const Duration(days: 7)),
        ),
      );
    }
    _filterData();
  }

  /// Updates the selected interval and refreshes the data.
  void updateInterval(String interval) {
    emit(state.copyWith(selectedInterval: interval));
    _filterData();
  }
}
