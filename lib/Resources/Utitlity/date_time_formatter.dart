// Package Dependencies
import 'package:intl/intl.dart';

class DateTimeFormatter {
  /// Convert `ISO Format` (2022-06-02T22:30:00.000Z) to `MMM/DD/YYYY` (Jun 02, 2022)
  static String convertISO8601ToyMMMD(String _) {
    final dateTime = DateTime.parse(_);
    final formatter = DateFormat.yMMMd();
    return formatter.format(dateTime);
  }

  /// Convert `ISO Format` (2022-06-02T22:30:00.000Z) to `ddd/MM/DD` (Thu, Jun 02)
  static String convertISO8601FormatToMMMEd(String _) {
    final dateTime = DateTime.parse(_);
    final formatter = DateFormat.MMMEd();
    return formatter.format(dateTime);
  }

  /// Convert Any Date Format String to ISO Format (2022-06-02T22:30:00.000)
  static String convertToISO8601(DateTime _) => _.toIso8601String();

  /// Return difference between any two dates in th following format:
  /// `About x seconds/minutes/hours/days/years ago`
  static String calculateTimeDifferenceBetween(String fromDate, String toDate) {
    final startDate = DateTime.parse(fromDate);
    final endDate = DateTime.parse(toDate);

    int seconds = endDate.difference(startDate).inSeconds;
    if (seconds < 60) {
      return seconds == 1 ? 'About a second ago' : 'About $seconds seconds ago';
    } else if (seconds >= 60 && seconds < 60 * 60) {
      return seconds >= 60 && seconds < 60 * 2
          ? 'About a minute ago'
          : 'About ${startDate.difference(endDate).inMinutes.abs()} minutes ago';
    } else if (seconds >= 60 * 60 && seconds < 60 * 60 * 24) {
      return seconds >= 60 * 60 && seconds < 60 * 60 * 2
          ? 'About an hour ago'
          : 'About ${startDate.difference(endDate).inHours.abs()} hours ago';
    } else if (startDate.difference(endDate).inDays.abs() < 365) {
      return seconds >= 60 * 60 * 24 && seconds < 60 * 60 * 24 * 2
          ? 'About a day ago'
          : 'About ${startDate.difference(endDate).inDays.abs()} days ago';
    } else {
      return seconds >= 60 * 60 * 24 * 365 && seconds < 60 * 60 * 24 * 365 * 2
          ? 'About an year ago'
          : 'About ${(startDate.difference(endDate).inDays.abs() / 365).round()} years ago';
    }
  }
}
