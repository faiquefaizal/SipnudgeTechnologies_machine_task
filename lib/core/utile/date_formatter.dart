class DateFormatter {
  static const List<String> _months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  static String formatDateLabel(DateTime date, String interval) {
    if (interval == "Yearly") {
      return "${date.year}";
    } else if (interval == "Monthly") {
      return "${_months[date.month - 1]} ${date.year}";
    } else {
      // Weekly: Mon - Sun
      final int daysSinceMonday = date.weekday - 1;
      final start = DateTime(
        date.year,
        date.month,
        date.day,
      ).subtract(Duration(days: daysSinceMonday));
      final end = start.add(const Duration(days: 6));

      String startMon = _months[start.month - 1];
      String endMon = _months[end.month - 1];

      if (start.year != end.year) {
        return "$startMon ${start.day}, ${start.year} - $endMon ${end.day}, ${end.year}";
      } else {
        return "$startMon ${start.day} - $endMon ${end.day}, ${end.year}";
      }
    }
  }
}
