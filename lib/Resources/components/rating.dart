import 'package:flutter/material.dart';
import '../theme/color.dart';

class Rating extends StatelessWidget {
  final String text;

  const Rating({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        gradient: LinearGradient(
          colors: [
            otherPrimary.withOpacity(0.6),
            otherPrimary,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          letterSpacing: 1.2,
          fontFamily: 'NunitoSans',
          color: brandPrimary,
          fontSize: 11.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
