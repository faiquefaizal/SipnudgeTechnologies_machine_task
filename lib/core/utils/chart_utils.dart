import 'package:sipnudge_machine_task/models/hydration_data.dart';

class ChartUtils {
  /// Determines the bottom axis label for a given index based on the view duration (Weekly, Monthly, Yearly).
  static String getBottomTitleForIndex(
    int index,
    List<DailyHydrationData> data,
  ) {
    if (index < 0 || index >= data.length) return "";

    final date = data[index].date;
    String text = "";

    if (data.length > 20) {
      if (index % 5 == 4) {
        text = "${date.day}";
      }
    } else if (data.length > 7 && data.length <= 12) {
      const months = [
        "J",
        "F",
        "M",
        "A",
        "M",
        "J",
        "J",
        "A",
        "S",
        "O",
        "N",
        "D",
      ];
      text = months[date.month - 1];
    } else {
      text = "${date.day}";
    }

    return text;
  }
}
