// Package Dependencies
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

// Widgets
import 'package:first_app/Widgets/Screens/HomeWidget.dart';
import 'package:first_app/Widgets/Screens/ProfileWidget.dart';

// Models
import '../Models/Movie.dart';

class ViewControllerWidget extends StatefulWidget {
  const ViewControllerWidget({super.key});

  @override
  State<ViewControllerWidget> createState() => _ViewControllerWidgetState();
}

class _ViewControllerWidgetState extends State<ViewControllerWidget> {
  Future<Movies> parseMoviesJSON() async {
    final String response =
        await rootBundle.loadString('assets/mocks/NowShowing.json');
    var data = json.decode(response);
    var movies = Movies.fromJson(data);
    return movies;
  }

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
        return FutureBuilder<Movies>(
          future: parseMoviesJSON(),
          builder: (
            BuildContext context,
            AsyncSnapshot<Movies> snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              const Center(child: CircularProgressIndicator(color: Colors.red));
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return HomeWidget(movies: snapshot.data!);
              } else if (snapshot.hasError) {
                Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                const Center(
                  child: Text("Empty Data"),
                );
              }
            } else {
              return Center(child: Text('State: ${snapshot.connectionState}'));
            }
            return Container();
          },
        );
      case 1:
        return const ProfileWidget();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: presentingAppBarWidget(_selectedIndex),
      body: presentingBodyWidget(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
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
