import 'package:intl/intl.dart';

import '../common/presentation/ui_strings.dart';

/// Extension to provide user-friendly date formatting for DateTime objects.
extension DateTimeFormatting on DateTime {
  /// Returns a user-friendly formatted string:
  /// - Same day: "14:30" (just the time)
  /// - Yesterday: "Yesterday 14:30"
  /// - Day before yesterday or earlier: "19/10 14:30" (day/month and time)
  String toUserFriendlyString() {
    final now = DateTime.now();
    final localDateTime = toLocal();
    final nowLocal = now.toLocal();

    final today = DateTime(nowLocal.year, nowLocal.month, nowLocal.day);
    final createdDate = DateTime(
      localDateTime.year,
      localDateTime.month,
      localDateTime.day,
    );
    final yesterday = today.subtract(const Duration(days: 1));

    final timeFormat = DateFormat('HH:mm');
    final timeString = timeFormat.format(localDateTime);

    if (createdDate == today) {
      return timeString;
    }

    if (createdDate == yesterday) {
      return '${UIStrings.yesterdayAt} $timeString';
    }

    final dateFormat = DateFormat('dd/MM');
    final dateString = dateFormat.format(localDateTime);
    return '$dateString $timeString';
  }
}
