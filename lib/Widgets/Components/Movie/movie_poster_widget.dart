// Package Dependencies
import 'package:first_app/resources/components/rating.dart';
import 'package:flutter/material.dart';

// Constants
import 'package:first_app/resources/utitlity/constants.dart';
import 'package:first_app/resources/utitlity/constants_extensions.dart';

// Models
import '../../../models/movie.dart';

// Widgets
import 'package:first_app/widgets/screens/movie_widget.dart';

class MoviePosterWidget extends StatelessWidget {
  final Movie movie;
  final double aspectRatio;
  const MoviePosterWidget(
      {super.key, required this.movie, required this.aspectRatio});

  Widget getCategoryWidgets(List<MovieCategory> categories) {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < categories.length; i++) {
      list.add(
        Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.grey[200],
            ),
            child: Text(
              categories[i].getName(),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 8,
                  fontWeight: FontWeight.bold),
            )),
      );
      list.add(
        const SizedBox(
          width: 4,
        ),
      );
    }
    return Row(children: list);
  }

  @override
  Widget build(BuildContext context) {
    double posterWidth = (MediaQuery.of(context).size.width - 80) / 2;
    double posterHeight = posterWidth * aspectRatio;

    return InkWell(
      onTap: () => {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => MovieWidget(movie: movie)))
      },
      child: Stack(alignment: AlignmentDirectional.topEnd, children: [
        Stack(alignment: AlignmentDirectional.bottomStart, children: [
          Stack(children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              child: SizedBox(
                width: posterWidth,
                height: posterHeight,
                child: Image.asset(
                  movie.poster,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
                height: posterHeight,
                width: posterWidth,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: FractionalOffset.center,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Theme.of(context).primaryColor.withAlpha(0),
                    Theme.of(context).primaryColor,
                  ],
                ))),
          ]),
          Container(
              margin: const EdgeInsets.only(left: 8, bottom: 8),
              child: Text(movie.name,
                  style: Theme.of(context).textTheme.titleMedium)),
        ]),
        Container(
            margin: const EdgeInsets.only(right: 8, top: 8),
            child: Rating(text: movie.additionalDetails.rating.toString())),
      ]),
    );
  }
}
