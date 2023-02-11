// Package Dependencies
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovieDetailsWidget extends StatelessWidget {
  final double rating;
  final int votes;
  final List<String> categories;
  final String runtime;
  final List<String> genres;
  final String censorCertificate;
  final DateTime releaseDate;
  final String description;
  const MovieDetailsWidget(
      {super.key,
      required this.rating,
      required this.votes,
      required this.categories,
      required this.runtime,
      required this.genres,
      required this.censorCertificate,
      required this.releaseDate,
      required this.description});

  Widget getAdditionalDetailsWidgets(List<String> strings) {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < strings.length; i++) {
      list.add(
        Text(
          strings[i],
          style: const TextStyle(
              color: Color.fromRGBO(85, 85, 85, 1),
              fontSize: 10,
              fontWeight: FontWeight.normal),
        ),
      );
      list.add(
        const SizedBox(
          width: 4,
        ),
      );
    }
    return Row(children: list);
  }

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
    String formattedReleaseDate = DateFormat.yMd().format(releaseDate);
    String appendedGenres = appendGenres(genres);

    List<String> additionalDetails = <String>[];
    additionalDetails.add(runtime);
    additionalDetails.add(appendedGenres);
    additionalDetails.add(censorCertificate);
    additionalDetails.add(formattedReleaseDate);

    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      const SizedBox(
        width: double.infinity,
        height: 16,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 4,
              ),
              Icon(
                Icons.star,
                color: Colors.red[400],
                size: 18,
              ),
              const SizedBox(
                width: 4,
              ),
              Text('$rating/10',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                width: 4,
              ),
              Text('$votes votes',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Color.fromRGBO(85, 85, 85, 1),
                      fontSize: 10,
                      fontWeight: FontWeight.normal)),
              const SizedBox(width: 4),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color.fromRGBO(85, 85, 85, 1),
                size: 12,
              ),
            ],
          )
        ],
      ),
      const SizedBox(
        width: double.infinity,
        height: 16,
      ),
      Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
        padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blueGrey[50],
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Add your rating & review',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 10,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 4,
              ),
              Text('Your ratings matter',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Color.fromRGBO(85, 85, 85, 1),
                      fontSize: 10,
                      fontWeight: FontWeight.normal)),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: OutlinedButton(
                onPressed: () {},
                style: ButtonStyle(
                  side: MaterialStateProperty.all(
                    BorderSide(
                        color: (Colors.red[400])!,
                        width: 1.0,
                        style: BorderStyle.solid),
                  ),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4))),
                ),
                child: Text(
                  'Rate Now',
                  style: TextStyle(
                      color: Colors.red[400],
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                )),
          )
        ]),
      ),
      const SizedBox(
        width: double.infinity,
        height: 8,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [getCategoryWidgets(categories)],
      ),
      const SizedBox(
        width: double.infinity,
        height: 8,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          getAdditionalDetailsWidgets(additionalDetails),
        ],
      ),
      const SizedBox(
        height: 8,
      ),
      Text(
        description,
        textAlign: TextAlign.justify,
        style: const TextStyle(
            color: Colors.black, fontSize: 12, fontWeight: FontWeight.normal),
      ),
      const SizedBox(
        height: 12,
      ),
    ]);
  }
}
