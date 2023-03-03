// Package Dependencies
import 'package:first_app/resources/components/custom_slider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

// Theme
import '../../resources/theme/color.dart';

// Widgets
import '../components/movie/movie_details_widget.dart';
import '../components/movie/cast_and_crew_profile_widget.dart';

// Models
import '../../models/movie.dart';
import '../../models/cast_and_crew_profile.dart';

class MovieWidget extends StatefulWidget {
  const MovieWidget({super.key, required this.movie});

  final Movie movie;

  @override
  State<MovieWidget> createState() => _MovieWidgetState();
}

class _MovieWidgetState extends State<MovieWidget> {
  late YoutubePlayerController _controller;

  Future<CastAndCrewProfiles> parseCastAndCrewProfilesJSON() async {
    final String response = await rootBundle
        .loadString('assets/mocks/Movies/${widget.movie.id}.json');
    var data = json.decode(response);
    var castAndCrewProfiles = CastAndCrewProfiles.fromJson(data);
    return castAndCrewProfiles;
  }

  Widget getCastAndCrewProfileWidgets(CastAndCrewProfiles castAndCrewProfiles) {
    List<Widget> list = <Widget>[];
    for (final castAndCrewProfile in castAndCrewProfiles.castAndCrewProfiles) {
      list.add(CastAndCrewProfileWidget(
        name: castAndCrewProfile.name,
        profilePicture: castAndCrewProfile.profilePicture,
        designation: castAndCrewProfile.designation,
      ));
      list.add(
        const SizedBox(
          width: 12,
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: list),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.movie.trailerURLPath,
      flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          forceHD: true,
          controlsVisibleAtStart: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          toolbarHeight: 88,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  YoutubePlayerBuilder(
                    player: YoutubePlayer(
                      progressColors: const ProgressBarColors(
                          handleColor: otherSecondary,
                          backgroundColor: textPrimary,
                          playedColor: otherSecondary,
                          bufferedColor: brandSecondary),
                      controller: _controller,
                    ),
                    builder: (context, player) {
                      return Column(
                        children: [player],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  MovieDetailsWidget(
                    movie: widget.movie,
                  ),
                  const SizedBox(
                    height: 24,
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
                  FutureBuilder<CastAndCrewProfiles>(
                    future: parseCastAndCrewProfilesJSON(),
                    builder: (
                      BuildContext context,
                      AsyncSnapshot<CastAndCrewProfiles> snapshot,
                    ) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        const Center(
                            child:
                                CircularProgressIndicator(color: Colors.red));
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        if (snapshot.hasData) {
                          return CustomSlider(avatars: snapshot.data!);
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
                        return Center(
                            child: Text('State: ${snapshot.connectionState}'));
                      }
                      return Container();
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(
                            fontFamily: 'NunitoSans',
                            color: textPrimary.withAlpha((0.6 * 255).round()),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(widget.movie.additionalDetails.description,
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
