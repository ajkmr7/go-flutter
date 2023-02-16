// Package Dependencies
import 'package:flutter_test/flutter_test.dart';

// Resources
import 'package:first_app/resources/Utitlity/date_time_formatter.dart';

void main() {
  test('ISO8601 to DD/MMM/YYYY', () {
    var result =
        DateTimeFormatter.convertISO8601ToyMMMD('2023-02-16T21:26:14+0000');
    expect(result, 'Feb 16, 2023');
  });

  test('ISO8601 to ddd/MM/DD', () {
    var result = DateTimeFormatter.convertISO8601FormatToMMMEd(
        '2023-02-16T21:26:14.0000');
    expect(result, 'Thu, Feb 16');
  });

  test('Any Format to ISO8601', () {
    var result =
        DateTimeFormatter.convertToISO8601(DateTime(2017, 9, 7, 17, 30));
    expect(result, "2017-09-07T17:30:00.000");
  });

  group('Difference b/w dates', () {
    test('seconds difference', () {
      var result = DateTimeFormatter.calculateTimeDifferenceBetween(
          '2023-02-16T21:26:14+0000', '2023-02-16T21:26:56+0000');
      expect(result, 'About 42 seconds ago');
    });

    test('minutes difference', () {
      var result = DateTimeFormatter.calculateTimeDifferenceBetween(
          '2023-02-16T21:00:14+0000', '2023-02-16T21:26:56+0000');
      expect(result, 'About 26 minutes ago');
    });

    test('hours difference', () {
      var result = DateTimeFormatter.calculateTimeDifferenceBetween(
          '2023-02-16T15:26:14+0000', '2023-02-16T21:26:56+0000');
      expect(result, 'About 6 hours ago');
    });

    test('days difference', () {
      var result = DateTimeFormatter.calculateTimeDifferenceBetween(
          '2023-02-15T21:06:14+0000', '2023-02-16T21:26:56+0000');
      expect(result, 'About a day ago');
    });

    test('years difference', () {
      var result = DateTimeFormatter.calculateTimeDifferenceBetween(
          '2022-01-16T21:26:14+0000', '2023-02-16T21:26:56+0000');
      expect(result, 'About an year ago');
    });
  });
}
