// Package Dependencies
import 'package:first_app/Widgets/Screens/MovieWidget.dart';
import 'package:first_app/Widgets/Screens/TrailerWidget.dart';
import 'package:flutter/material.dart';

// Models
import '../../../Models/Movie.dart';

class NewReleaseBannerWidget extends StatefulWidget {
  final Movie movie;
  const NewReleaseBannerWidget({super.key, required this.movie});

  @override
  State<NewReleaseBannerWidget> createState() => _NewReleaseBannerWidgetState();
}

class _NewReleaseBannerWidgetState extends State<NewReleaseBannerWidget> {
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
    String appendedGenres = appendGenres(widget.movie.additionalDetails.genres);
    return Column(
      children: [
        InkWell(
          onTap: () => {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TrailerWidget(
                    movieName: widget.movie.name.toUpperCase(),
                    movieTrailerURLPath: widget.movie.trailerURLPath)))
          },
          child: Stack(alignment: AlignmentDirectional.bottomEnd, children: [
            FittedBox(
              fit: BoxFit.fill,
              child: Image.asset(widget.movie.carouselImages.first),
            ),
            IconButton(
              icon: const Icon(Icons.play_circle_outlined),
              color: Colors.white,
              onPressed: () => {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TrailerWidget(
                        movieName: widget.movie.name.toUpperCase(),
                        movieTrailerURLPath: widget.movie.trailerURLPath)))
              },
            )
          ]),
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: () => {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MovieWidget(movie: widget.movie)))
          },
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    width: 0.25,
                    color: const Color.fromRGBO(85, 85, 85, 1),
                    style: BorderStyle.solid)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        color: Colors.red[400],
                        child: const Text(
                          'New Release',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(8, 8, 0, 16),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "TRENDING",
                                style: TextStyle(
                                    color: Color.fromRGBO(85, 85, 85, 0.75),
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                widget.movie.name.toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              getCategoryWidgets(
                                  widget.movie.additionalDetails.categories),
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
                            ]),
                      ),
                    ]),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.red[400]),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(0))),
                      onPressed: () => {},
                      child: const Text(
                        "BOOK",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
