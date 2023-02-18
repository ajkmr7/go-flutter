import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String text;
  const Category({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Text(text, style: Theme.of(context).textTheme.labelSmall));
  }
}
