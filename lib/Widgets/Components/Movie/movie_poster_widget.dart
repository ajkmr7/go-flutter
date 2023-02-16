// Package Dependencies
import 'package:flutter/material.dart';

// Constants
import 'package:first_app/resources/constants.dart';
import 'package:first_app/resources/constants_extensions.dart';

// Models
import '../../../models/movie.dart';

// Widgets
import '../../screens/trailer_widget.dart';
import 'package:first_app/widgets/screens/movie_widget.dart';

class MoviePosterWidget extends StatelessWidget {
  final Movie movie;
  const MoviePosterWidget({super.key, required this.movie});

  Widget getReleaseDateWidget() {
    List<Widget> list = <Widget>[];
    list.add(const SizedBox(height: 6));
    list.add(Text('Releasing on release date'.toUpperCase(),
        style: const TextStyle(
            fontSize: 12, color: Color.fromRGBO(85, 85, 85, 0.75))));
    list.add(const SizedBox(height: 6));
    return Row(children: list);
  }

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

  String appendGenres(List<MovieGenre> genres) {
    String appendedGenres = "";
    for (var i = 0; i < genres.length; i++) {
      if (i != genres.length - 1) {
        appendedGenres += '${genres[i].getName()}, ';
      } else {
        appendedGenres += genres[i].getName();
      }
    }
    return appendedGenres;
  }

  @override
  Widget build(BuildContext context) {
    String appendedGenres = appendGenres(movie.additionalDetails.genres);
    double posterWidth = (MediaQuery.of(context).size.width - 40) / 2;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MovieWidget(movie: movie)))
          },
          child: SizedBox(
            width: posterWidth,
            child: Stack(alignment: AlignmentDirectional.bottomEnd, children: [
              FittedBox(
                fit: BoxFit.fill,
                child: Image.asset(movie.poster),
              ),
              IconButton(
                icon: const Icon(Icons.play_circle_outlined),
                color: Colors.white,
                onPressed: () => {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TrailerWidget(
                          movieName: movie.name.toUpperCase(),
                          movieTrailerURLPath: movie.trailerURLPath)))
                },
              )
            ]),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          movie.name.toUpperCase(),
          style: const TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        !movie.flags.contains(MovieFlag.isNowShowing)
            ? getReleaseDateWidget()
            : Container(),
        const SizedBox(
          height: 8,
        ),
        getCategoryWidgets(movie.additionalDetails.categories),
        const SizedBox(
          height: 6,
        ),
        Text(
          appendedGenres,
          style: const TextStyle(
              color: Color.fromRGBO(85, 85, 85, 0.75),
              fontSize: 10,
              fontWeight: FontWeight.normal),
        ),
        const SizedBox(
          height: 8,
        ),
        movie.flags.contains(MovieFlag.isBookingsOpen) == true
            ? TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red[400]),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(0))),
                onPressed: () => {},
                child: const Text(
                  "BOOK",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ))
            : Container()
      ],
    );
  }
}