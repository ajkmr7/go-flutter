// Package Dependencies
import 'package:flutter/material.dart';

// Widgets
import '../components/home/new_release_banner_widget.dart';
import 'package:first_app/widgets/components/home/movie_posters_widget.dart';

// Models
import '../../models/movie.dart';

// Constants
import 'package:first_app/resources/utitlity/constants.dart';

class HomeWidget extends StatefulWidget {
  final Movies movies;
  const HomeWidget({super.key, required this.movies});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  Movie? getNewReleasedMovie(Movies movies) {
    for (final movie in movies.movies) {
      if (movie.flags.contains(MovieFlag.isNewRelease) == true) {
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
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            newReleaseMovie != null
                ? NewReleaseBannerWidget(movie: newReleaseMovie)
                : Container(),
            const SizedBox(
              height: 24,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Now Showing',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            MoviePostersWidget(movies: widget.movies, isNowShowing: true),
            const SizedBox(
              height: 24,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Coming Soon',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            MoviePostersWidget(movies: widget.movies, isNowShowing: false),
          ],
        ),
      ),
    );
  }
}
