import 'package:flutter/material.dart';

class SimilarMovieWidget extends StatelessWidget {
  final String poster;
  final String name;
  const SimilarMovieWidget(
      {super.key, required this.name, required this.poster});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Material(
          elevation: 8,
          shadowColor: const Color.fromRGBO(0, 0, 0, 0.1),
          borderRadius: BorderRadius.circular(20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: SizedBox(
              height: 200,
              child: Image.asset(poster),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          name,
          softWrap: true,
          style: const TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
