// Package Dependencies
import 'package:flutter/material.dart';

// Widgets
import '../Components/Home/NewReleaseBannerWidget.dart';

// Models
import '../../Models/Movie.dart';

class HomeWidget extends StatefulWidget {
  final Movies movies;
  const HomeWidget({super.key, required this.movies});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  Movie? getNewReleasedMovie(Movies movies) {
    for (final movie in movies.movies) {
      if (movie.flags.isNewRelease == true) {
        return movie;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Movie? newReleaseMovie = getNewReleasedMovie(widget.movies);
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          newReleaseMovie != null
              ? NewReleaseBannerWidget(movie: newReleaseMovie)
              : Container(),
        ],
      ),
    );
  }
}
