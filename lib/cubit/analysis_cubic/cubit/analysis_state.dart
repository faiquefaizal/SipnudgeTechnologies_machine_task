class AnalysisState {
  final String selectedInterval;
  final String dateLabel;

  AnalysisState({required this.selectedInterval, required this.dateLabel});

  AnalysisState copyWith({String? selectedInterval, String? dateLabel}) {
    return AnalysisState(
      selectedInterval: selectedInterval ?? this.selectedInterval,
      dateLabel: dateLabel ?? this.dateLabel,
    );
  }
}
