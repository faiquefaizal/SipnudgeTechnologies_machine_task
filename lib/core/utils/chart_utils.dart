import 'package:sipnudge_machine_task/models/hydration_data.dart';

class ChartUtils {
  static String getBottomTitleForIndex(
    int index,
    List<DailyHydrationData> data,
  ) {
    if (index < 0 || index >= data.length) return "";

    final date = data[index].date;
    String text = "";

    // Y-Axis Labels Logic
    if (data.length > 20) {
      // Monthly view (approx 30 days)
      // Show every 5th day: 5, 10, 15, 20, 25, 30
      if (index % 5 == 4) {
        // 0-indexed, so 4 is the 5th item
        text = "${date.day}";
      }
    } else if (data.length > 7 && data.length <= 12) {
      // Yearly view (12 months)
      // Show month abbreviation
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
      // Weekly (7 days)
      text = "${date.day}";
    }

    return text;
  }
}
