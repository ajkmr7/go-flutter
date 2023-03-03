// Package Dependencies
import 'package:flutter/material.dart';

// Resources
import 'color.dart';

class MyTheme {
  static ThemeData darkTheme() {
    return ThemeData(
        primaryColor: brandPrimary,
        scaffoldBackgroundColor: brandPrimary,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              foregroundColor: brandPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
              minimumSize: const Size(0, 0),
              backgroundColor: buttonPrimary,
              textStyle: const TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 11.0,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              disabledBackgroundColor:
                  buttonPrimary.withAlpha((0.4 * 255).round())),
        ),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontFamily: 'NunitoSans',
            color: textPrimary,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: const TextStyle(
            fontFamily: 'NunitoSans',
            color: textPrimary,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          displaySmall: const TextStyle(
            fontFamily: 'NunitoSans',
            color: textPrimary,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: const TextStyle(
            fontFamily: 'NunitoSans',
            color: textPrimary,
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: TextStyle(
              fontFamily: 'NunitoSans',
              color: textPrimary.withAlpha((0.6 * 255).round()),
              fontSize: 17.0,
              fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(
              fontFamily: 'NunitoSans',
              color: textPrimary.withAlpha((0.6 * 255).round()),
              fontSize: 15.0,
              fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(
              fontFamily: 'NunitoSans',
              color: textPrimary.withAlpha((0.4 * 255).round()),
              fontSize: 13.0,
              fontWeight: FontWeight.normal),
          labelLarge: const TextStyle(
              fontFamily: 'NunitoSans',
              color: brandPrimary,
              fontSize: 17.0,
              fontWeight: FontWeight.bold),
          labelMedium: TextStyle(
              fontFamily: 'NunitoSans',
              color: textPrimary.withAlpha((0.6 * 255).round()),
              fontSize: 10.0,
              fontWeight: FontWeight.normal),
          labelSmall: const TextStyle(
              fontFamily: 'NunitoSans',
              color: brandPrimary,
              fontSize: 7.0,
              fontWeight: FontWeight.bold),
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: brandSecondary)
            .copyWith(background: brandPrimary));
  }
}
