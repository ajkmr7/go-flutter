import 'package:flutter/material.dart';
import '../theme/color.dart';

class Rating extends StatelessWidget {
  final String text;
  const Rating({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: otherPrimary),
        child: Text(
          text,
          style: const TextStyle(
              fontFamily: 'NunitoSans',
              color: brandPrimary,
              fontSize: 13.0,
              fontWeight: FontWeight.bold),
        ));
  }
}
