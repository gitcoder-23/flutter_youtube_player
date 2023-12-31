import 'package:flutter/material.dart';
import 'package:flutter_youtube_player/screens/YoutubePlayerIframe.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MainPlayerHome extends StatefulWidget {
  const MainPlayerHome({super.key});

  @override
  State<MainPlayerHome> createState() => _MainPlayerHomeState();
}

class _MainPlayerHomeState extends State<MainPlayerHome> {
  final videoUrl = "https://www.youtube.com/watch?v=FV3bqvOHRQo&ab_channel=DC";

  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);

    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Youtube Player'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            child: Text(
              'Youtube Player Without Iframe',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: () => debugPrint('Ready'),
            onEnded: (metaData) {},
            bottomActions: [
              CurrentPosition(),
              ProgressBar(
                isExpanded: true,
                colors: const ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
              ),
              const PlaybackSpeedButton()
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          // Using IFRAME
          const YoutubePlayerIframe(),
        ],
      ),
    );
  }
}
