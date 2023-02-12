// Package Dependencies
import 'package:flutter/material.dart';

// Widgets
import 'package:first_app/Widgets/Screens/HomeWidget.dart';
import 'package:first_app/Widgets/Screens/ProfileWidget.dart';

// Models
import '../../Models/Movie.dart';
import '../../Models/MovieDetails.dart';
import '../../Models/CastAndCrewProfile.dart';
import '../../Models/Review.dart';

class ViewControllerWidget extends StatefulWidget {
  const ViewControllerWidget({super.key});

  @override
  State<ViewControllerWidget> createState() => _ViewControllerWidgetState();
}

class _ViewControllerWidgetState extends State<ViewControllerWidget> {
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

  final Map<String, dynamic> flags = {'isNewRelease': true};

  late final List<Movie> movies = [
    Movie(
        name: name,
        posters: posters,
        additionalDetails: additionalDetails,
        castAndCrewProfiles: castAndCrewProfiles,
        reviews: reviews,
        trailerURLPath: trailerURLPath,
        flags: flags)
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      presentingBodyWidget(_selectedIndex);
    });
  }

  PreferredSizeWidget? presentingAppBarWidget(int index) {
    switch (index) {
      case 0:
        return AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "It All Starts Here",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Text(
                    "Chennai",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(Icons.chevron_right, color: Colors.grey, size: 14),
                ],
              ),
            ],
          ),
          backgroundColor: const Color.fromRGBO(28, 46, 74, 0.9),
          actions: const [
            Icon(
              Icons.search,
            ),
            SizedBox(
              width: 12,
            ),
            Icon(Icons.notifications_outlined),
            SizedBox(
              width: 12,
            ),
          ],
          toolbarHeight: 72,
        );
      case 1:
        return AppBar(
          backgroundColor: const Color.fromRGBO(28, 46, 74, 0.9),
          toolbarHeight: 72,
        );
    }
    return null;
  }

  Widget? presentingBodyWidget(int index) {
    switch (index) {
      case 0:
        return HomeWidget(movies: movies);
      case 1:
        return const ProfileWidget();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: presentingAppBarWidget(_selectedIndex),
      body: presentingBodyWidget(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red[400],
        unselectedItemColor: Colors.grey,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
