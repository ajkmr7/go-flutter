// Package Dependencies
import 'package:flutter/material.dart';

// Theme
import 'package:first_app/resources/theme/color.dart';

class AdditonalDetail extends StatelessWidget {
  final String title;
  final String subTitle;
  const AdditonalDetail(
      {super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(minHeight: 58, minWidth: 98),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          border:
              Border.all(color: textPrimary.withAlpha((0.05 * 255).round())),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontFamily: 'NunitoSans',
                  color: textPrimary.withAlpha((0.6 * 255).round()),
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(subTitle, style: Theme.of(context).textTheme.titleMedium)
          ],
        ));
  }
}
