// Package Dependencies
import 'package:first_app/resources/utitlity/number_formatter.dart';
import 'package:flutter/material.dart';

// Constants
import 'package:first_app/resources/utitlity/constants.dart';
import 'package:first_app/resources/utitlity/constants_extensions.dart';

// Models
import 'package:first_app/models/movie.dart';

// Theme
import '../../../resources/components/category.dart';
import '../../../resources/components/rating.dart';
import '../../../resources/components/additional_detail.dart';

// Utitlity

class MovieDetailsWidget extends StatelessWidget {
  final Movie movie;
  const MovieDetailsWidget({super.key, required this.movie});

  Widget getCategoryWidgets(List<MovieCategory> categories) {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < categories.length; i++) {
      list.add(Category(text: categories[i].getName()));
      list.add(
        const SizedBox(
          width: 4,
        ),
      );
    }
    return Row(children: list);
  }

  Widget getAdditionalDetailWidgets() {
    List<Widget> list = <Widget>[];
    list.add(AdditonalDetail(
        title: "Time", subTitle: movie.additionalDetails.runtime));
    list.add(AdditonalDetail(
        title: "Votes",
        subTitle: NumberFormatter.format(movie.additionalDetails.votes)));
    list.add(AdditonalDetail(
        title: "Certificate",
        subTitle: movie.additionalDetails.censorCertificate.getName()));
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, children: list);
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
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(movie.name,
                            style: Theme.of(context).textTheme.displayMedium),
                        const SizedBox(
                          height: 8,
                        ),
                        getCategoryWidgets(movie.additionalDetails.categories),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          appendedGenres,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ]),
                ]),
            Rating(text: 'IMDB ${movie.additionalDetails.rating.toString()}')
          ]),
          const SizedBox(
            height: 24,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            getAdditionalDetailWidgets(),
          ]),
        ],
      ),
    );
  }
}
