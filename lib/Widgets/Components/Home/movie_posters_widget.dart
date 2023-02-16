// Constants
import 'package:first_app/resources/constants.dart';

// Package Dependencies
import 'package:first_app/widgets/components/movie/movie_poster_widget.dart';
import 'package:flutter/material.dart';

// Models
import '../../../models/movie.dart';

class MoviePostersWidget extends StatefulWidget {
  final Movies movies;
  final bool isNowShowing;
  const MoviePostersWidget(
      {super.key, required this.movies, required this.isNowShowing});

  @override
  State<MoviePostersWidget> createState() => _MoviePostersWidgetState();
}

class _MoviePostersWidgetState extends State<MoviePostersWidget> {
  Row getMoviePostersColumn(Movie movie1, Movie? movie2) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      MoviePosterWidget(movie: movie1),
      if (movie2 != null) MoviePosterWidget(movie: movie2),
    ]);
  }

  Column getMoviePostersLayout({required Movies movies}) {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < movies.movies.length - 1; i += 2) {
      list.add(getMoviePostersColumn(movies.movies[i], movies.movies[i + 1]));
      list.add(const SizedBox(
        height: 20,
      ));
    }
    if (movies.movies.length % 2 != 0) {
      list.add(getMoviePostersColumn(movies.movies.last, null));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: list,
    );
  }

  Movies filterMovies() {
    Movies movies = Movies(movies: []);
    for (var i = 0; i < widget.movies.movies.length; i++) {
      if (widget.movies.movies[i].flags.contains(MovieFlag.isNowShowing) ==
          widget.isNowShowing) {
        movies.movies.add(widget.movies.movies[i]);
      }
    }
    return movies;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(16),
        child: getMoviePostersLayout(movies: filterMovies()));
  }
}
