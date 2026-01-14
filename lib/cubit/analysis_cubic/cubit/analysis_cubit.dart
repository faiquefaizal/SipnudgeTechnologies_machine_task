import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipnudge_machine_task/cubit/analysis_cubic/cubit/analysis_state.dart';

class AnalysisCubit extends Cubit<AnalysisState> {
  AnalysisCubit()
    : super(
        AnalysisState(
          selectedInterval: "Weekly",
          dateLabel: "Dec 16 - Dec 22, 2024",
        ),
      );

  void updateInterval(String interval) {
    emit(state.copyWith(selectedInterval: interval));
  }

  void nextDate() {
    // Logic to calculate next date would go here
    emit(state.copyWith(dateLabel: "Dec 23 - Dec 29, 2024"));
  }

  void previousDate() {
    emit(state.copyWith(dateLabel: "Dec 09 - Dec 15, 2024"));
  }
}
