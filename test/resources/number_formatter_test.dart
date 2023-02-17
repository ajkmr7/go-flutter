// Package Dependencies
import 'package:flutter_test/flutter_test.dart';

// Resources
import 'package:first_app/resources/utitlity/number_formatter.dart';

void main() {
  group('Number Formatting', () {
    test('4-digit suffix K', () {
      var result = NumberFormatter.format(1200);
      expect(result, '1.2K');
    });
    test('5-digit suffix K', () {
      var result = NumberFormatter.format(12345);
      expect(result, '12.3K');
    });

    test('6-digit suffix K', () {
      var result = NumberFormatter.format(987654);
      expect(result, '988K');
    });

    test('8-digit suffix M', () {
      var result = NumberFormatter.format(85989543);
      expect(result, '86M');
    });

    test('11-digit suffix B', () {
      var result = NumberFormatter.format(42825671290);
      expect(result, '42.8B');
    });
  });
}
