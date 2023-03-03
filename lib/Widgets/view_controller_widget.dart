// Package Dependencies
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

// Widgets
import 'package:first_app/widgets/screens/home_widget.dart';
import 'package:first_app/widgets/screens/profile_widget.dart';

// Models
import '../models/movie.dart';

// Theme
import 'package:first_app/resources/theme/custom_icons.dart';
import 'package:first_app/resources/theme/color.dart';

class ViewControllerWidget extends StatefulWidget {
  const ViewControllerWidget({super.key});

  @override
  State<ViewControllerWidget> createState() => _ViewControllerWidgetState();
}

class _ViewControllerWidgetState extends State<ViewControllerWidget> {
  Future<Movies> parseMoviesJSON() async {
    final String response =
        await rootBundle.loadString('assets/mocks/Movies.json');
    var data = json.decode(response);
    var movies = Movies.fromJson(data);
    return movies;
  }

  PreferredSizeWidget? presentingAppBarWidget(int index) {
    switch (index) {
      case 0:
        return AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "It All Starts Here",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text("Chennai", style: Theme.of(context).textTheme.bodyText2),
                  const SizedBox(
                    width: 4,
                  )
                ],
              ),
            ],
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          actions: const [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Icon(
                CustomIcons.search,
                color: textPrimary,
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(
                CustomIcons.notification,
                color: textPrimary,
              ),
            ),
            SizedBox(height: 8),
          ],
          toolbarHeight: 88,
        );
      case 1:
        return AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          toolbarHeight: 88,
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
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: presentingAppBarWidget(0),
      body: presentingBodyWidget(0),
    );
  }
}
