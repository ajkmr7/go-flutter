// Package Dependencies
import 'package:first_app/resources/components/button.dart';
import 'package:first_app/resources/components/category.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// Constants
import 'package:first_app/resources/utitlity/constants.dart';
import 'package:first_app/resources/utitlity/constants_extensions.dart';

// Models
import '../../../models/movie.dart';

// Widgets
import 'package:first_app/widgets/screens/movie_widget.dart';

// Theme
import 'package:first_app/resources/theme/color.dart';

class NewReleaseBannerWidget extends StatefulWidget {
  final Movie movie;
  const NewReleaseBannerWidget({super.key, required this.movie});

  @override
  State<NewReleaseBannerWidget> createState() => _NewReleaseBannerWidgetState();
}

class _NewReleaseBannerWidgetState extends State<NewReleaseBannerWidget> {
  late YoutubePlayerController _controller;
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
    String appendedGenres = appendGenres(widget.movie.additionalDetails.genres);
    return Column(
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
        const SizedBox(height: 16),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0x99C12C2C),
                        otherSecondary,
                      ],
                    ),
                  ),
                  child: const Text(
                    'NEW RELEASE',
                    style: TextStyle(
                        fontFamily: 'NunitoSans',
                        color: textPrimary,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 12, 0, 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.movie.name,
                            style: Theme.of(context).textTheme.titleMedium),
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
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ]),
                ),
              ]),
          Container(
              margin: const EdgeInsets.all(16),
              child: CustomButton(
                  text: "BOOK",
                  buttonType: ButtonType.small,
                  onPressed: () => {}))
        ]),
      ],
    );
  }
}
