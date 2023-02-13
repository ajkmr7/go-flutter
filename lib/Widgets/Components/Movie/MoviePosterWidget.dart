// Package Dependencies
import 'package:first_app/Widgets/Screens/MovieWidget.dart';
import 'package:flutter/material.dart';

// Models
import '../../../Models/Movie.dart';

// Widgets
import '../../Screens/TrailerWidget.dart';

class MoviePosterWidget extends StatelessWidget {
  final Movie movie;
  const MoviePosterWidget({super.key, required this.movie});

  Widget getCategoryWidgets(List<String> strings) {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < strings.length; i++) {
      list.add(
        Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.grey[200],
            ),
            child: Text(
              strings[i],
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

  String appendGenres(List<String> genres) {
    String appendedGenres = "";
    for (var i = 0; i < genres.length; i++) {
      if (i != genres.length - 1) {
        appendedGenres += '${genres[i]}, ';
      } else {
        appendedGenres += genres[i];
      }
    }
    return appendedGenres;
  }

  @override
  Widget build(BuildContext context) {
    String appendedGenres = appendGenres(movie.additionalDetails.genres);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MovieWidget(movie: movie)))
          },
          child: Container(
            width: (MediaQuery.of(context).size.width - 60) / 2,
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
                          movieName: movie.name,
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
          movie.name,
          style: const TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
        ),
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
        TextButton(
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
      ],
    );
  }
}
