// Package Dependencies
import 'package:first_app/Widgets/Components/Movie/MoviePosterWidget.dart';
import 'package:flutter/material.dart';

// Models
import '../../../Models/Movie.dart';

class MoviePostersWidget extends StatefulWidget {
  final Movies movies;
  const MoviePostersWidget({super.key, required this.movies});

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

  Column getMoviePostersLayout() {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < widget.movies.movies.length - 1; i += 2) {
      list.add(getMoviePostersColumn(
          widget.movies.movies[i], widget.movies.movies[i + 1]));
      list.add(const SizedBox(
        height: 20,
      ));
    }
    if (widget.movies.movies.length % 2 != 0) {
      list.add(getMoviePostersColumn(
          widget.movies.movies[widget.movies.movies.length - 1], null));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(16), child: getMoviePostersLayout());
  }
}
