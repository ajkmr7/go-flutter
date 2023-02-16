// Package Dependencies
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerWidget extends StatefulWidget {
  final String movieName;
  final String movieTrailerURLPath;

  const TrailerWidget(
      {super.key, required this.movieName, required this.movieTrailerURLPath});

  @override
  State<TrailerWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<TrailerWidget> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.movieTrailerURLPath,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        forceHD: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title: Text(
          widget.movieName,
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            progressColors: ProgressBarColors(
                backgroundColor: Colors.white,
                playedColor: Colors.red[400],
                bufferedColor: Colors.grey),
            controller: _controller,
          ),
          builder: (context, player) {
            return Column(
              children: [player],
            );
          },
        ),
      ),
    );
  }
}
