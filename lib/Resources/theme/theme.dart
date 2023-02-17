// Package Dependencies
import 'package:flutter/material.dart';

// Resources
import 'color.dart';

class MyTheme {
  static ThemeData darkTheme() {
    return ThemeData(
        primaryColor: brandPrimary,
        scaffoldBackgroundColor: brandPrimary,
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
          titleSmall: const TextStyle(
              fontFamily: 'NunitoSans',
              color: brandPrimary,
              fontSize: 17.0,
              fontWeight: FontWeight.bold),
          bodyLarge: const TextStyle(
              fontFamily: 'NunitoSans',
              color: textPrimary,
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
              fontSize: 6.0,
              fontWeight: FontWeight.bold),
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: brandSecondary)
            .copyWith(background: brandPrimary));
  }
}
