import 'package:flutter/material.dart';
import '../theme/color.dart';

class Rating extends StatelessWidget {
  final String text;
  const Rating({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0x99FFBB00),
            otherPrimary,
          ],
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.transparent,
        ),
      ),
    );
  }
}
