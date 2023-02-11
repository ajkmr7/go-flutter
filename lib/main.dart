// Package Dependencies
import 'package:flutter/material.dart';

// Widgets
import './Widgets/MovieWidget.dart';

// Models
import './Models/Movie.dart';
import './Models/MovieDetails.dart';
import './Models/CastAndCrewProfile.dart';
import './Models/Review.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final String name = 'Vikram';

  final List<String> posters = [
    'assets/images/carousel1.jpeg',
    'assets/images/carousel2.jpg',
    'assets/images/carousel3.jpeg',
    'assets/images/carousel4.jpeg',
  ];

  final MovieDetails additionalDetails = MovieDetails(
    rating: 9.5,
    votes: 241500,
    categories: ['2D', 'Tamil'],
    runtime: '2h 53m',
    genres: ['Action', 'Thriller'],
    censorCertificate: 'UA',
    releaseDate: DateTime(2022, 6, 3),
    description:
        'A high-octane action film where a special investigator is assigned a case of serial killings. As the investigation proceeds, he finds the case is not what it seems to be and leading down this path is only going to end in a war between everyone involved',
  );

  final List<CastAndCrewProfile> castAndCrewProfiles = [
    CastAndCrewProfile(
        name: 'Kamal Hasan',
        profilePicture: 'assets/images/kamal.jpeg',
        designation: 'Actor',
        associatedType: AssociatedType.cast),
    CastAndCrewProfile(
        name: 'Fahadh Fasil',
        profilePicture: 'assets/images/fafa.jpeg',
        designation: 'Actor',
        associatedType: AssociatedType.cast),
    CastAndCrewProfile(
        name: 'Vijay Sethupathi',
        profilePicture: 'assets/images/vjs.jpeg',
        designation: 'Actor',
        associatedType: AssociatedType.cast),
    CastAndCrewProfile(
        name: 'Suriya',
        profilePicture: 'assets/images/suriya.jpeg',
        designation: 'Actor',
        associatedType: AssociatedType.cast),
    CastAndCrewProfile(
        name: 'Arjun Das',
        profilePicture: 'assets/images/arjundas.jpeg',
        designation: 'Actor',
        associatedType: AssociatedType.cast),
    CastAndCrewProfile(
        name: 'Chemban Vinod',
        profilePicture: 'assets/images/chembi.jpg',
        designation: 'Actor',
        associatedType: AssociatedType.cast),
    CastAndCrewProfile(
        name: 'Lokesh K',
        profilePicture: 'assets/images/lokesh.jpeg',
        designation: 'Actor',
        associatedType: AssociatedType.crew),
    CastAndCrewProfile(
        name: 'Kamal Hasan',
        profilePicture: 'assets/images/kamal.jpeg',
        designation: 'Actor',
        associatedType: AssociatedType.crew),
    CastAndCrewProfile(
        name: 'Rathna K',
        profilePicture: 'assets/images/rathna.jpeg',
        designation: 'Actor',
        associatedType: AssociatedType.crew),
    CastAndCrewProfile(
        name: 'Anirudh R',
        profilePicture: 'assets/images/anirudh.jpeg',
        designation: 'Actor',
        associatedType: AssociatedType.crew),
    CastAndCrewProfile(
        name: 'Girish G',
        profilePicture: 'assets/images/girish.jpeg',
        designation: 'Actor',
        associatedType: AssociatedType.crew),
  ];

  final List<Review> reviews = [
    Review(
        reviewerName: 'Ajay',
        rating: 10,
        reviewComments:
            'This is entirely a Lokesh Kanagaraj film. He is cooking something big LCU',
        likeCount: 123,
        date: DateTime(2022, 6, 3)),
    Review(
        reviewerName: 'Deepak',
        rating: 9,
        reviewComments:
            'This is entirely a Lokesh Kanagaraj film. He is cooking something big LCU. This is entirely a Lokesh Kanagaraj film. He is cooking something big LCU.',
        likeCount: 99,
        date: DateTime(2023, 1, 1)),
    Review(
        reviewerName: 'Arun',
        rating: 8,
        reviewComments:
            'This is entirely a Lokesh Kanagaraj film. He is cooking something big LCU. This is entirely a Lokesh Kanagaraj film. He is cooking something big LCU',
        likeCount: 144,
        date: DateTime(2022, 7, 30)),
    Review(
        reviewerName: 'Hari',
        rating: 9,
        reviewComments:
            'This is entirely a Lokesh Kanagaraj film. He is cooking something big LCU',
        likeCount: 89,
        date: DateTime(2022, 9, 13)),
  ];

  final String trailerURLPath = 'OKBMCL-frPU';

  late final Movie movie = Movie(
      name: name,
      posters: posters,
      additionalDetails: additionalDetails,
      castAndCrewProfiles: castAndCrewProfiles,
      reviews: reviews,
      trailerURLPath: trailerURLPath);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MovieWidget(movie: movie),
    );
  }
}
