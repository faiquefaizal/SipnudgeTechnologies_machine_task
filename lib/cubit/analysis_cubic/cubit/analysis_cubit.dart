import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipnudge_machine_task/core/utile/list_generate.dart';
import 'package:sipnudge_machine_task/cubit/analysis_cubic/cubit/analysis_state.dart';
import 'package:sipnudge_machine_task/models/hydration_data.dart';

class AnalysisCubit extends Cubit<AnalysisState> {
  final List<DailyHydrationData> _masterList = generate365Days();

  AnalysisCubit()
    : super(
        AnalysisState(
          selectedInterval: "Weekly",
          currentDate: DateTime(2024, 1, 1), // Starting point
          hydrationList: [],
        ),
      ) {
    _filterData(); // Load first week on start
  }

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
      // Calendar Month
      start = DateTime(anchor.year, anchor.month, 1);
      // Last day of month logic: Next month 1st minus 1 day
      final nextMonth = DateTime(anchor.year, anchor.month + 1, 1);
      end = nextMonth.subtract(
        const Duration(seconds: 1),
      ); // Last moment of current month

      final filtered = _masterList.where((item) {
        return item.date.isAfter(start.subtract(const Duration(seconds: 1))) &&
            item.date.isBefore(end.add(const Duration(seconds: 1)));
      }).toList();
      emit(state.copyWith(hydrationList: filtered));
    } else {
      // Weekly: Mon - Sun
      // Find previous Monday (or today if Monday)
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
      // Weekly
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

  void updateInterval(String interval) {
    emit(state.copyWith(selectedInterval: interval));
    _filterData();
  }
}
