import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import 'MovieDetailsWidget.dart';
import 'CastAndCrewProfileWidget.dart';
import 'ReviewWidget.dart';
import 'SimilarMovieWidget.dart';

import '../Models/Movie.dart';
import '../Models/CastAndCrewProfile.dart';
import '../Models/Review.dart';

class MovieWidget extends StatefulWidget {
  const MovieWidget({super.key, required this.movie});

  final Movie movie;

  @override
  State<MovieWidget> createState() => _MovieWidgetState();
}

class _MovieWidgetState extends State<MovieWidget> {
  Widget getReviewWidgets(List<Review> reviewList) {
    List<Widget> list = <Widget>[];
    for (final review in reviewList) {
      list.add(ReviewWidget(
        reviewerName: review.reviewerName,
        rating: review.rating,
        reviewComments: review.reviewComments,
        likeCount: review.likeCount,
        date: review.date,
      ));
      list.add(const SizedBox(width: 24));
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: list),
    );
  }

  Widget getCastAndCrewProfileWidgets(
      List<CastAndCrewProfile> castAndCrewProfiles,
      AssociatedType associatedType) {
    List<Widget> list = <Widget>[];
    for (final castAndCrewProfile in castAndCrewProfiles) {
      if (castAndCrewProfile.associatedType == associatedType) {
        list.add(CastAndCrewProfileWidget(
          name: castAndCrewProfile.name,
          profilePicture: castAndCrewProfile.profilePicture,
          designation: castAndCrewProfile.designation,
        ));
        list.add(
          const SizedBox(
            width: 8,
          ),
        );
      }
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: list),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(16, 32, 16, 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: double.infinity,
                  height: 16,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayAnimationDuration: const Duration(seconds: 4),
                      autoPlayInterval: const Duration(seconds: 4)),
                  items: widget.movie.posters.map((poster) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                          child: Material(
                            shadowColor: const Color.fromRGBO(0, 0, 0, 0.1),
                            borderRadius: BorderRadius.circular(20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.asset(poster),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                MovieDetailsWidget(
                    categories: widget.movie.additionalDetails.categories,
                    rating: widget.movie.additionalDetails.rating,
                    votes: widget.movie.additionalDetails.votes,
                    runtime: widget.movie.additionalDetails.runtime,
                    genres: widget.movie.additionalDetails.genres,
                    censorCertificate:
                        widget.movie.additionalDetails.censorCertificate,
                    releaseDate: widget.movie.additionalDetails.releaseDate,
                    description: widget.movie.additionalDetails.description),
                const Divider(
                  color: Color.fromRGBO(85, 85, 85, 1),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Cast',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                getCastAndCrewProfileWidgets(
                    widget.movie.castAndCrewProfiles, AssociatedType.cast),
                const SizedBox(
                  height: 12,
                ),
                const Divider(
                  color: Color.fromRGBO(85, 85, 85, 1),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Crew',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                getCastAndCrewProfileWidgets(
                    widget.movie.castAndCrewProfiles, AssociatedType.crew),
                const SizedBox(
                  height: 12,
                ),
                const Divider(
                  color: Color.fromRGBO(85, 85, 85, 1),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Top reviews',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '135.8K reviews',
                          style: TextStyle(
                              color: Colors.red[400],
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.red[400],
                          size: 12,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                getReviewWidgets(widget.movie.reviews),
                const SizedBox(
                  height: 12,
                ),
                const Divider(
                  color: Color.fromRGBO(85, 85, 85, 1),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'You might also like',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'View all',
                          style: TextStyle(
                              color: Colors.red[400],
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.red[400],
                          size: 12,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      SimilarMovieWidget(
                          name: "Kaithi", poster: 'assets/images/kaithi.jpg'),
                      SizedBox(
                        width: 16,
                      ),
                      SimilarMovieWidget(
                          name: "Master", poster: 'assets/images/master.jpeg'),
                      SizedBox(
                        width: 16,
                      ),
                      SimilarMovieWidget(
                          name: "Maanagaram",
                          poster: 'assets/images/maanagaram.jpeg'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
