// Package Dependencies
import 'package:flutter/material.dart';

// Constants
import 'package:first_app/resources/utitlity/constants.dart';

// Widgets
import 'package:first_app/widgets/components/movie/movie_poster_widget.dart';

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
  List<Widget> getMoviePostersByColumn(
      {required Movies movies, required bool isFirstRow}) {
    List<Widget> list = <Widget>[];
    var i = isFirstRow ? 0 : 1;
    bool isFirstColumn = true;
    double aspectRatio = isFirstRow ? 1.75 : 1.5;
    for (; i < movies.movies.length - 1; i += 2) {
      list.add(
          MoviePosterWidget(movie: movies.movies[i], aspectRatio: aspectRatio));
      list.add(const SizedBox(height: 16));
      isFirstColumn = !isFirstColumn;
      aspectRatio = aspectRatio == 1.75 ? 1.5 : 1.75;
    }

    return list;
  }

  Widget getMoviePostersLayout({required Movies movies}) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: getMoviePostersByColumn(movies: movies, isFirstRow: true),
          ),
          Column(
            children:
                getMoviePostersByColumn(movies: movies, isFirstRow: false),
          ),
        ]);
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
        margin: const EdgeInsets.symmetric(horizontal: 32.0),
        child: getMoviePostersLayout(movies: filterMovies()));
  }
}
